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
" dependencies
Plugin 'marcweber/vim-addon-mw-utils'  " vim-snipmate
Plugin 'tomtom/tlib_vim'  " vim-snipmate

" plugins
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'jswinarton/magik'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
call vundle#end()

filetype plugin indent on

" Airline
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_powerline_fonts=1
let g:airline_mode_map = {'n': 'N', 'i': 'I', 'R': 'R', 'c': 'C', 'v': 'V', 'V': 'V', 's': 'S', 'S': 'S'}

" CtrlP
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore ".git/*" --ignore "*.pyc" --ignore "tmp/*" --ignore "_build/*" --ignore "__pycache__/*"'

" NERDTree
let NERDTreeHijackNetrw = 1
let NERDTreeShowLineNumbers = 1

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
autocmd Filetype ruby setlocal colorcolumn=90
autocmd Filetype python setlocal ts=4 sw=4 sts=4 colorcolumn=81
autocmd Filetype markdown setlocal linebreak conceallevel=0
autocmd Filetype java setlocal ts=4 sw=4 sts=4
autocmd Filetype go setlocal ts=8 sw=0 sts=0
autocmd Filetype elixir setlocal colorcolumn=80
" }}}
" Keybindings {{{
noremap <F2> :set paste!<CR>
noremap <F7> :TagbarToggle<CR>
noremap <F8> :TagbarOpenAutoClose<CR>
noremap <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
noremap <F10> :source ~/.vimrc<CR>
noremap <F12> :q<CR>

noremap - :e .<CR>


noremap <C-o> :CtrlPTag<CR>
noremap <C-b> :CtrlPBuffer<CR>

noremap <Leader>nr :set number \| set relativenumber<CR>
noremap <Leader>nn :set number \| set norelativenumber<CR>
noremap <Leader>no :set nonumber \| set norelativenumber<CR>

noremap <Leader>a :set wrap!<CR>
noremap <Leader>i :set list!<CR>
noremap <Leader>h :nohlsearch<CR>

noremap <Space> :nohlsearch<CR>

noremap <S-Enter> O<Esc>
noremap <CR> o<Esc>

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
noremap tn :tabnew<CR>
noremap th :tabprev<CR>
noremap tl :tabnext<CR>
noremap tx :tabclose<CR>
noremap t1 :tabn 1<CR>
noremap t2 :tabn 2<CR>
noremap t3 :tabn 3<CR>
noremap t4 :tabn 4<CR>
noremap t5 :tabn 5<CR>
noremap t6 :tabn 6<CR>
noremap t7 :tabn 7<CR>
noremap t8 :tabn 8<CR>
noremap t9 :tabn 9<CR>

" Swap semicolon and colon mapping
noremap ; :

" Move through word wrap easily
noremap j gj
noremap k gk

" }}}
