syntax on
colorscheme badwolf

" VUNDLE PLUGINS
" -----------
set nocompatible
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

filetype plugin indent on

set autoindent
set autoread
set backspace=indent,eol,start
set cindent
set colorcolumn=80
set expandtab
set ignorecase
set magic
set nobackup
set noswapfile
set nowb
set number
set scrolloff=15
set shiftwidth=4
set showmatch
set softtabstop=4
set tabstop=4
set wildignore=*.pyc

" VIM AUTO COMMANDS
" ----------

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e


" KEYBINDINGS
" ----------
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>

" additional settings are currently being taken from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" on a setting-by-setting basis.

