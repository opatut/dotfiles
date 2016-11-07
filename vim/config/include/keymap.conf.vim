" Basics
nnoremap <silent> <leader>s :update!<CR>
nnoremap <silent> <leader>w :update! \| :bd<CR>
nnoremap <leader>f :Ags<space>
" nnoremap <C-w> :bd<CR>
" nnoremap <C-q> :%bd<CR>

" Clipboard (X clipboard on \)
map \p "+p
map \y "+y
map \d "+d

" Arrows in command mode
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" Font size
nnoremap <C-up> :LargerFont<CR>
nnoremap <C-down> :SmallerFont<CR>

" Arrows for window navigation (alt + hjkl)
nnoremap ê :wincmd j<CR>
nnoremap ë :wincmd k<CR>
nnoremap è :wincmd h<CR>
nnoremap ì :wincmd l<CR>

noremap # *
noremap * #

" <C-D> search and replace, <F2> skip, <F3> replace
map <leader>d :MultipleCursorsFind 

" Remove highlights :noh
nnoremap <leader>h :noh<CR>

" Refresh .vimrc / .gvimrc
nnoremap <F5> :so ~/.vimrc<CR>
nnoremap <S-F5> :e ~/.vimrc<CR>

" Insert UUID
nnoremap <F8> :exe 'norm i' . system("echo -n $(uuidgen)")<CR>35h

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

" Linting / Errors
" nnoremap <leader>l :update! \| :SyntasticCheck<CR>
let g:neomake_javascript_enabled_makers = ['eslint_d', 'flow']
nnoremap <leader>l :update! \| :Neomake<CR>
autocmd! BufWritePost * Neomake
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprevious<CR>
nnoremap <leader>e :llist<CR>

" CtrlP file switcher
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>o :CtrlPCurFile<CR>
nnoremap <silent> <leader>r :CtrlPMRUFiles<CR>
nnoremap <silent> <c-j> :CtrlPLine<CR>
cnoremap <c-r> <C-u>:CtrlPCmdHistory<CR>

" Buffer navigation
nnoremap <leader><tab> :b#<CR>
nnoremap <leader>a :A<CR>
map <c-l> :bn<CR>
map <c-h> :bp<CR>

" Window management
nnoremap <leader>x :only<CR>

" Sorting rules
vnoremap <F9> :sort <CR>
nnoremap <S-s> vip :sort <CR>
vnoremap <S-s> :sort <CR>
nnoremap <S-C-s> vip :sort '[\'"].*[\'"]' r<CR>
vnoremap <S-C-s> :sort '[\'"].*[\'"]' r<CR>

" Aligning
vnoremap <F10> :Tabular /^[^=]*\zs=<CR>
nnoremap <F10> vip :Tabular /^[^=]*\zs=<CR>
vnoremap <S-F10> :Tabular /from<CR>
nnoremap <S-F10> vip :Tabular /from<CR>

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

let g:user_emmet_leader_key='<C-E>'
