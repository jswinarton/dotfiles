syntax on

filetype plugin on
filetype indent on

" matches the current line indent when starting a new line
set autoindent

" reload the file if it's changed by another process
set autoread

" Use C language smart indenting rules
set cindent

" use spaces instead of tabs
set expandtab  

" don't back anything up using vim, since
" pretty much everything uses VCS these days
set nobackup
set noswapfile
set nowb

set shiftwidth=4
set showmatch
set softtabstop=4
set tabstop=4

execute pathogen#infect()
colorscheme badwolf

" additional settings are currently being taken from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" on a setting-by-setting basis.

