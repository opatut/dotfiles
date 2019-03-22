nnoremap <F5> :so ~/.vimrc \| :so ~/.gvimrc \| set columns=100000 \| set lines=1000000 <CR>

set guioptions-=M " ?
set guioptions-=a " no auto select
set guioptions-=m " menu bar
set guioptions-=T " toolbar
set guioptions-=r " right scroll bar
set guioptions-=L " left scroll bar

autocmd GUIEnter * set visualbell t_vb=
set guiheadroom=0
set shortmess+=I

set linespace=1
set lines=50 
set columns=160

set background=dark

" set guifont=Cousine\ 12
" set guifont=Droid\ Sans\ Mono\ 11
" set guifont=Fira\ Mono\ 12
" set guifont=Input\ Mono\ Regular\ 11
" set guifont=Misc\ Tamsyn\ Regular\ 12
" set guifont=Source\ Code\ Pro\ 12
" set guifont=Roboto\ Mono\ 11
" set guifont=Inconsolata\ 14
set guifont=Meslo\ LG\ L\ DZ\ Regular\ 10
set linespace=-2
