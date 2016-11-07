" au BufRead,BufNewFile *.html5 set filetype=php
au BufRead,BufNewFile,FileType *.less.module set filetype=less

let g:sql_type_default = 'pgsql'

autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1

