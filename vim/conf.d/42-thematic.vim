" Light themes: lucius (:LuciusLight), tolerable, vylight, PapayaWhip, solarized, one
let s:light_theme = "one"
let s:light_theme_command = ""

" Dark themes: hybrid, wombat, seattle, rootwater, solarized, one
let s:dark_theme = "one"
let s:dark_theme_command = ""

let g:one_allow_italics = 0

function! FixColors() 
    highlight ColorColumn ctermbg=none guibg=NONE
    highlight Search ctermfg=none ctermbg=none cterm=none guifg=NONE guibg=NONE gui=underline
    " highlight Search guifg=NONE guibg=#444444 gui=bold

    highlight SyntasticError guibg=#FFAAAA cterm=standout
    highlight SyntasticErrorLine guifg=#BB0000 cterm=bold ctermfg=red

    highlight ValidatorErrorSign guibg=#FFAAAA guifg=#000000 cterm=standout
    highlight ValidatorWarningSign guibg=#FFAAAA guifg=#000000 cterm=standout

    highlight link javascriptReserved keyword
    highlight link javascriptInvalidOp operator
    highlight link jsGlobalObjects identifier

    highlight keyword gui=bold cterm=bold
    highlight statement gui=bold cterm=bold

    highlight clear SignColumn
    highlight link SignColumn LineNr
endfunction

function! Dark() 
    set background=dark
    let g:my_theme_mode = "dark"
    execute 'colorscheme '.s:dark_theme
    if s:dark_theme_command != "" 
        execute s:dark_theme_command 
    endif

    call FixColors()

    highlight SpellBad guibg=#880000 gui=none
    highlight CursorLine ctermbg=black 
    highlight NonText ctermbg=none
    highlight Normal ctermbg=none
endfunction

function! Light() 
    set background=light
    let g:my_theme_mode = "light"
    execute 'colorscheme '.s:light_theme
    if s:light_theme_command != "" 
        execute s:light_theme_command 
    endif

    call FixColors()

    highlight SpellBad guibg=#FFAAAA gui=underline
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


function! RandomColortheme()
  let schemes = split(globpath(&rtp, "colors/*.vim"))
  let s = schemes[localtime() % len(schemes)]
  let clrschm = substitute(s, '^.*[/\\]\([^/\\]\+\)\.vim$', '\1', '')
  execute 'colorscheme '.clrschm
  echo 'Switched to '.clrschm
endfunction
nnoremap R :call RandomColortheme()<cr>
