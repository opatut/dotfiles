" Basics
nnoremap <silent> <leader>s :update!<CR>
nnoremap <silent> <leader>w :update! \| :bd<CR>
nnoremap <leader>f :Ags<space>

" Clipboard (X clipboard on \)
map \p "+p
map \y "+y
map \d "+d

" Arrows in command mode
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

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

" Comments
nmap <leader>c gcc
vmap <leader>c gc

" Omnicomplete
"inoremap <c-space> <C-X><C-O>
"imap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
"imap <expr> <CR>  pumvisible() ? "\<C-y>\<Esc>" : "\<CR>"
"imap <expr> <Tab>  pumvisible() ? "\<C-y>\<C-e>" : "\<Tab>"
"imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
"imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Linting / Errors
nnoremap <leader>l :SyntasticCheck<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprevious<CR>
nnoremap <leader>e :llist<CR>

" CtrlP file switcher
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>P :CtrlPCurFile<CR>
nnoremap <silent> <C-p>     :CtrlPCurFile<CR>
nnoremap <silent> <leader>o :CtrlPMRUFiles<CR>

nnoremap <leader>; :CtrlPCmdHistory<CR>
nnoremap <leader>: :CtrlPCmdHistory<CR>
cnoremap <c-r> <C-u>:CtrlPCmdHistory<CR>

" Buffer navigation
nnoremap <c-space> :b#<CR>
nnoremap <leader>a :A<CR>
map <c-l> :bn<CR>
map <c-h> :bp<CR>

" Window management
nnoremap <leader>x :only<CR>

" Sorting rules
vnoremap <F9> :sort <CR>
" <S-F9>: by '/" enclosed string
vnoremap <S-F9> :sort '[\'"].*[\'"]' r<CR>
nnoremap <S-F9> vip :sort '[\'"].*[\'"]' r<CR>

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


nnoremap <leader>t :ThematicNext<CR>
