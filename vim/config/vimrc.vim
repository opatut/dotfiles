" basics
set nocompatible        " use Vim defaults
set t_Co=256            " set 256 color
"let g:solarized_termcolors=256
"set background=dark
"let solarized_termtrans=1
"colorscheme solarized
colorscheme wombat256i
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
set number              " show line numbers (alternative: set relativenumber)

let mapleader = "\<space>"

" gvim only
set background=dark     " we don't like bright white terminals
set guifont=Source\ Code\ Pro\ 11
highlight Normal guibg=black

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
syntax on               " enable syntax highlighting

" statusline
set statusline=%<%f\ %y%h%m%r\ PWD:%{getcwd()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2

" plug-in settings
filetype indent on

" auto completion stuff
filetype plugin on
set ofu=syntaxcomplete#Complete

" set complete+=k " enable dictionary completion
" set completeopt=menuone,menu,longest,preview

" Automatically open and close the popup menu / preview window
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" clang completion
let g:clang_complete_auto = 1
"let g:clang_complete_copen = 1
let g:clang_hl_errors = 1

" Super tab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "context"

" minibufexpl
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" nerdtree
source ~/.vim/config/map.vim

"""""""""""""""""""""""""
" file types...
" au BufRead,BufNewFile *.html5 set filetype=php
au BufRead,BufNewFile,FileType *.less.module set filetype=less

" ???
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1

"""""""""""""""""""""""""
" GUI
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar

"""""""""""""""""""""""""
" Persistent undo
set undodir=~/.vim/undo/
set undofile


execute pathogen#infect()


"""""""""""""""""""""""""
" CtrlP config
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif


"""""""""""""""""""""""""
" Auto CWD
"
" A standalone function to set the working directory to the project's root, or
" to the parent directory of the current file if a root can't be found:
" (from https://github.com/szw/vim-ctrlspace/issues/36)
function! s:setcwd()
  let cph = expand('%:p:h', 1)
  if cph =~ '^.\+://' | retu | en
  for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects']
    let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
    if wd != '' | let &acd = 0 | brea | en
  endfo
  exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
endfunction
" autocmd BufEnter * call s:setcwd()


"""""""""""""""""""""""""
" Linting (Syntastic)
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '⚫'
let g:syntastic_warning_symbol = '⚫'
let g:syntastic_enable_highlighting=1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '/home/paul/.npm-global/bin/eslint_d'
let g:syntastic_debug_file = '/home/paul/.vim/syntastic.log'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"""""""""""""""""""""""""
" Various stuff that I won't use right now

" python script run
" map <F9> :w! <CR> :!python %<CR>
"
"
"
