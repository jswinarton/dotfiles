syntax on

filetype plugin on
filetype indent on

" vim settings
" ----------

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

" scroll offset (number of lines that should be visible above
" and below the cursor)
set scrolloff=15

" number of spaces to use for each auto/indent step
set shiftwidth=4
set softtabstop=4
set tabstop=4

" show matching brackets
set showmatch


" vim auto commands
" ----------

" remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

execute pathogen#infect()
colorscheme badwolf

" additional settings are currently being taken from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" on a setting-by-setting basis.

