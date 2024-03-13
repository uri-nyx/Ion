/*******************************************************************************
 *
 * A minimal Forth compiler in C
 * By Leif Bruder <leifbruder@gmail.com> http://defineanswer42.wordpress.com
 * Release 2014-04-04
 *
 * Based on Richard W.M. Jones' excellent Jonesforth sources/tutorial
 *
 * PUBLIC DOMAIN
 *
 * I, the copyright holder of this work, hereby release it into the public
 * domain. This applies worldwide. In case this is not legally possible, I grant
 * any entity the right to use this work for any purpose, without any
 *conditions, unless such conditions are required by law.
 *
 *******************************************************************************/

#include "sys.h"

/* This is the main memory to be used by this Forth. There will be no malloc
 * in this file. */
byte memory[MEM_SIZE];

/* Pointers to Forth variables stored inside the main memory array */
cell *latest;
cell *here;
cell *base;
cell *state;
cell *sp;
cell *stack;
cell *rsp;
cell *rstack;
cell *sbuf;

/* A few helper variables for the compiler */
int  exitReq;
int  errorFlag;
int  supress_ok = 0;
cell next;
cell lastIp;
cell quit_address;
cell commandAddress;
cell maxBuiltinAddress;

/* The TIB, stored outside the main memory array for now */
char lineBuffer[128];
int  charsInLineBuffer    = 0;
int  positionInLineBuffer = 0;

/* A basic setup for defining builtins. This Forth uses impossibly low
 * adresses as IDs for the builtins so we can define builtins as
 * standard C functions. Slower but easier to port. */
#define BUILTIN(id, name, c_name, flags)    \
        const int   c_name##_id    = id;    \
        const char *c_name##_name  = name;  \
        const byte  c_name##_flags = flags; \
        void        c_name()
