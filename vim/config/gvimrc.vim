"colorscheme wombat256

"colorscheme lucius
"LuciusLightHighContrast

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

hi Search guifg=NONE guibg=#444444 gui=bold
