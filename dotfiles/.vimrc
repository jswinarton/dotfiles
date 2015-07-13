syntax on
filetype plugin on
filetype indent on

" VIM SETTINGS
" ----------

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
set softtabstop=4
set tabstop=4
set showmatch

" VIM AUTO COMMANDS
" ----------

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e


" KEYBINDINGS
" ----------
nmap <F8> :NERDTreeToggle<CR>
nmap <F9> :TagbarToggle<CR>


" PLUGINS AND THEMES
" ----------
execute pathogen#infect()
colorscheme badwolf

" additional settings are currently being taken from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" on a setting-by-setting basis.

