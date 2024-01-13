#ifndef ERROR_H
#define ERROR_H
#include <stdint.h>

#define ION_EOK           0
#define ION_EOF           -1
#define ION_EDEFAULT      -2
#define ION_EINVAL        -3
#define ION_ENOMEM        -10
#define ION_ECORRUPT      -20
#define ION_EBADFREE      -21
#define ION_ENSECTOR      -30
#define ION_ENODRIVER     -31
#define ION_ENULLFNAME    -40
#define ION_ENOFS         -41
#define ION_EDEVTOOBIG    -42
#define ION_ENULLFS       -43
#define ION_ENULLFILE     -44
#define ION_ENOMOUNT      -45
#define ION_ENOTFOUND     -46
#define ION_EFCORRUPT     -47
#define ION_ENOT8_3       -48
#define ION_EEXPECTEDDIR  -49
#define ION_EEXIST        -50
#define ION_ERFULL        -51
#define ION_ENCLUSTER     -52
#define ION_EBADF         -53
#define ION_EBADOPT       -54
#define ION_EDISKFULL     -56
#define ION_EEXPECTEDFILE -57
#define ION_ENMVDV        -58
#define ION_ENKPRESS      -60
#define ION_EBADMAGIC     -70
#define ION_ENULLTASK     -80
#define ION_ENOMORETASK   -81
#define ION_ERINGFULL     -100
#define ION_ERINEMPTY     -101
#define ION_EBADSCALL     -200

/**
 * @brief The error type for the Ion System. All subsystems that can fail will
 * return an error code or a tagged union with ion_error
 */
struct ion_error {
        int32_t number;
        uint8_t str[80];
};

/**
 * @brief Reports the textual representation of an error in the Ion system.
 * Functions that fail on subsystems and return a taaged error union will only
 * set the error tag and the error number
 *
 * @param err The error type to interpret
 */
void error_report(struct ion_error *err);

/**
 * @brief Kernel panic
 *
 * @param fmt The message to report (format string)
 * @param ... Format arguments
 */
void panic(char *fmt, ...); /*no return*/

#endif /* ERROR_H */
