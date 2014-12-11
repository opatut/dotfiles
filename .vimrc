" basics
set nocompatible        " use Vim defaults
set t_Co=256            " set 256 color
"let g:solarized_termcolors=256
"set background=dark
"let solarized_termtrans=1
"colorscheme solarized
colorscheme wombat256
set mouse=a             " make sure mouse is used in all cases.
set shortmess+=I        " disable the welcome screen
set clipboard+=unnamed  " yank and copy to X clipboard
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set ruler               " ruler display in status line
set hidden              " enable buffer switching without saving
set showmode            " show mode at bottom of screen
set showcmd             " show incomplete command at bottom of screen
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set cmdheight=1         " set the command height
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
set mat=5               " show matching brackets for 0.5 seconds
"set background=dark     " we don't like bright white terminals
set gfn=Tamsyn\ 10
set number              " show line numbers
"set relativenumber

" cursor settings
set cursorline          " highlight cursor line
"set cursorcolumn        " highlight cursor column (breaks completion preview)

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
nnoremap <silent> <F2> :set list!<CR>
inoremap <silent> <F2> <esc>:set list!<CR>a

" command mode
set wildmenu
set wildmode=list:longest,full

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search

" syntax highlighting
syntax on               " enable syntax highlighting

" statusline
"set statusline=%<%f\ %y%h%m%r\ PWD:%{getcwd()}%=%-14.(%l,%c%V%)\ %P
"set laststatus=2

" plug-in settings
filetype indent on

" auto completion stuff
filetype plugin on
set ofu=syntaxcomplete#Complete

set complete+=k         " enable dictionary completion

set completeopt=menuone,menu,longest,preview

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" clang completion
let g:clang_complete_auto = 1
"let g:clang_complete_copen = 1
let g:clang_hl_errors = 1

" super tab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "context"

" taglist
nnoremap <silent> <F8> :TlistToggle<CR>
inoremap <silent> <F8> <esc>:TlistToggle<CR>a
nnoremap <silent> <F7> :TlistUpdate<CR>
inoremap <silent> <F7> <esc>:TlistUpdate<CR>a
let Tlist_Use_Right_Window = 1
let Tlist_Compart_Format = 1
let Tlist_Show_Menu = 1
let Tlist_Exit_OnlyWindow = 1

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
inoremap <silent> <F6> <esc>:NERDTreeToggle<CR>a

" map : to ; in normal mode
"map ; :

map ggwp :wq<CR>
map \p "+p
map \y "+y
map \d "+d

" spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR> 

" python script run
map <F9> :w! <CR> :!python %<CR>

map <c-tab> :bn
map <c-s-tab> :bp

" restore position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END

" file types
au BufRead,BufNewFile *.html5 set filetype=php
au BufRead,BufNewFile *.html set filetype=php
au BufRead,BufNewFile *.tpl set filetype=php
au BufRead,BufNewFile *.qml set filetype=qml
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1
"autocmd FileType python :set textwidth=79
"autocmd FileType python set expandtab shiftwidth=4 softtabstop=4 
autocmd Filetype tex,latex :set grepprg=grep\ -nH\ $*
autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict
autocmd Filetype tex,latex :set textwidth=99

" gui
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar

" persistent undo
set undodir=~/.vim/undo/
set undofile

execute pathogen#infect()


let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
