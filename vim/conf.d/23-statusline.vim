" set statusline=%#todo# 
" set statusline+=%t       "tail of the filename
" set statusline+=%#normal# 
" set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}] "file encoding
" set statusline+=%m      "modified flag
" set statusline+=%r      "read only flag
" set statusline+=%y      "filetype
" set statusline+=%=      "left/right separator
" set statusline+=%l/%L   "cursor line/total lines
" set statusline+=:%c     "cursor column
" set statusline+=\ %p%%  "percent through file

" hi StatusLine guibg=#FF0000 guifg=#FFFFFF
"
" set statusline=
" set statusline+=%<\                       " cut at start
" set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
" set statusline+=%-40f\                    " path
" set statusline+=%=%1*%y%*%*\              " file type
" set statusline+=%10(-%l/%L\ \|%c%)\            " line and column
" set statusline+=%p%%                      " percentage of file

" Formats the statusline
set statusline=[%n]\                    " Buffer number
set statusline+=%f                           " file name
set statusline+=\ %y      "filetype
set statusline+=\ %m      "modified flag
set statusline+=\ %=                        " align left
if exists("ALEGetStatusLine")
    set statusline+=[%{ALEGetStatusLine()}]\ 
endif
set statusline+=\c:%c\                     " current column
set statusline+=[%l/%L]\ %p%%\             " line X of Y [percent of file]
