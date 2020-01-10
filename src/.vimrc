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
Plugin 'jswinarton/magik'

" syntax highlighters
Plugin 'chr4/nginx.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'hashivim/vim-terraform.git'

" occasional syntaxes (only enable when using)
" Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'mxw/vim-jsx'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'posva/vim-vue'

" plugins
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'gregsexton/MatchTag'
Plugin 'majutsushi/tagbar'
Plugin 'tmhedberg/matchit'  " % matching for HTML, LaTeX, etc.
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-surround'

" extra plugins you don't use very often (but ought to try more)
" Plugin 'godlygeek/tabular' " for string alignment
call vundle#end()

filetype plugin indent on

" Airline
let g:airline_section_y = ''
let g:airline_powerline_fonts=1
let g:airline_mode_map = {'n': 'N', 'i': 'I', 'R': 'R', 'c': 'C', 'v': 'V', 'V': 'V', 's': 'S', 'S': 'S'}
let g:airline_theme = 'magik'
let g:airline_skip_empty_sections = 1

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore ".git/*" --ignore "*.pyc" --ignore "tmp/*" --ignore "_build/*" --ignore "__pycache__/*"'
let g:ctrlp_dont_split = 'nerdtree' " prevent CtrlP from splitting if the active window is nerdtree

" Syntastic
let g:syntastic_mode_map = {'mode': 'passive'}
let g:syntastic_ruby_checkers = ['rubocop', 'mri']

" Vim Markdown
let g:vim_markdown_folding_disabled = 1
" }}}
" Syntax and themes {{{
syntax on
colorscheme magik
" }}}
" Auto commands {{{
function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction

function! TrimTrailingWhitespace()
    :%s/\s\+$//e
endfunction


autocmd BufWritePre * call TrimEndLines()
autocmd BufWritePre * call TrimTrailingWhitespace()
" }}}
" Language-specific settings {{{
autocmd Filetype ansible setlocal syntax=yaml
autocmd Filetype elixir setlocal colorcolumn=80
autocmd Filetype go setlocal ts=8 sw=0 sts=0
autocmd Filetype java setlocal ts=4 sw=4 sts=4
autocmd Filetype markdown setlocal linebreak conceallevel=0
autocmd Filetype python setlocal ts=4 sw=4 sts=4 colorcolumn=81,100
autocmd Filetype ruby setlocal colorcolumn=90
" }}}
" Keybindings {{{

" Command key without shift
noremap ; :

" Move through word wrap easily
noremap j gj
noremap k gk

noremap <F2> :set paste!<CR>
noremap <F7> :TagbarOpen fj<CR>
noremap <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
noremap <F10> :source ~/.vimrc<CR>

noremap <C-o> :CtrlPTag<CR>
noremap <C-b> :CtrlPBuffer<CR>

noremap <Leader>nr :set number \| set relativenumber<CR>
noremap <Leader>nn :set number \| set norelativenumber<CR>
noremap <Leader>no :set nonumber \| set norelativenumber<CR>

noremap <Leader>a :set wrap!<CR>
noremap <Leader>i :set list!<CR>
noremap <Leader>h :nohlsearch<CR>

noremap <Space> :nohlsearch<CR>

noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>

noremap <Leader>lc :SyntasticCheck<CR>
noremap <Leader>lr :SyntasticReset<CR>
noremap <Leader>lt :SyntasticToggleMode<CR>

" this is to make snipmate a bit easier to use. when switching between tab
" stops, snipmate puts you into select mode. It seems like there's no easy way
" to clear out the default tab stop content and enter insert mode.
snoremap <Space> <Backspace>i


" Tab shortcuts
noremap <Leader>tn :tabnew<CR>
noremap <Leader>th :tabprev<CR>
noremap <Leader>tl :tabnext<CR>
noremap <Leader>tx :tabclose<CR>
noremap <Leader>1 :tabn 1<CR>
noremap <Leader>2 :tabn 2<CR>
noremap <Leader>3 :tabn 3<CR>
noremap <Leader>4 :tabn 4<CR>
noremap <Leader>5 :tabn 5<CR>
noremap <Leader>6 :tabn 6<CR>
noremap <Leader>7 :tabn 7<CR>
noremap <Leader>8 :tabn 8<CR>
noremap <Leader>9 :tabn 9<CR>


" }}}
