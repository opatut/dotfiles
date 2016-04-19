colorscheme wombat256

nnoremap <F5> :so ~/.vimrc \| :so ~/.gvimrc <CR>

set guioptions-=M " ?
set guioptions-=a " no auto select
set guioptions-=m " menu bar
set guioptions-=T " toolbar
set guioptions-=r " right scroll bar
set guioptions-=L " left scroll bar

autocmd GUIEnter * set visualbell t_vb=
set guiheadroom=0

" no welcome screen
set shortmess+=I
