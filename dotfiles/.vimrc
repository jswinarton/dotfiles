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

" new splits open to the right and below by default
set splitright
set splitbelow
" }}}

" Syntax and themes {{{
syntax on
filetype indent on
filetype plugin on
colorscheme gruvbox

hi Normal ctermbg=none
" }}}

" Plugins and plugin management {{{
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'marcweber/vim-addon-mw-utils'  " vim-snipmate dependency
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tlib_vim'  " vim-snipmate dependency
Plugin 'tpope/vim-fugitive'
call vundle#end()

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
" }}}

" Auto commands {{{
" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Language-specific settings {{{
autocmd Filetype ruby setlocal ts=2 sw=2 sts=2 expandtab colorcolumn=90
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab
autocmd Filetype python setlocal colorcolumn=81
" }}}

" Keybindings {{{
nnoremap <silent> <F8> :NERDTreeFocus<CR>
nnoremap <silent> <F9> :TagbarOpen -fj<CR>

nnoremap <silent> <Leader>o :CtrlPBufTag<CR>
nnoremap <silent> <Leader>n :set rnu!<CR>
nnoremap <silent> <Leader>a :set wrap!<CR>
nnoremap <silent> <Leader>z :redraw!<CR>

nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>q :q<CR>

nnoremap <silent> <Leader>lc :SyntasticCheck<CR>
nnoremap <silent> <Leader>lr :SyntasticReset<CR>
nnoremap <silent> <Leader>lt :SyntasticToggleMode<CR>

" Tab shortcuts
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> th :tabprev<CR>
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> tx :tabclose<CR>
nnoremap <silent> t1 :tabn 1<CR>
nnoremap <silent> t2 :tabn 2<CR>
nnoremap <silent> t3 :tabn 3<CR>
nnoremap <silent> t4 :tabn 4<CR>
nnoremap <silent> t5 :tabn 5<CR>
nnoremap <silent> t6 :tabn 6<CR>
nnoremap <silent> t7 :tabn 7<CR>
nnoremap <silent> t8 :tabn 8<CR>
nnoremap <silent> t9 :tabn 9<CR>

" Swap semicolon and colon mapping
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" }}}