#define ADD_BUILTIN(c_name) \
        addBuiltin(c_name##_id, c_name##_name, c_name##_flags, c_name)
typedef void (*builtin)();
builtin builtins[MAX_BUILTIN_ID] = { 0 };

/* This is our initialization script containing all the words we define in
 * Forth for convenience. Focus is on simplicity, not speed. Partly copied from
 * Jonesforth (see top of file). */
char       *initscript_pos;
const char *initScript =
#include "initscript.h"
        "\n";

const char *initScript2 =
#include "initscript2.h"
        "\r";

int    script = 0;
char **scripts;
/******************************************************************************/
void        tell(const char *);
extern void txtmod_putc(char c);
/* The primary data output function. This is the place to change if you want
 * to e.g. output data on a microcontroller via a serial interface. */
#define putkey(c) txtmod_putc(c)

void n2s(byte n, char *s)
{
        if (n < 10) {
                s[0] = n + '0';
                s[1] = 0;
        } else if (n < 100) {
                s[0] = (n / 10) + '0';
                s[1] = (n % 10) + '0';
                s[2] = 0;
        } else {
                s[0] = (n / 100) + '0';
                s[1] = (n % 100) / 10 + '0';
                s[2] = (n % 10) + '0';
                s[3] = 0;
        }
}

extern int _getchar(void);
/* The primary data input function. This is where you place the code to e.g.
 * read from a serial line. */
int llkey()
{
        int c;
        if (*initscript_pos) {
                if (*initscript_pos == '\n')
                        initscript_pos = (char *)initScript2;
                return *(initscript_pos++);
        }
        c = _getchar();
        if (c != 0xd)
                putkey(c);
        else
                putkey(' ');
        return c;
}

/* Anything waiting in the keyboard buffer? */
int keyWaiting()
{
        return positionInLineBuffer < charsInLineBuffer ? -1 : 0;
}

void diskio();
void from_screen(scell line)
{
        int  i;
        cell screen = hw_lhud(1072);
        cell offset = hw_lhud(1080);
        cell block  = screen * 2 + offset + 1 + (line >= 4 ? 1 : 0);
        cell addr   = 0;

        supress_ok = 1;

        for (i = 0; i < BLOCK_BUFFERS * 2; i += 2) {
                if ((sbuf[i] & 0x7fff) == (block & 0x7fff)) {
                        addr = sbuf[i + 1];
                        break;
                }
        }

        if (!addr) {
                hw_shd(1068, 1);
                for (i = 0; i < BLOCK_BUFFERS * 2; i += 2) {
                        if (sbuf[i] == 0) {
                                sbuf[i] = block & 0x7fff;
                                addr    = sbuf[i + 1];
                                hw_shd(1056, addr);
                                hw_shd(1064, block - 1);
                                diskio();
                                break;
                        }
                }
        }

        if (!addr) {
                errorFlag = 1;
                tell("Error: buffers full\n");
                return;
        }

        if (line >= 4)
                addr += (line - 4) * 128;
        else
                addr += line * 128;

        hw_copy(&memory[addr], lineBuffer, 128);
        positionInLineBuffer = 0;
        charsInLineBuffer    = 128;

        line++;
        if (line == 8) {
                supress_ok = 0;
                line       = -1;
        }

        hw_shd(1076, (unsigned)line);
}

/* Line buffered character input. We're duplicating the functionality of the
 * stdio library here to make the code easier to port to other input sources */
int getkey()
{
        int   c;
        scell line = hw_lhd(1076);

keywait:
        if (keyWaiting())
                return lineBuffer[positionInLineBuffer++];

        if (line >= 0) {
                from_screen(line);
                goto keywait;
        }

        charsInLineBuffer = 0;
        while ((c = llkey()) != EOF) {
                if (c == '\b' && charsInLineBuffer) {
                        lineBuffer[--charsInLineBuffer] = 0;
                        continue;
                }
                if (charsInLineBuffer == sizeof(lineBuffer))
                        break;
                lineBuffer[charsInLineBuffer++] = c;
                if (c == LN)
                        break;
        }

        positionInLineBuffer = 1;
        return lineBuffer[0];
}

/* C string output */
void tell(const char *str)
{
        while (*str)
                putkey(*str++);
}

/* The basic (data) stack operations */

cell pop()
{
        if (*sp == 1) {
                tell("? Stack underflow\n");
                errorFlag = 1;
                return 0;
        }
        return stack[--(*sp)];
}

cell tos()
{
        if (*sp == 1) {
                tell("? Stack underflow\n");
                errorFlag = 1;
                return 0;
        }
        return stack[(*sp) - 1];
}

void push(cell data)
{
        if (*sp >= STACK_SIZE) {
                tell("? Stack overflow\n");
                errorFlag = 1;
                return;
        }
        stack[(*sp)++] = data;
}

dcell dpop()
{
        cell tmp[2];
        tmp[1] = pop();
        tmp[0] = pop();
        return *((dcell *)tmp);
}

void dpush(dcell data)
{
        cell tmp[2];
        *((dcell *)tmp) = data;
        push(tmp[0]);
        push(tmp[1]);
}

/* The basic return stack operations */

cell rpop()
{
        if (*rsp == 1) {
                tell("? RStack underflow\n");
                errorFlag = 1;
                return 0;
        }
        return rstack[--(*rsp)];
}

void rpush(cell data)
{
        if (*rsp >= RSTACK_SIZE) {
                tell("? RStack overflow\n");
                errorFlag = 1;
                return;
        }
        rstack[(*rsp)++] = data;
}

/* Secure memory access */

cell readMem(cell address)
{
        if (address > MEM_SIZE) {
                tell("Internal error in readMem: Invalid addres\n");
                errorFlag = 1;
                return 0;
        }
        return *((cell *)(memory + address));
}

void writeMem(cell address, cell value)
{
        if (address > MEM_SIZE) {
                tell("Internal error in writeMem: Invalid address\n");
                errorFlag = 1;
                return;
        }
        *((cell *)(memory + address)) = value;
}

/* Reading a word into the input line buffer */
byte readWord()
{
        char *line = (char *)memory;
        byte  len  = 0;
        int   c;
        byte  separator = hw_lbud(1084);

        while ((c = getkey()) != EOF) {
                if (c == ' ')
                        continue;
                if (c == LN)
                        break;
                if (c != '\\')
                        break;

                while ((c = getkey()) != EOF)
                        if (c == LN)
                                break;
        }

        while (c != separator && c != LN && c != EOF) {
                if (len >= (INPUT_LINE_SIZE - 1))
                        break;
                line[++len] = c;
                c           = getkey();
        }
        line[0] = len;
        hw_sbd(1084, ' ');
        return len;
}

/* toupper() clone so we don't have to pull in ctype.h */
char up(char c)
{
        return (c >= 'a' && c <= 'z') ? c - 'a' + 'A' : c;
}

/* for cmove> */
void copy_bytes_up(byte *dest, const byte *src, unsigned long size)
{
        unsigned long i;
        /* Ensure the pointers are not NULL and size is not zero */
        if (!dest || !src || size == 0)
                return;

        /* Start copying from the end of the buffer */
        for (i = size; i > 0; i--) {
                dest[i - 1] = src[i - 1];
        }
}

/* Dictionary lookup */
cell findWord(cell address, cell len)
{
        cell  ret  = *latest;
        char *name = (char *)&memory[address];
        cell  i;
        int   found;

        if (len == 0)
                return 0;

        for (ret = *latest; ret; ret = readMem(ret)) {
                if ((memory[ret + CELL_SIZE] & MASK_NAMELENGTH) != len)
                        continue;
                if (memory[ret + CELL_SIZE] & FLAG_HIDDEN)
                        continue;

                found = 1;
                for (i = 0; i < len; i++) {
                        if (up(memory[ret + i + 1 + CELL_SIZE]) !=
                            up(name[i])) {
                                found = 0;
                                break;
                        }
                }
                if (found)
                        break;
        }

        return ret;
}

/* Basic number parsing, base <= 36 only atm */
void parseNumber(byte *word, cell len, dcell *number, cell *notRead,
                 byte *isDouble)
{
        int  negative = 0;
        cell i;
        char c;
        cell current;

        *number   = 0;
        *isDouble = 0;

        if (len == 0) {
                *notRead = 0;
                return;
        }

        if (word[0] == '-') {
                negative = 1;
                len--;
                word++;
        } else if (word[0] == '+') {
                len--;
                word++;
        }

        for (i = 0; i < len; i++) {
                c = *word;
                word++;
                if (c == '.') {
                        *isDouble = 1;
                        continue;
                } else if (c >= '0' && c <= '9')
                        current = c - '0';
                else if (c >= 'A' && c <= 'Z')
                        current = 10 + c - 'A';
                else if (c >= 'a' && c <= 'z')
                        current = 10 + c - 'a';
                else
                        break;

                if (current >= *base)
                        break;

                *number = *number * *base + current;
        }

        *notRead = len - i;
        if (negative)
                *number = (-((scell)*number));
}

/*******************************************************************************
 *
 * Builtin definitions
 *
 *******************************************************************************/

BUILTIN(0, "RUNDOCOL", docol, 0)
{
        rpush(lastIp);
        next = commandAddress + CELL_SIZE;
}

/* The first few builtins are very simple, not need to waste vertical space here
 */
BUILTIN(1, "CELL", doCellSize, 0)
{
        push(CELL_SIZE);
}
BUILTIN(2, "@", memRead, 0)
{
        push(readMem(pop()));
}
BUILTIN(3, "C@", memReadByte, 0)
{
        push(memory[pop()]);
}
BUILTIN(4, "KEY", key, 0)
{
        push(getkey());
}
BUILTIN(5, "EMIT", emit, 0)
{
        putkey(pop() & 255);
}
BUILTIN(6, "DROP", drop, 0)
{
        pop();
}
BUILTIN(7, "EXIT", doExit, 0)
{
        next = rpop();
}
BUILTIN(8, "BYE", bye, 0)
{
        exitReq = 1;
}
BUILTIN(9, "LATEST", doLatest, 0)
{
        push(LATEST_POSITION);
}
BUILTIN(10, "HERE", doHere, 0)
{
        push(HERE_POSITION);
}
BUILTIN(11, "BASE", doBase, 0)
{
        push(BASE_POSITION);
}
BUILTIN(12, "STATE", doState, 0)
{
        push(STATE_POSITION);
}
BUILTIN(13, "[", gotoInterpreter, FLAG_IMMEDIATE)
{
        *state = 0;
}
BUILTIN(14, "]", gotoCompiler, 0)
{
        *state = 1;
}
BUILTIN(15, "HIDE", hide, 0)
{
        memory[*latest + CELL_SIZE] ^= FLAG_HIDDEN;
}
BUILTIN(16, "R>", rtos, 0)
{
        push(rpop());
}
BUILTIN(17, ">R", stor, 0)
{
        rpush(pop());
}
BUILTIN(18, "KEY?", key_p, 0)
{
        push(keyWaiting());
}
BUILTIN(19, "BRANCH", branch, 0)
{
        next += readMem(next);
}
BUILTIN(20, "0BRANCH", zbranch, 0)
{
        next += pop() ? CELL_SIZE : readMem(next);
}
BUILTIN(21, "IMMEDIATE", toggleImmediate, FLAG_IMMEDIATE)
{
        memory[*latest + CELL_SIZE] ^= FLAG_IMMEDIATE;
}
BUILTIN(22, "FREE", doFree, 0)
{
        push(MEM_SIZE - *here);
}
BUILTIN(23, "S0@", s0_r, 0)
{
        push(STACK_POSITION + CELL_SIZE);
}
BUILTIN(24, "DSP@", dsp_r, 0)
{
        push(STACK_POSITION + *sp * CELL_SIZE);
}
BUILTIN(25, "NOT", not, 0)
{
        push(~pop());
}
BUILTIN(26, "DUP", dup, 0)
{
        push(tos());
}

BUILTIN(27, "!", memWrite, 0)
{
        cell address = pop();
        cell value   = pop();
        writeMem(address, value);
}

BUILTIN(28, "C!", memWriteByte, 0)
{
        cell address    = pop();
        cell value      = pop();
        memory[address] = value & 255;
}

BUILTIN(29, "SWAP", swap, 0)
{
        cell a = pop();
        cell b = pop();
        push(a);
        push(b);
}

BUILTIN(30, "OVER", over, 0)
{
        cell a = pop();
        cell b = tos();
        push(a);
        push(b);
}

BUILTIN(31, ",", comma, 0)
{
        push(*here);
        memWrite();
        *here += CELL_SIZE;
}

BUILTIN(32, "C,", commaByte, 0)
{
        push(*here);
        memWriteByte();
        *here += sizeof(byte);
}

BUILTIN(33, "WORD", word, 0)
{
        byte len = readWord();
        push(1);
        push(len);
}

cell getCfa(cell address);
BUILTIN(34, "FIND", find, 0)
{
        cell len     = pop();
        cell address = pop();
        cell ret     = findWord(address, len);
        push(ret);
}

cell getCfa(cell address)
{
        byte len = (memory[address + CELL_SIZE] & MASK_NAMELENGTH) + 1;
        while ((len & (CELL_SIZE - 1)) != 0)
                len++;
        return address + CELL_SIZE + len;
}

BUILTIN(35, ">CFA", cfa, 0)
{
        cell address = pop();
        cell ret     = getCfa(address);
        if (ret < maxBuiltinAddress)
                push(readMem(ret));
        else
                push(ret);
}

BUILTIN(36, "NUMBER", number, 0)
{
        dcell num;
        cell  notRead;
        byte  isDouble;
        cell  len     = pop();
        byte *address = &memory[pop()];
        parseNumber(address, len, &num, &notRead, &isDouble);
        if (isDouble)
                dpush(num);
        else
                push((cell)num);
        push(notRead);
}

BUILTIN(37, "LIT", lit, 0)
{
        push(readMem(next));
        next += CELL_SIZE;
}

/* Outer and inner interpreter, TODO split up */
BUILTIN(38, "QUIT", quit, 0)
{
        cell  address;
        dcell number;
        cell  notRead;
        cell  command;
        int   i;
        byte  isDouble;
        cell  tmp[2];
        int   immediate;
        byte  prev_color;

        for (exitReq = 0; exitReq == 0;) {
                lastIp = next = quit_address;
                errorFlag     = 0;

                word();
                find();

                address = pop();
                if (address) {
                        immediate =
                                (memory[address + CELL_SIZE] & FLAG_IMMEDIATE);
                        commandAddress = getCfa(address);
                        command        = readMem(commandAddress);
                        if (*state && !immediate) {
                                if (command < MAX_BUILTIN_ID &&
                                    command != docol_id)
                                        push(command);
                                else
                                        push(commandAddress);
                                comma();
                        } else {
                                while (!errorFlag && !exitReq) {
                                        if (command == quit_id) {
                                                break;
                                        } else if (command < MAX_BUILTIN_ID) {
                                                builtins[command]();
                                        } else {
                                                lastIp = next;
                                                next   = command;
                                        }

                                        commandAddress = next;
                                        command = readMem(commandAddress);
                                        next += CELL_SIZE;
                                }
                        }

                } else {
                        if (memory[0] == 0 /*len*/)
                                goto end;
                        parseNumber(&memory[1], memory[0], &number, &notRead,
                                    &isDouble);
                        if (notRead) {
                                tell("Unknown word: ");
                                for (i = 0; i < memory[0]; i++)
                                        putkey(memory[i + 1]);
                                putkey(LN);

                                *sp = *rsp = 1;
                                continue;
                        } else {
                                if (*state) {
                                        *((dcell *)tmp) = number;
                                        push(lit_id);
                                        comma();

                                        if (isDouble) {
                                                push(tmp[0]);
                                                comma();
                                                push(lit_id);
                                                comma();
                                                push(tmp[1]);
                                                comma();
                                        } else {
                                                push((cell)number);
                                                comma();
                                        }
                                } else {
                                        if (isDouble)
                                                dpush(number);
                                        else
                                                push((cell)number);
                                }
                        }
                }

end:
                if (errorFlag)
                        *sp = *rsp = 1;
                else if (!keyWaiting() && !(*initscript_pos) && !supress_ok) {
                        prev_color = terminal_ctx[3];
                        terminal_ctx[3] &= 0xf7;
                        tell("  ok\n");
                        terminal_ctx[3] = prev_color;
                }
        }
}

BUILTIN(39, "+", plus, 0)
{
        scell n1 = pop();
        scell n2 = pop();
        push(n1 + n2);
}

BUILTIN(40, "-", minus, 0)
{
        scell n1 = pop();
        scell n2 = pop();
        push(n2 - n1);
}

BUILTIN(41, "*", mul, 0)
{
        scell n1 = pop();
        scell n2 = pop();
        push(n1 * n2);
}

BUILTIN(42, "/MOD", divmod, 0)
{
        scell n1 = pop();
        scell n2 = pop();
        push(n2 % n1);
        push(n2 / n1);
}

BUILTIN(43, "ROT", rot, 0)
{
        cell a = pop();
        cell b = pop();
        cell c = pop();
        push(b);
        push(a);
        push(c);
}

void createWord(const char *name, byte len, byte flags);
BUILTIN(44, "CREATE", doCreate, 0)
{
        byte len;
        cell address;
        word();
        len     = pop() & 255;
        address = pop();
        createWord((char *)&memory[address], len, 0);
}

BUILTIN(45, ":", colon, 0)
{
        doCreate();
        push(docol_id);
        comma();
        hide();
        *state = 1;
}

BUILTIN(46, ";", semicolon, FLAG_IMMEDIATE)
{
        push(doExit_id);
        comma();
        hide();
        *state = 0;
}

BUILTIN(47, "R@", rget, 0)
{
        cell tmp = rpop();
        rpush(tmp);
        push(tmp);
}

BUILTIN(48, "J", doJ, 0)
{
        cell tmp1 = rpop();
        cell tmp2 = rpop();
        cell tmp3 = rpop();
        rpush(tmp3);
        rpush(tmp2);
        rpush(tmp1);
        push(tmp3);
}

BUILTIN(49, "'", tick, FLAG_IMMEDIATE)
{
        word();
        find();
        cfa();

        if (*state) {
                push(lit_id);
                comma();
                comma();
        }
}

BUILTIN(50, "=", equals, 0)
{
        cell a1 = pop();
        cell a2 = pop();
        push(a2 == a1 ? -1 : 0);
}

BUILTIN(51, "<", smaller, 0)
{
        scell a1 = pop();
        scell a2 = pop();
        push(a2 < a1 ? -1 : 0);
}

BUILTIN(52, ">", larger, 0)
{
        scell a1 = pop();
        scell a2 = pop();
        push(a2 > a1 ? -1 : 0);
}

BUILTIN(53, "AND", doAnd, 0)
{
        cell a1 = pop();
        cell a2 = pop();
        push(a2 & a1);
}

BUILTIN(54, "OR", doOr, 0)
{
        cell a1 = pop();
        cell a2 = pop();
        push(a2 | a1);
}

BUILTIN(55, "?DUP", p_dup, 0)
{
        cell a = tos();
        if (a)
                push(a);
}

BUILTIN(56, "LITSTRING", litstring, 0)
{
        cell length = readMem(next);
        next += CELL_SIZE;
        push(next);
        push(length);
        next += length;
        while (next & (CELL_SIZE - 1))
                next++;
}

BUILTIN(57, "XOR", xor, 0)
{
        cell a = pop();
        cell b = pop();
        push(a ^ b);
}

BUILTIN(58, "*/", timesDivide, 0)
{
        cell  n3 = pop();
        dcell n2 = pop();
        dcell n1 = pop();
        dcell r  = (n1 * n2) / n3;
        push((cell)r);
        if ((cell)r != r) {
                tell("Arithmetic overflow\n");
                errorFlag = 1;
        }
}

BUILTIN(59, "*/MOD", timesDivideMod, 0)
{
        cell  n3 = pop();
        dcell n2 = pop();
        dcell n1 = pop();
        dcell r  = (n1 * n2) / n3;
        dcell m  = (n1 * n2) % n3;
        push((cell)m);
        push((cell)r);
        if ((cell)r != r) {
                tell("Arithmetic overflow\n");
                errorFlag = 1;
        }
}

BUILTIN(60, "D=", dequals, 0)
{
        dcell a1 = dpop();
        dcell a2 = dpop();
        push(a2 == a1 ? -1 : 0);
}

BUILTIN(61, "D<", dsmaller, 0)
{
        dscell a1 = dpop();
        dscell a2 = dpop();
        push(a2 < a1 ? -1 : 0);
}

BUILTIN(62, "D>", dlarger, 0)
{
        dscell a1 = dpop();
        dscell a2 = dpop();
        push(a2 > a1 ? -1 : 0);
}

BUILTIN(63, "DU<", dusmaller, 0)
{
        dcell a1 = dpop();
        dcell a2 = dpop();
        push(a2 < a1 ? -1 : 0);
}

BUILTIN(64, "D+", dplus, 0)
{
        dscell n1 = dpop();
        dscell n2 = dpop();
        dpush(n1 + n2);
}

BUILTIN(65, "D-", dminus, 0)
{
        dscell n1 = dpop();
        dscell n2 = dpop();
        dpush(n2 - n1);
}

BUILTIN(66, "D*", dmul, 0)
{
        dscell n1 = dpop();
        dscell n2 = dpop();
        dpush(n1 * n2);
}

BUILTIN(67, "D/", ddiv, 0)
{
        dscell n1 = dpop();
        dscell n2 = dpop();
        dpush(n2 / n1);
}

BUILTIN(68, "2SWAP", dswap, 0)
{
        dcell a = dpop();
        dcell b = dpop();
        dpush(a);
        dpush(b);
}

BUILTIN(69, "2OVER", dover, 0)
{
        dcell a = dpop();
        dcell b = dpop();
        dpush(b);
        dpush(a);
        dpush(b);
}

BUILTIN(70, "2ROT", drot, 0)
{
        dcell a = dpop();
        dcell b = dpop();
        dcell c = dpop();
        dpush(b);
        dpush(a);
        dpush(c);
}

BUILTIN(71, "P!", portWrite, 0)
{
        cell address = pop();
        cell value   = pop();
        hw_shd(address, value);
}

BUILTIN(72, "PC!", portWriteByte, 0)
{
        cell address = pop();
        cell value   = pop();
        hw_sbd(address, value);
}

BUILTIN(73, "P@", portRead, 0)
{
        push(hw_lhud(pop()));
}
BUILTIN(74, "PC@", portreadByte, 0)
{
        push(hw_lbud(pop()));
}
BUILTIN(75, "RUN", doRun, 0)
{
        /* Runs arbitrary code at the specified address. It may NOT return*/
        hw_call(dpop());
}
BUILTIN(76, "CLEAR", clearScreen, 0)
{
        txtmod_clear_update();
}

BUILTIN(77, "TPS/LOAD", tpsLoad, 0)
{
        /* (TPS c-sector u-buffer -- ) loads a sector from TPS into buffer */
        cell buffer = pop();
        cell sector = pop() & 0xFF;
        cell tps    = pop();

        tps_load_driver(tps, (byte)sector, &memory[buffer]);
}

BUILTIN(78, "TPS/STORE", tpsStore, 0)
{
        /* (TPS c-sector u-buffer -- ) loads a sector from TPS into buffer */
        cell buffer = pop();
        cell sector = pop() & 0xFF;
        cell tps    = pop();

        tps_store_driver(tps, (byte)sector, &memory[buffer]);
}

BUILTIN(79, "HCS/LOAD", hcsLoad, 0)
{
        /* (HCS u-sector u-buffer -- ) loads a sector from HCS into buffer */
        cell buffer = pop();
        cell sector = pop();
        cell hcs    = pop();

        hcs_load_driver(hcs, sector, &memory[buffer]);
}

BUILTIN(80, "HCS/STORE", hcsStore, 0)
{
        /* (HCS u-sector u-buffer -- ) loads a sector from HCS into buffer */
        cell buffer = pop();
        cell sector = pop();
        cell hcs    = pop();

        hcs_store_driver(hcs, sector, &memory[buffer]);
}

BUILTIN(81, "U/MOD", udivmod, 0)
{
        cell n1 = pop();
        cell n2 = pop();
        push(n2 % n1);
        push(n2 / n1);
}

BUILTIN(82, "UM/MOD", umdivmod, 0)
{
        cell  n1 = pop();
        dcell n2 = pop();
        push(n2 % n1);
        push(n2 / n1);
}

BUILTIN(83, "U<", uless, 0)
{
        cell a1 = pop();
        cell a2 = pop();
        push(a2 < a1 ? -1 : 0);
}

BUILTIN(84, "-ROT", nrot, 0)
{
        cell n1 = pop();
        cell n2 = pop();
        cell n3 = pop();
        push(n1);
        push(n3);
        push(n2);
}

BUILTIN(85, "SYS!", sysWrite, 0)
{
#if (TOTAL_MEMORY_ACCESS)
        dcell address        = dpop();
        cell  value          = pop();
        *((cell *)(address)) = value;
#else
        tell("Supervisor privilege needed to access whole system memory\n")
                :
#endif
}

BUILTIN(86, "SYSC!", sysWriteByte, 0)
{
#if (TOTAL_MEMORY_ACCESS)
        dcell address        = dpop();
        cell  value          = pop();
        *((byte *)(address)) = value;
#else
        tell("Supervisor privilege needed to access whole system memory\n")
                :
#endif
}

BUILTIN(87, "SYS@", sysRead, 0)
{
#if (TOTAL_MEMORY_ACCESS)
        push(*((cell *)(dpop())));
#else
        tell("Supervisor privilege needed to access whole system memory\n")
                :
#endif
}

BUILTIN(88, "SYSC@", sysReadByte, 0)
{
#if (TOTAL_MEMORY_ACCESS)
        push(*((byte *)(dpop())));
#else
        tell("Supervisor privilege needed to access whole system memory\n")
                :
#endif
}

BUILTIN(89, "TOGGLE-SCROLL", toggleScroll, 0)
{
        scroll_lock = !scroll_lock;
}

BUILTIN(90, "CMOVE", cmove, 0)
{
        /* (addr1 addr2 u -- ) moves bytes */
        cell len   = pop();
        cell addr2 = pop();
        cell addr1 = pop();

        hw_copy(&memory[addr1], &memory[addr2], len);
}

BUILTIN(91, "SYSCMOVE", sysCmove, 0)
{
        /* (d-addr1 d-addr2 d-u -- ) moves bytes */
        dcell len   = dpop();
        dcell addr2 = dpop();
        dcell addr1 = dpop();

        hw_copy(addr1, addr2, len);
}

BUILTIN(92, "CMOVE>", cmoveUp, 0)
{
        /* (addr1 addr2 u -- ) moves bytes */
        cell len   = pop();
        cell addr2 = pop();
        cell addr1 = pop();

        copy_bytes_up(&memory[addr2], &memory[addr1], len);
}

BUILTIN(93, "SYSCMOVE>", sysCmoveUp, 0)
{
        /* (d-addr1 d-addr2 d-u -- ) moves bytes */
        dcell len   = dpop();
        dcell addr2 = dpop();
        dcell addr1 = dpop();

        copy_bytes_up((byte *)addr2, (byte *)addr1, len);
}

BUILTIN(94, "SYSOFFSET", sysOffset, 0)
{
        dpush((dcell)&memory);
}

BUILTIN(95, "DISK/IO", diskio, 0)
{
        char s[4];
        cell target    = hw_lhud(1056);
        cell drive     = hw_lhud(1060);
        cell sector    = hw_lhud(1064);
        cell operation = hw_lhud(1068);

        if (drive < 2) {
                /* tps */
                if (sector > 255) {
                        tell("Disk Error: Sector out of bounds ");
                        n2s(sector, s);
                        tell(s);
                        tell("\n");
                        errorFlag = 1;
                }
                if (operation) {
                        tps_load_driver(drive, sector, &memory[target]);
                } else {
                        tps_store_driver(drive, sector, &memory[target]);
                }
        } else if (drive == 2) {
                /* hcs */
                drive  = sector / 0xffff;
                sector = sector - (0xffff * drive) - drive;

                if (drive > 3 || sector > 0xffff) {
                        tell("Disk error: No such sector");
                        errorFlag = 1;
                }

                if (operation) {
                        hcs_load_driver(drive, sector, &memory[target]);
                } else {
                        hcs_store_driver(drive, sector, &memory[target]);
                }
        } else {
                tell("Disk Error: No such drive");
                errorFlag = 1;
        }
}

BUILTIN(96, "SBUF", doSbuf, 0)
{
        push(SBUF_POSITION);
}

BUILTIN(97, "RESIDENT", resident, 0)
{
        cell block = tos();
        int  i;

        for (i = 0; i < BLOCK_BUFFERS * 2; i += 2) {
                if ((sbuf[i] & 0x7fff) == (block & 0x7fff)) {
                        push(sbuf[i + 1]);
                        push(0);
                        return;
                }
        }

        push(-1);
}

BUILTIN(98, "BUFFER", buffer, 0)
{
        cell block = tos();
        int  i;
        for (i = 0; i < BLOCK_BUFFERS * 2; i += 2) {
                if (sbuf[i] == 0) {
                        sbuf[i] = block & 0x7fff;
                        push(sbuf[i + 1]);
                        return;
                }
        }
        errorFlag = 1;
        tell("Error: buffers full\n");
}

BUILTIN(99, "UPDATE", update, 0)
{
        cell addr = tos();

        if (addr < BLOCK_BUFF_ADDR)
                return;
        addr = (addr - BLOCK_BUFF_ADDR) / 512;
        sbuf[addr * 2] |= 0x8000;
}

BUILTIN(100, "2BUFFER", twoBuffer, 0)
{
        cell block = pop();
        int  i;
        for (i = 0; i < (BLOCK_BUFFERS - 1) * 2; i += 2) {
                if ((sbuf[i] == 0) && (sbuf[i + 2] == 0)) {
                        sbuf[i]     = block & 0x7fff;
                        sbuf[i + 2] = (block + 1) & 0x7fff;
                        push(block + 1);
                        push(sbuf[i + 3]);
                        push(block);
                        push(sbuf[i + 1]);
                        return;
                }
        }
        errorFlag = 1;
        tell("Error: no consecutive buffers\n");
}

extern void txtmod_setpos(unsigned char, unsigned char);
BUILTIN(101, "ATXY", atxy, 0)
{
        cell x     = pop() & 0xff;
        cell y     = pop() & 0xff;
        supress_ok = 1;
        txtmod_setpos(x, y);
}

BUILTIN(102, "TERMINAL", terminal, 0)
{
        dpush((dcell)&terminal_ctx);
}

BUILTIN(103, "ABORT", abort, 0)
{
        errorFlag = 1;
        tell("Abort\n");
}

BUILTIN(104, "FILL", fill, 0)
{
        cell c    = pop();
        cell u    = pop();
        cell addr = pop();
        hw_fill(&memory[addr], u, c);
}

BUILTIN(105, "OK!", setOk, 0)
{
        cell c     = pop();
        supress_ok = c;
}

/*******************************************************************************
 *
 * Loose ends
 *
 *******************************************************************************/

/* Create a word in the dictionary */
void createWord(const char *name, byte len, byte flags)
{
        cell newLatest = *here;
        push(*latest);
        comma();
        push(len | flags);
        commaByte();
        while (len--) {
                push(*name);
                commaByte();
                name++;
        }
        while (*here & (CELL_SIZE - 1)) {
                push(0);
                commaByte();
        }
        *latest = newLatest;
}

/* A simple strlen clone so we don't have to pull in string.h */
byte slen(const char *str)
{
        byte ret = 0;
        while (*str++)
                ret++;
        return ret;
}

/* Add a builtin to the dictionary */
void addBuiltin(cell code, const char *name, const byte flags, builtin f)
{
        if (errorFlag)
                return;

        if (code >= MAX_BUILTIN_ID) {
                tell("Error adding builtin ");
                tell(name);
                tell(": Out of builtin IDs\n");
                errorFlag = 1;
                return;
        }

        if (builtins[code] != 0) {
                tell("Error adding builtin ");
                tell(name);
                tell(": ID given twice\n");
                errorFlag = 1;
                return;
        }

        builtins[code] = f;
        createWord(name, slen(name), flags);
        push(code);
        comma();
        push(doExit_id);
        comma();
}

/* Program setup and jump to outer interpreter */
int main()
{
        errorFlag = 0;

        if (DCELL_SIZE != 2 * CELL_SIZE) {
                tell("Configuration error: DCELL_SIZE != 2*CELL_SIZE\n");
                return 1;
        }

        /*        scripts[0] = (char *)initScript;
               scripts[1] = (char *)initScript2;
               scripts[2] = (char *)blocksScript;
               scripts[3] = 0; */

        state  = (cell *)&memory[STATE_POSITION];
        base   = (cell *)&memory[BASE_POSITION];
        latest = (cell *)&memory[LATEST_POSITION];
        here   = (cell *)&memory[HERE_POSITION];
        sp     = (cell *)&memory[STACK_POSITION];
        stack  = (cell *)&memory[STACK_POSITION + CELL_SIZE];
        rsp    = (cell *)&memory[RSTACK_POSITION];
        rstack = (cell *)&memory[RSTACK_POSITION + CELL_SIZE];
        sbuf   = (cell *)&memory[SBUF_POSITION];

        *sp = *rsp = 1;
        *state     = 0;
        *base      = 10;
        *latest    = 0;
        *here      = HERE_START;

        hw_shd(1076, -1);
        hw_sbd(1084, ' ');

        sbuf[1]  = BLOCK_BUFF_ADDR;
        sbuf[3]  = BLOCK_BUFF_ADDR + BLOCK_BUFF_SIZE * 1;
        sbuf[5]  = BLOCK_BUFF_ADDR + BLOCK_BUFF_SIZE * 2;
        sbuf[7]  = BLOCK_BUFF_ADDR + BLOCK_BUFF_SIZE * 3;
        sbuf[9]  = BLOCK_BUFF_ADDR + BLOCK_BUFF_SIZE * 4;
        sbuf[11] = BLOCK_BUFF_ADDR + BLOCK_BUFF_SIZE * 5;
        sbuf[13] = BLOCK_BUFF_ADDR + BLOCK_BUFF_SIZE * 6;
        sbuf[15] = BLOCK_BUFF_ADDR + BLOCK_BUFF_SIZE * 7;

        ADD_BUILTIN(docol);
        ADD_BUILTIN(doCellSize);
        ADD_BUILTIN(memRead);
        ADD_BUILTIN(memWrite);
        ADD_BUILTIN(memReadByte);
        ADD_BUILTIN(memWriteByte);
        ADD_BUILTIN(key);
        ADD_BUILTIN(emit);
        ADD_BUILTIN(swap);
        ADD_BUILTIN(dup);
        ADD_BUILTIN(drop);
        ADD_BUILTIN(over);
        ADD_BUILTIN(comma);
        ADD_BUILTIN(commaByte);
        ADD_BUILTIN(word);
        ADD_BUILTIN(find);
        ADD_BUILTIN(cfa);
        ADD_BUILTIN(doExit);
        ADD_BUILTIN(quit);
        quit_address = getCfa(*latest);
        ADD_BUILTIN(number);
        ADD_BUILTIN(bye);
        ADD_BUILTIN(doLatest);
        ADD_BUILTIN(doHere);
        ADD_BUILTIN(doBase);
        ADD_BUILTIN(doState);
        ADD_BUILTIN(plus);
        ADD_BUILTIN(minus);
        ADD_BUILTIN(mul);
        ADD_BUILTIN(divmod);
        ADD_BUILTIN(rot);
        ADD_BUILTIN(gotoInterpreter);
        ADD_BUILTIN(gotoCompiler);
        ADD_BUILTIN(doCreate);
        ADD_BUILTIN(hide);
        ADD_BUILTIN(lit);
        ADD_BUILTIN(colon);
        ADD_BUILTIN(semicolon);
        ADD_BUILTIN(rtos);
        ADD_BUILTIN(stor);
        ADD_BUILTIN(rget);
        ADD_BUILTIN(doJ);
        ADD_BUILTIN(tick);
        ADD_BUILTIN(key_p);
        ADD_BUILTIN(equals);
        ADD_BUILTIN(smaller);
        ADD_BUILTIN(larger);
        ADD_BUILTIN(doAnd);
        ADD_BUILTIN(doOr);
        ADD_BUILTIN(branch);
        ADD_BUILTIN(zbranch);
        ADD_BUILTIN(toggleImmediate);
        ADD_BUILTIN(doFree);
        ADD_BUILTIN(p_dup);
        ADD_BUILTIN(s0_r);
        ADD_BUILTIN(dsp_r);
        ADD_BUILTIN(litstring);
        ADD_BUILTIN(not );
        ADD_BUILTIN(xor);
        ADD_BUILTIN(timesDivide);
        ADD_BUILTIN(timesDivideMod);
        ADD_BUILTIN(dequals);
        ADD_BUILTIN(dsmaller);
        ADD_BUILTIN(dlarger);
        ADD_BUILTIN(dusmaller);
        ADD_BUILTIN(dplus);
        ADD_BUILTIN(dminus);
        ADD_BUILTIN(dmul);
        ADD_BUILTIN(ddiv);
        ADD_BUILTIN(dswap);
        ADD_BUILTIN(dover);
        ADD_BUILTIN(drot);
        ADD_BUILTIN(portRead);
        ADD_BUILTIN(portreadByte);
        ADD_BUILTIN(portWrite);
        ADD_BUILTIN(portWriteByte);
        ADD_BUILTIN(doRun);
        ADD_BUILTIN(clearScreen);
        ADD_BUILTIN(tpsLoad);
        ADD_BUILTIN(tpsStore);
        ADD_BUILTIN(hcsLoad);
        ADD_BUILTIN(hcsStore);
        ADD_BUILTIN(udivmod);
        ADD_BUILTIN(umdivmod);
        ADD_BUILTIN(uless);
        ADD_BUILTIN(nrot);
        ADD_BUILTIN(sysWrite);
        ADD_BUILTIN(sysWriteByte);
        ADD_BUILTIN(sysRead);
        ADD_BUILTIN(sysReadByte);
        ADD_BUILTIN(toggleScroll);
        ADD_BUILTIN(cmove);
        ADD_BUILTIN(sysCmove);
        ADD_BUILTIN(cmoveUp);
        ADD_BUILTIN(sysCmoveUp);
        ADD_BUILTIN(sysOffset);
        ADD_BUILTIN(diskio);
        ADD_BUILTIN(doSbuf);
        ADD_BUILTIN(resident);
        ADD_BUILTIN(buffer);
        ADD_BUILTIN(update);
        ADD_BUILTIN(twoBuffer);
        ADD_BUILTIN(atxy);
        ADD_BUILTIN(terminal);
        ADD_BUILTIN(abort);
        ADD_BUILTIN(fill);
        ADD_BUILTIN(setOk);

        maxBuiltinAddress = (*here) - 1;

        if (errorFlag)
                return 1;

        initscript_pos = (char *)initScript;
        tell("\nLoading init script...");
        quit();
        return 0;
}

void charset()
{
        tell("Character set:\n");
        {
                byte i;
                char n[4];
                for (i = 0; i < 255; i++) {
                        n2s(i, n);
                        push(i);
                        emit();
                        push(' ');
                        emit();
                        tell(n);
                        push(' ');
                        emit();
                }
        }
}
