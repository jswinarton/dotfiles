require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP config
  use 'neovim/nvim-lspconfig'

  -- nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- vsnip
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- Vista
  use 'liuchengxu/vista.vim'

  -- theme
  use 'chriskempson/base16-vim'

  -- syntax highlighters
  use 'plasticboy/vim-markdown'

  -- fzf
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'

  -- other plugins
  use 'airblade/vim-gitgutter'
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-vinegar'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- old stuff that I am not sure is even necessary anymore
  -- use 'gregsexton/MatchTag'
  -- use 'liuchengxu/vista.vim'
  -- use 'tmhedberg/matchit'  " % matching for HTML, LaTeX, etc.

  -- occasional syntaxes (only enable when using)
  -- use 'hashivim/vim-terraform.git'
  -- use 'amadeus/vim-mjml'
  -- use 'cakebaker/scss-syntax.vim'
  -- use 'cespare/vim-toml'
  -- use 'chr4/nginx.vim'
  -- use 'elixir-lang/vim-elixir'
  -- use 'jwalton512/vim-blade'
  -- use 'ledger/vim-ledger'
  -- use 'mxw/vim-jsx'
  -- use 'peterhoeg/vim-qml'
  -- use 'posva/vim-vue'
end)



vim.cmd([[
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

filetype plugin indent on

" Snipmate
let g:snipMate = { 'snippet_version' : 1 }

" Airline
let g:airline_powerline_fonts=1
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
" Temporarily disable because these are overriding the jump list commands
" noremap <C-o> :Commands<CR>
" noremap <C-i> :History:<CR>
noremap <Leader><C-i> :History/<CR>
noremap <C-b> :Buffers<CR>
noremap <Leader>o :Vista!!<CR>

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
]])

-- NVIM-CMP CONFIG
-- Copied from https://github.com/hrsh7th/nvim-cmp/

local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- LSP CONFIGS
require'lspconfig'.pylsp.setup{}

-- LSP CONFIG DEFAULT MAPPINGS
-- Copied from https://github.com/neovim/nvim-lspconfig

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
