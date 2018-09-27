"""""""""""""""""""""""""
" Linting (Syntastic)
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["yacc"] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '!'
let g:syntastic_warning_symbol = 'W'
let g:syntastic_enable_highlighting=1
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:syntastic_javascript_eslint_exec = '/home/paul/.npm-global/bin/eslint_d'
let g:syntastic_javascript_flow_exec = '/home/paul/.npm-global/bin/flow'
let g:syntastic_aggregate_errors = 1
" let g:syntastic_debug_file = "~/.vim/syntastic.log"
" let g:syntastic_debug=1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
