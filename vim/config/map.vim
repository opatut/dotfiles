" Basics
nnoremap ggwp :update \| :q<CR>
nnoremap <leader>s :update!<CR>
nnoremap <leader>w :update! \| :bd<CR>
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

" Ctrl+D sublime hack
nnoremap <leader>d *Nciw
vnoremap <leader>d y/<C-r>"<CR>Ngvc
nnoremap <leader>n .n

" Remove highlights :noh
nnoremap <leader>h :noh<CR>

" Refresh .vimrc / .gvimrc
nnoremap <F5> :so ~/.vimrc<CR>
nnoremap <S-F5> :e ~/.vimrc<CR>

" Comments
nmap <leader>c gcc
vmap <leader>c gc

" Omnicomplete
inoremap <c-space> <C-X><C-O>
imap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
imap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"
imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Linting / Errors
nnoremap <leader>l :SyntasticCheck<CR>
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprevious<CR>
nnoremap <leader>e :llist<CR>

" CtrlP file switcher
nnoremap <silent> <C-p> :CtrlP<CR>
nnoremap <silent> <leader>p :CtrlP<CR>
nnoremap <silent> <leader>P :CtrlPCurFile<CR>
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

" Sort by '/" enclosed string
vnoremap <S-F9> :sort '[\'"].*[\'"]' r<CR>
