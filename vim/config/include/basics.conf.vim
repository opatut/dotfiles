" basics
set nocompatible

set mouse=a
set shortmess+=I
set clipboard+=unnamed
set backspace=2
set history=100
set ruler
set hidden
set showmode
set showcmd
set ww=<,>,[,]
set cmdheight=1
set showmatch
set matchpairs+=<:>
set mat=5
set number

" Colors
set t_Co=256
colorscheme wombat

let mapleader = "\<space>"

" gvim only
set background=dark

" Other font options:
" - Droid Sans Mono
" - Input Mono Regular
" - Source Code Pro
" - Fira Code

set guifont=Cousine\ 10
set linespace=0


" cursor settings
set nocursorline          " don't highlight cursor line for performance
set nocursorcolumn        " don't highlight cursor column
set synmaxcol=200         " max highlight 200 columns
autocmd BufEnter * :syntax sync maxlines=500
autocmd BufEnter * :syntax sync minlines=256

" wrap like other editors
set wrap                " word wrap
"set textwidth=79        "
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
set backup              " keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory

" tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set listchars=tab:→,trail:¸ " show trail spaces and tabstchars

" command mode
set wildmenu
set wildmode=list:longest,full

" automaticall read/save files
set autoread
au FocusGained,BufEnter * :silent! !
au FocusLost,WinLeave * :silent! update

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search


" syntax highlighting
syntax on               " enable/disable syntax highlighting
set nofoldenable

" statusline
set statusline=%<%f\ %y%h%m%r\ PWD:%{getcwd()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" plug-in settings
filetype indent on

"""""""""""""""""""""""""
" GUI
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar


"""""""""""""""""""""""""
" Persistent undo
set undodir=~/.vim/undo/
set undofile

" markdown
" let g:vim_markdown_fenced_languages = ['json=json']
let g:vim_markdown_new_list_item_indent = 2

let g:flow#enable=0
