let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 24
let s:defaultfontsize = 12

function! SetFontSize(size)
  if (a:size >= s:minfontsize) && (a:size <= s:maxfontsize)
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    if (has("gui_gtk3") || has("gui_gtk2")) && has("gui_running")
      let newfont = fontname . a:size
      let &guifont = newfont
    else
      echoerr "You need to run the GTK version of Vim to use this function."
    endif
  endif
endfunction

function! AdjustFontSize(amount)
  if (has("gui_gtk3") || has("gui_gtk2")) && has("gui_running")
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    call SetFontSize(cursize + a:amount)
  else
    echoerr "You need to run the GTK version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

function! DefaultFont()
  call SetFontSize(s:defaultfontsize)
endfunction
command! DefaultFont call DefaultFont()
