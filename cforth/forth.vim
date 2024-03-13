"VIM SOFT MODE FOR EDITING FORTH BLOCKS                        

" returns file offset so we can hint wich screen are we editing
function! FileOffset()
    return line2byte(line('.')) + col('.') - 2
endfunction

function! CurrentScreen()
    return FileOffset() / 1024
endfunction

" status line indicates character offset in line, offset in 
" screen, and current screen
set colorcolumn=64                                             
set laststatus=2                                               
set statusline=
set statusline=[char\ %c\]
set statusline+=[byte\ %{FileOffset()-(CurrentScreen()*1024)}] 
set statusline+=[SCREEN\ %{CurrentScreen()}\ of\ %{wordcount().bytes/1024}]

"LOREM IPSUM DOLOR SIT AMET CONSECTETUR ADISCIPLING ELIT SED DO
"UT DOLOREM ET AMOREM we show every whitespace character
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" we don't set final end of lines
set nofixeol

" we edit block files as binary files
"set binary

" we want to wrap text at 64 characters
set number
set tw=64
set wrapmargin=0
set linebreak
set formatoptions+=t
