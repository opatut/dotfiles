call plug#begin()

""" Unsorted
Plug 'ervandew/supertab' " ??
Plug 'ompugao/ctrlp-history'
" Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'toddfoster/ctrlp-notes'
Plug 'vimwiki/vimwiki'
Plug 'jamessan/vim-gnupg'
Plug 'vim-scripts/taglist.vim'
Plug 'plytophogy/vim-virtualenv'

""" Syntax checking (yes, I tried all of these)
"Plug 'q0LoCo/syntastic', {'branch': 'async'}
"Plug 'vim-syntastic/syntastic'
"Plug 'neomake/neomake'
"Plug 'maralla/validator.vim'
Plug 'w0rp/ale'


""" Visuals
" Plug 'mbbill/vim-seattle'
Plug 'w0ng/vim-hybrid'
Plug 'jonathanfilip/vim-lucius'
" Plug 'sheerun/vim-wombat-scheme'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-thematic'
Plug 'rakr/vim-one'

""" Utilities
Plug 'AndrewRadev/splitjoin.vim'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }
" Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer' }
Plug 'editorconfig/editorconfig-vim'
Plug 'gabesoft/vim-ags'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/regreplop.vim'
" Plug 'vim-scripts/matchit.zip'
Plug 'bronson/vim-visual-star-search'
Plug 'reedes/vim-pencil'
Plug 'bogado/file-line'

""" Languages and dialects
Plug 'fatih/vim-go'
Plug 'wizicer/vim-jison'
Plug 'alunny/pegjs-vim'
Plug 'tpope/vim-markdown'
Plug 'jparise/vim-graphql'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'udalov/kotlin-vim'
Plug 'digitaltoad/vim-pug'
" Plug 'vim-latex/vim-latex'
Plug 'IN3D/vim-raml'
Plug 'calviken/vim-gdscript3' " godot game engine
Plug 'leafgarland/typescript-vim'
Plug 'sirtaj/vim-openscad' " OpenSCAD
" Plug 'suan/vim-instant-markdown'

""" Javascript
" Plug 'kern/vim-es7'
" Plug 'mxw/vim-jsx'
" Plug 'othree/es.next.syntax.vim'
" Plug 'flowtype/vim-flow'
"Plug 'gavocanov/vim-js-indent'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'opatut/vim-javascript-syntax'
" Plug 'vim-scripts/JavaScript-Indent'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
" Plug 'bigfish/vim-js-context-coloring'

""" CSS
" Plug 'skammer/vim-css-color'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'

""" Disabled
"Plug 'airblade/vim-gitgutter'
"Plug 'eagletmt/neco-ghc'


""" User defined text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'          " ie / ae: Entire buffer (without or witht extra line)
Plug 'sgur/vim-textobj-parameter'       " i, / a,: Parameter (without/with comma)

call plug#end()

