" Basics
nnoremap <silent> <leader>s :update!<CR>
nnoremap <silent> <leader>w :update! \| :bd<CR>
" nnoremap <C-w> :bd<CR>
" nnoremap <C-q> :%bd<CR>
"
nnoremap <a-w> :bd<CR>
nnoremap <a-q> :%bd<CR>

" Clipboard (X clipboard on \)
map \p "+p
map \y "+y
map \d "+d

nnoremap <leader>y :let @+ = expand("%")<CR>

" Arrows in command mode
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Font size
nnoremap <C-Up> :LargerFont<CR>
nnoremap <C-Down> :SmallerFont<CR>

" Arrows for window navigation (alt + hjkl)
nnoremap ê :wincmd j<CR>
nnoremap ë :wincmd k<CR>
nnoremap è :wincmd h<CR>
nnoremap ì :wincmd l<CR>

noremap # *
noremap * #

nnoremap <C-S-Left> :silent vertical resize -2<CR>
nnoremap <C-S-Right> :silent vertical resize +2<CR>
nnoremap <C-S-Down> :silent resize -1<CR>
nnoremap <C-S-Up> :silent resize +1<CR>

" <C-D> search and replace, <F2> skip, <F3> replace
map <leader>d :MultipleCursorsFind 

" Remove highlights :noh
nnoremap <leader>h :noh<CR>
nnoremap <a-t> :TableFormat<CR>

" Refresh .vimrc / .gvimrc
nnoremap <F5> :so ~/.vimrc<CR>
nnoremap <S-F5> :e ~/.vimrc<CR>

" Quick format
nnoremap <silent> S :update!<bar>silent !/home/paul/.bin/codeformat %<cr>
nnoremap <silent> <F6> :%!/home/paul/.bin/codeformat - %<cr>
nnoremap s :update<CR>
nnoremap <leader>f :Ags<space>
nnoremap <c-f> :Ags<CR>
vnoremap <c-f> "vy \| :exec ":Ags " . @v <CR>

nnoremap <leader>n :next<CR>
command! MarkdownPreview :update!<bar>silent :exec("!killall vmd; /home/paul/.npm-global/bin/vmd " . expand("%:p") . " &")

" Replace
nmap gr <Plug>ReplaceMotion
nmap grr <Plug>ReplaceLine
vmap gr <Plug>ReplaceVisual

" Comments
nmap <leader>c gcc
vmap <leader>c gc

" Macro helper
nnoremap <leader>q :norm @q<CR>
vnoremap <leader>q :norm @q<CR>

" Omnicomplete
"inoremap <c-space> <C-X><C-O>
"imap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
"imap <expr> <CR>  pumvisible() ? "\<C-y>\<Esc>" : "\<CR>"
"imap <expr> <Tab>  pumvisible() ? "\<C-y>\<C-e>" : "\<Tab>"
"imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" CtrlP file switcher
nnoremap <silent> <leader>p :CtrlPCurWD<CR>
nnoremap <silent> <c-p> :CtrlPCurWD<CR>
nnoremap <silent> <leader>o :CtrlPCurFile<CR>
nnoremap <silent> <leader>r :CtrlPMRUFiles<CR>
" nnoremap <silent> <c-j> :CtrlPLine<CR>
cnoremap <c-r> <C-u>:CtrlPCmdHistory<CR>

" <c-n> = "notes"
nnoremap <c-n> :e /home/paul/documents/wiki/Mondas/General Notes.gpg.md<CR>

" Buffer navigation
nnoremap <leader><tab> :b#<CR>
nnoremap <leader>a :A<CR>
map <c-l> :bn<CR>
map <c-h> :bp<CR>

nnoremap <C-b> :silent! NERDTreeToggle<CR>
nnoremap <a-p> :silent! MarkdownPreview<CR>

" Window management
nnoremap <leader>x :only<CR>
" nnoremap <s-j> :tabp<CR>
" nnoremap <s-k> :tabn<CR>
" nnoremap <c-j> :join<CR>

" Sorting rules
" vnoremap <F9> :sort <CR>
" nnoremap <S-s> vip :sort <CR>
" vnoremap <S-s> :sort <CR>
" nnoremap <S-C-s> vip :sort '[\'"].*[\'"]' r<CR>
" vnoremap <S-C-s> :sort '[\'"].*[\'"]' r<CR>

" Aligning
vnoremap <F10> :Tabular /^[^=]*\zs=<CR>
nnoremap <F10> vip :Tabular /^[^=]*\zs=<CR>
vnoremap <S-F10> :Tabular /from<CR>
nnoremap <S-F10> vip :Tabular /from<CR>

" Focus mode

nnoremap <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Save files as root with :SW
function! SudoWrite(...)
  if a:0 < 1
    let file = "%"
  else
    let file = a:1
  endif
  echom file
  :exec ":w !sudo tee ".file
endfunction
command! -nargs=? SW :silent call SudoWrite(<f-args>)

let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_complete_tag = 1

"https://github.com/mattn/emmet-vim/issues/168
function! s:expand_tab()
  if pumvisible() 
    return "\<C-n>" 
  endif

  if emmet#isExpandable()
    return "\<Plug>(emmet-expand-abbr)"
  endif

  return "\<tab>"
endfunction

function! CustomEmmetInstall()
    EmmetInstall
    imap <buffer> <expr> <tab> <sid>expand_tab()
    " imap <buffer> <c-e> <Plug>(emmet-expand-abbr)
    " vmap <buffer> <c-e> <Plug>(emmet-wrap-with-abbreviation)
endfunction

autocmd FileType html,css,less,scss,sass call CustomEmmetInstall()

function! SelectIndent ()
    let temp_var=indent(line("."))
    while indent(line(".")-1) >= temp_var
        exe "normal k"
    endwhile
    exe "normal V"
    while indent(line(".")+1) >= temp_var
        exe "normal j"
    endwhile
endfun

nmap <F7> :mark i<CR>:call SelectIndent()<CR>:sort<CR>:normal `i<CR>
vmap <F7> :sort<CR>
