function! FixColors() 
    " AirlineTheme bubblegum
    highlight ColorColumn ctermbg=none guibg=NONE
    highlight Search ctermfg=none ctermbg=none cterm=none guifg=NONE guibg=NONE gui=underline
    highlight SyntasticError guibg=#FFAAAA cterm=standout
    highlight SyntasticErrorLine guifg=#BB0000 cterm=bold ctermfg=red
endfunction

function! Dark() 
    set background=dark
    let g:my_theme_mode = "dark"
    " colorscheme wombat 
    colorscheme seattle

    call FixColors()

    highlight CursorLine ctermbg=black
    highlight NonText ctermbg=none
    highlight Normal ctermbg=none
endfunction

function! Light() 
    set background=light
    let g:my_theme_mode = "light"
    colorscheme lucius 
    LuciusLight

    call FixColors()

    highlight CursorLine ctermbg=lightgray
    highlight NonText ctermbg=white
    highlight Normal ctermbg=white
endfunction

call Dark()

let g:my_theme_mode = "dark"
function! Switch()
    if g:my_theme_mode == "dark"
        call Light()
    else
        call Dark()
    endif
endfunction

map <leader>t :call Switch()<CR>
