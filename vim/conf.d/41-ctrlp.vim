let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_extensions = ['notes']
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor\ --follow

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --follow --nocolor -g "" --hidden'
endif


