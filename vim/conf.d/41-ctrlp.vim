let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
" let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor\ --follow

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --follow --nocolor -g "" --hidden'
endif

function! CtrlPParentDir()
    let l:f = expand('%:h:h')
    exec ':CtrlP ' . l:f
endfunction
command! CtrlPParentDir :call CtrlPParentDir()
noremap <C-p> :silent CtrlPParentDir<cr>


