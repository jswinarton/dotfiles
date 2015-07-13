set nocompatible

syntax on
colorscheme badwolf

" VUNDLE PLUGINS
" -----------
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
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
set number
set scrolloff=15
set shiftwidth=4
set showmatch
set softtabstop=4
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
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>
nmap <C-k> :CtrlPBufTag<CR>

" force yourself to stop using arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
lnoremap <Up> <Nop>
lnoremap <Down> <Nop>
lnoremap <Left> <Nop>
lnoremap <Right> <Nop>

" additional settings are currently being taken from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" on a setting-by-setting basis.

