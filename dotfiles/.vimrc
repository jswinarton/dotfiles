" vim:fdm=marker

" Base settings {{{
set nocompatible
set background=dark

" indentation
" use spaces instead of tabs
" 2 spaces to a tab
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" search options
set hlsearch  " highlight matches
set ignorecase  " searches are case insensitive by default
set incsearch  " search incrementally
set smartcase  " case sensitive if capital letters are used in the search

" make backspace work like it should.
set backspace=indent,eol,start

" display options
set number  "  show line numbers
set relativenumber  " show relative line numbers
set ruler  " show current position in file
set scrolloff=15  " keep 15 lines above and below the cursor
set nowrap " no word wrap by default

" show 'invisible' characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

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

" new splits open to the right and below by default
set splitright
set splitbelow
" }}}

" Syntax and themes {{{
syntax on
colorscheme gruvbox

hi Normal ctermbg=none
" }}}

" Plugins and plugin management {{{
set rtp+=~/.vim/bundle/Vundle.vim

" Some plugins require filetype to be turned
" off before loading Vundle
filetype off

call vundle#begin()
" dependencies
Plugin 'marcweber/vim-addon-mw-utils'  " vim-snipmate
Plugin 'tomtom/tlib_vim'  " vim-snipmate
Plugin 'godlygeek/tabular'  " vim-markdown

" plugins
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'chrisbra/csv.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'elixir-lang/vim-elixir'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/Vundle.vim'
Plugin 'jamessan/vim-gnupg'
Plugin 'majutsushi/tagbar'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
call vundle#end()

filetype plugin indent on

" Airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_x = ''
let g:airline_section_y = ''

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore ".git/*" "*.pyc" "tmp/*"'

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore = ['\.pyc$','\.git$']

" Syntastic
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" Vim Markdown
let g:vim_markdown_folding_disabled = 1
" }}}

" Auto commands {{{
" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Language-specific settings {{{
autocmd Filetype ruby setlocal colorcolumn=90
autocmd Filetype python setlocal ts=4 sw=4 sts=4 colorcolumn=81
autocmd Filetype markdown setlocal linebreak conceallevel=2
autocmd Filetype java setlocal ts=4 sw=4 sts=4
" }}}

" Keybindings {{{
noremap <silent> <F2> :set paste!<CR>
noremap <silent> <F8> :NERDTreeFocus<CR>
noremap <silent> <F9> :TagbarOpen -fj<CR>
noremap <silent> <F12> :q<CR>

noremap <silent> <Leader>nr :set number \| set relativenumber<CR>
noremap <silent> <Leader>nn :set number \| set norelativenumber<CR>
noremap <silent> <Leader>no :set nonumber \| set norelativenumber<CR>

noremap <silent> <Leader>o :CtrlPBufTag<CR>
noremap <silent> <Leader>a :set wrap!<CR>
noremap <silent> <Leader>z :redraw!<CR>
noremap <silent> <Leader>i :set list!<CR>
noremap <silent> <Leader><Space> :nohlsearch<CR>

noremap <silent> <Leader>s :split<CR>
noremap <silent> <Leader>v :vsplit<CR>

noremap <silent> <Leader>lc :SyntasticCheck<CR>
noremap <silent> <Leader>lr :SyntasticReset<CR>
noremap <silent> <Leader>lt :SyntasticToggleMode<CR>

" Tab shortcuts
noremap <silent> tn :tabnew<CR>
noremap <silent> th :tabprev<CR>
noremap <silent> tl :tabnext<CR>
noremap <silent> tx :tabclose<CR>
noremap <silent> t1 :tabn 1<CR>
noremap <silent> t2 :tabn 2<CR>
noremap <silent> t3 :tabn 3<CR>
noremap <silent> t4 :tabn 4<CR>
noremap <silent> t5 :tabn 5<CR>
noremap <silent> t6 :tabn 6<CR>
noremap <silent> t7 :tabn 7<CR>
noremap <silent> t8 :tabn 8<CR>
noremap <silent> t9 :tabn 9<CR>

" Swap semicolon and colon mapping
noremap ; :

" Move through word wrap easily
noremap j gj
noremap k gk

" }}}
