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
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
call vundle#end()

" VIM SETTINGS
" ----------
filetype indent on
filetype plugin on

set autoindent
set autoread
set backspace=indent,eol,start
set cindent
set colorcolumn=80
set expandtab
set ignorecase
set incsearch
set hlsearch
set magic
set laststatus=2
set number
set scrolloff=15
set shiftwidth=4
set showmatch
set softtabstop=4
set ruler
set tabstop=4
set wildignore=*.pyc

set nobackup
set noswapfile
set nowb

" VIM AUTO COMMANDS
" ----------

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" KEYBINDINGS
" ----------
noremap ; :

nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>
nmap <C-k> :CtrlPBufTag<CR>

" force yourself to stop using arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <PageUp> <Nop>
noremap <PageDown> <Nop>
noremap <Home> <Nop>
noremap <End> <Nop>
lnoremap <Up> <Nop>
lnoremap <Down> <Nop>
lnoremap <Left> <Nop>
lnoremap <Right> <Nop>
lnoremap <PageUp> <Nop>
lnoremap <PageDown> <Nop>
lnoremap <Home> <Nop>
lnoremap <End> <Nop>

" STATUS LINE
" ----------

let g:airline_section_x = ''
let g:airline_section_y = '%{airline#util#prepend(airline#extensions#tagbar#currenttag(),0)}%{airline#util#wrap(airline#parts#filetype(),0)}'
let g:airline_section_z = '%3p%% %#__accent_bold#%4l%#__restore__#:%3v'

" PLUGIN SETTINGS
" ----------

" NERDTree
let NERDTreeShowHidden = 1

" Syntastic
let g:syntastic_always_populate_loclist = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" Powerline
let g:airline_powerline_fonts = 1

" additional settings are currently being taken from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" on a setting-by-setting basis.
