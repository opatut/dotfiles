autocmd BufRead,BufNewFile,FileType *.less.module set filetype=less
autocmd BufRead,BufNewFile,FileType *.js set filetype=javascript.jsx

let g:sql_type_default = 'pgsql'

autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1

autocmd FileType agsv set nowrap

let g:vim_json_syntax_conceal = 0
augroup conceal
    autocmd!
    autocmd FileType markdown set conceallevel=0
augroup END

" Markdown stuff

let g:pencil#wrapModeDefault = 'hard'
augroup pencil
    autocmd!
    autocmd FileType markdown call pencil#init({'wrap': 'soft', 'autoformat': 1}) 
    autocmd FileType text     PencilOff
augroup END
