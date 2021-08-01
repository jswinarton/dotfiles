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

" set 'invisible' characters
" off by default
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" file write options
set autoread  " update file if it's changed outside of vim
set nobackup
set noswapfile
set nowb

" ignore these file patterns when expanding wildcards
set wildignore=*.pyc

" wildmenu options
set wildmenu

" status bar options
set laststatus=2

" new splits open to the right and below by default
set splitright
set splitbelow

" set a better location for the ctags file
set tags+=.tags

" Prevent the 'join' command from inserting two spaces after the end of
" sentences
set nojoinspaces

" all tabs, all the time
set tabpagemax=50

" }}}
" Plugins and plugin management {{{
set rtp+=~/.vim/bundle/Vundle.vim

" Some plugins require filetype to be turned
" off before loading Vundle
filetype off

call vundle#begin()
" plugin manager
Plugin 'gmarik/Vundle.vim'

" dependencies
Plugin 'marcweber/vim-addon-mw-utils'  " vim-snipmate
Plugin 'tomtom/tlib_vim'  " vim-snipmate

" themes
Plugin 'chriskempson/base16-vim'

" syntax highlighters
Plugin 'chr4/nginx.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'hashivim/vim-terraform.git'
Plugin 'plasticboy/vim-markdown'

" plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'garbas/vim-snipmate'
Plugin 'gregsexton/MatchTag'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'liuchengxu/vista.vim'
Plugin 'tmhedberg/matchit'  " % matching for HTML, LaTeX, etc.
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" experimental
Plugin 'neoclide/coc.nvim'

" occasional syntaxes (only enable when using)
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'mxw/vim-jsx'
Plugin 'jwalton512/vim-blade'
" Plugin 'posva/vim-vue'

call vundle#end()

filetype plugin indent on

" Snipmate
let g:snipMate = { 'snippet_version' : 1 }

" Airline
let g:airline_section_y = ''
let g:airline_powerline_fonts=1
let g:airline_mode_map = {'n': 'N', 'i': 'I', 'R': 'R', 'c': 'C', 'v': 'V', 'V': 'V', 's': 'S', 'S': 'S'}
let g:airline_theme = 'base16'
let g:airline_skip_empty_sections = 1

" Vista
let g:vista_sidebar_width = 40
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1

" Vim Markdown
let g:vim_markdown_folding_disabled = 1

" Gitgutter
let g:gitgutter_diff_base = $REVIEW_BASE
" }}}
" Syntax and themes {{{
syntax on
colorscheme base16-default-dark
" }}}
" Commands {{{
function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()

function! TrimTrailingWhitespace()
    :%s/\s\+$//e
endfunction
autocmd BufWritePre * call TrimTrailingWhitespace()

" Experimental command to list changed files in fzf
command! -bang FilesGit call fzf#run(fzf#wrap({'source': 'git files', 'sink': 'e'}))

" }}}
" Language-specific settings {{{
autocmd Filetype ansible setlocal syntax=yaml
autocmd Filetype elixir setlocal colorcolumn=80
autocmd Filetype go setlocal noexpandtab ts=8 sw=0 sts=0
autocmd Filetype java setlocal ts=4 sw=4 sts=4
autocmd Filetype markdown setlocal linebreak conceallevel=0
autocmd Filetype php setlocal ts=2 sw=2 sts=2 colorcolumn=90
autocmd Filetype python setlocal ts=4 sw=4 sts=4 colorcolumn=88
autocmd Filetype ruby setlocal colorcolumn=90
" }}}
" Keybindings {{{

" Command key without shift
noremap ; :

" Move through word wrap easily
noremap j gj
noremap k gk

noremap <F2> :set paste!<CR>
noremap <Space> :nohlsearch<CR>
noremap <Leader>nr :set number \| set relativenumber<CR>
noremap <Leader>nn :set number \| set norelativenumber<CR>
noremap <Leader>no :set nonumber \| set norelativenumber<CR>
noremap <Leader>a :set wrap!<CR>
noremap <Leader>i :set list!<CR>
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>

" Git shortcuts
noremap <Leader>gs :Git<CR>
noremap <Leader>gd :Gdiff<CR>
noremap <Leader>gb :Git blame<CR>
noremap <Leader>gf :FilesGit<CR>

" Fzf/vista search shortcuts
noremap <C-p> :Files<CR>
noremap <Leader><C-p> :Files ~/apps<CR>
noremap <C-o> :Vista finder<CR>
noremap <C-i> :History:<CR>
noremap <Leader><C-i> :History/<CR>
noremap <C-b> :Buffers<CR>

" These need to be reworked as env var passing from the shell is inconsistent
" noremap <Leader>gd :Gdiff $REVIEW_BASE<CR>
" noremap <F5> :Git -p diff --stat $REVIEW_BASE \| :exe ":resize " . (line('$') + 1)<CR>

noremap <F7> :Vista<CR>
noremap <Leader><F7> :Vista!!<CR>

" Tab shortcuts
noremap <Leader>tn :tabnew<CR>
noremap <Leader>th :tabprev<CR>
noremap <Leader>tl :tabnext<CR>
noremap <Leader>tx :tabclose<CR>

" this is to make snipmate a bit easier to use. when switching between tab
" stops, snipmate puts you into select mode. It seems like there's no easy way
" to clear out the default tab stop content and enter insert mode.
snoremap <Space> <Backspace>i
" }}}
