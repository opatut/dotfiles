

" auto completion stuff
filetype plugin on
" set ofu=syntaxcomplete#Complete

" set complete+=k " enable dictionary completion
" set completeopt=menuone,menu,longest,preview

" Automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" clang completion
" let g:clang_complete_auto = 1
"let g:clang_complete_copen = 1
" let g:clang_hl_errors = 1

" completion
" " YouCompleteMe and UltiSnips compatibility, with the helper of supertab
"
"
" (via http://stackoverflow.com/a/22253548/1626737)
"let g:SuperTabDefaultCompletionType    = '<C-n>'
"let g:SuperTabCrMapping                = 0
"let g:UltiSnipsExpandTrigger           = '<tab>'
"let g:UltiSnipsJumpForwardTrigger      = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"fetched
"
" Don't special case completion after dot (".")
" let g:ycm_filetype_specific_completion_to_disable = { 'javascript': 1 }

