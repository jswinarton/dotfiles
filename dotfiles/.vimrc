" vim:fdm=marker

" Base settings {{{
set nocompatible
set background=dark

" indentation
" use spaces instead of tabs
" 4 spaces to a tab
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4

" search options
set hlsearch  " highlight matches
set ignorecase  " searches are case insensitive by default
set incsearch  " search incrementally
set smartcase  " case sensitive if capital letters are used in the search

" make backspace work like it should.
set backspace=indent,eol,start

" display options
set colorcolumn=80
set number  " always show line numbers
set ruler  " show current position in file
set scrolloff=15  " keep 15 lines above and below the cursor

" file write options
set autoread  " update file if it's changed outside of vim
set nobackup
set noswapfile
set nowb

" ignore these file patterns when expanding wildcards
set wildignore=*.pyc,*/node_modules/*,*/bower_components/*,*/.virtualenv/*

" wildmenu options
set wildmenu

" status bar options
set laststatus=2
" }}}

" Syntax and themes {{{
syntax on
filetype indent on
filetype plugin on
colorscheme gruvbox
" }}}

" Plugins and plugin management {{{
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marcweber/vim-addon-mw-utils'  " vim-snipmate dependency
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'  " vim-snipmate dependency
Plugin 'tpope/vim-fugitive'
call vundle#end()

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$','\.git$']
" }}}

" Auto commands {{{
" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Keybindings {{{
nnoremap <silent> <F8> :NERDTreeFocus<CR>
nnoremap <silent> <Leader>u :NERDTreeToggle<CR>

nnoremap <silent> <F9> :TagbarOpen -fj<CR>
nnoremap <silent> <Leader>i :TagbarToggle<CR>

nnoremap <silent> <Leader>r :CtrlPBufTag<CR>
" }}}

