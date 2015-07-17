set nocompatible

syntax on
colorscheme Tomorrow-Night

" VUNDLE PLUGINS
" -----------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle itself is managed by Vundle
Plugin 'gmarik/Vundle.vim'

" Snipmate and dependencies
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" Everything else
"Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-unimpaired'

call vundle#end()

" VIM SETTINGS
" ----------
filetype indent on
filetype plugin on

" indentation
" use spaces instead of tabs.
" 4 spaces to a tab.
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

" search options
set ignorecase " searches are case insensitive by default.
set smartcase  " ... unless capital letters are used in the search string.
set incsearch  " search incrementally
set hlsearch  " highlight matches

" make backspace work like it should.
set backspace=indent,eol,start

" display options
set number  " always show line numbers
set scrolloff=15  " keep 15 lines above and below the cursor
set ruler  " show current position in file

" file write options
set autoread  " update file if it's changed outside of vim
" disable vim's file backup
set nobackup
set noswapfile
set nowb

" ignore these file patterns when expanding wildcards
set wildignore=*.pyc,*/node_modules/*,*/bower_components/*,*/.virtualenv/*

" VIM AUTO COMMANDS
" ----------

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" KEYBINDINGS
" ----------
nmap <F7> :Ack
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>
"nmap <C-k> :CtrlPBufTag<CR>

" Quick window-moving shortcuts
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" force yourself to stop using arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
noremap <Home> <Nop>
noremap <End> <Nop>
noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>
noremap! <PageUp> <Nop>
noremap! <PageDown> <Nop>
noremap! <Home> <Nop>
noremap! <End> <Nop>

" PLUGIN SETTINGS
" ----------

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$','\.git$']

" Syntastic
let g:syntastic_always_populate_loclist = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
" don't do auto syntax checking on html,
" because it's annoying
let g:syntastic_mode_map = {
    \ "passive_filetypes": ["html"]
\ }

" SYNTAX
" ----------

" jinja
let g:jinja_syntax_html = 1
autocmd BufNewFile,BufRead *.html :setf jinja
