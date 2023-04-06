-- TODO
-- Figure out why you can't see certain hidden files in the file browser, etc

-- BASIC CONFIG
--

-- indentation
-- use spaces instead of tabs
-- 2 spaces to a tab by default (this is modified on a per-file basis later)
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- search options
vim.opt.ignorecase = true -- searches are case insensitive by default
vim.opt.smartcase = true -- case sensitive if capital letters are used in the search

-- display options
vim.opt.number = true  --  show line numbers
vim.opt.relativenumber = true  -- show relative line numbers
vim.opt.scrolloff = 15  -- keep 15 lines above and below the cursor
vim.opt.wrap = false -- no word wrap by default

-- set 'invisible' characters
-- off by default
-- TODO make this work with the new syntax
-- vim.opt.lcs = "tab:▸\ ,trail:·,eol:¬,nbsp:_"

-- ignore these file patterns when expanding wildcards
vim.opt.wildignore = "*.pyc"

-- wildmenu options
vim.opt.wildmenu = true

-- new splits open to the right and below by default
vim.opt.splitright = true
vim.opt.splitbelow = true

-- PLUGIN INITIALIZATION
--

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use 'chriskempson/base16-vim'

  -- LSP standard configs
  -- These are out-of-the-box configurations provided by neovim
  -- for most language servers (the server itself must be installed separately)
  use 'neovim/nvim-lspconfig'

  -- nvim-cmp
  -- Completion engine and sources
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- vsnip
  -- Snippet engine
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- syntax highlighters
  use { 'plasticboy/vim-markdown', ft = { 'markdown' } }
  use { 'hashivim/vim-terraform.git', ft = { 'terraform' } }
  use { 'ledger/vim-ledger', ft = { 'ledger' } }

  -- lazygit integration
  use 'kdheepak/lazygit.nvim'

  -- vim-airline
  -- better statusline
  use {
    'vim-airline/vim-airline',
    requires = { 'vim-airline/vim-airline-themes' },
    config = function()
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_theme = 'base16'
      vim.g.airline_skip_empty_sections = 1
    end
  }

  -- gitsigns
  -- shows changed git lines in the left column
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    tag = "v0.6",
    config = function()
      require('gitsigns').setup()
    end
  }

  -- gitlinker
  -- highlight some lines and get a github permalink
  -- default shortcut is <Leader>gy
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("gitlinker").setup()
    end
  }

  -- telescope-file-browser
  -- netrw replacement
  -- Note that this uses telescope under the hood, which is a
  -- fuzzyfinder similar to fzf. Ideally you would only use one or
  -- the other and reduce dependencies
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require("telescope").setup {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
          }
        },
        extensions = {
          file_browser = {
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
          },
        },
      }
      -- To get telescope-file-browser loaded and working with telescope,
      -- you need to call load_extension, somewhere after setup function:
      require("telescope").load_extension "file_browser"
    end
  }

  -- other plugins
  use 'christoomey/vim-tmux-navigator' -- navigate btwn vim/tmux splits with same hotkeys
  use 'tpope/vim-commentary' -- keybindings and language support for commenting
  use 'tpope/vim-surround' -- keybindings for editing within "surrounds" (quotes etc)

  -- TODO add comment config for lesser used filetypes (see tpope/vim-commentary docs)
  -- TODO add back occasional syntaxes with conditional loading:
  -- use 'amadeus/vim-mjml'
  -- use 'chr4/nginx.vim'
  -- use 'elixir-lang/vim-elixir'
  -- use 'jwalton512/vim-blade'
  -- use 'mxw/vim-jsx'
  -- use 'peterhoeg/vim-qml'
  -- use 'posva/vim-vue'
end)

-- COLORS
--
vim.cmd [[ colorscheme base16-default-dark ]]


-- AUTOCOMMANDS
--


vim.cmd([[
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
]])


-- KEYBINDINGS
--
-- Good keys for using in keybinding:
-- CTRL+I, CTRL+M, CTRL+N, CTRL+P, CTRL+_
-- Space, Backspace, Enter, +, \
-- Function keys starting from <F2> and shifted function keys <S-F2> etc.
-- Alt-key combinations
--
-- See :help map-which-keys for general strategies on keybinding
-- See :help index for a full list of keys that are used
-- Unbound keys marked as "not used", aliases marked as "same as"

-- vim.g.mapleader = " "

local default_opts = { noremap = true, silent = true }
local telescope = require("telescope.builtin")

-- High level telescope bindings
vim.keymap.set('n', '<C-p>', ":Telescope find_files find_command=rg,--files,--hidden<CR>", default_opts)
vim.keymap.set('n', '<C-n>', telescope.live_grep, default_opts)
vim.keymap.set('n', '-', ":Telescope file_browser hidden=true<CR>", default_opts)

-- Git keybindings
-- Typical prefix is <Leader>g
-- Note that Git linker uses <Leader>gy
vim.keymap.set("n", "<F11>", ":LazyGit<CR>", default_opts)
vim.keymap.set("n", "<Leader>gg", ":LazyGit<CR>", default_opts)
vim.keymap.set("n", "<Leader>gs", telescope.git_status, default_opts)
vim.keymap.set("n", "<Leader>gb", telescope.git_branches, default_opts)



vim.cmd([[
" Command key without shift
noremap ; :

" Move through word wrap easily
noremap j gj
noremap k gk

noremap <F2> :set paste!<CR>
noremap <Leader><Space> :nohlsearch<CR>
noremap <Leader>nr :set number \| set relativenumber<CR>
noremap <Leader>nn :set number \| set norelativenumber<CR>
noremap <Leader>no :set nonumber \| set norelativenumber<CR>
noremap <Leader>a :set wrap!<CR>
noremap <Leader>i :set list!<CR>
noremap <Leader>s :split<CR>
noremap <Leader>v :vsplit<CR>

" Tab shortcuts
noremap <Leader>tn :tabnew<CR>
noremap <Leader>th :tabprev<CR>
noremap <Leader>tl :tabnext<CR>
noremap <Leader>tx :tabclose<CR>
]])

-- NVIM-CMP CONFIG
-- Copied from https://github.com/hrsh7th/nvim-cmp/

local cmp = require('cmp')

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
    -- Setting `select = true` enables the behaviour that will select the
    -- first completion even if it hasn't been explicitly selected
    -- This must be disabled in command mode because it conflicts with execution
    ['<CR>'] = cmp.mapping(cmp.mapping.confirm({ select = true })),
    ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })

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
require('cmp_nvim_lsp').default_capabilities()

-- LSP CONFIG DEFAULT MAPPINGS
-- Copied from https://github.com/neovim/nvim-lspconfig

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, default_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, default_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, default_opts)
vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, default_opts)

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
  -- Temporarily disable this because it interferes with navigating through splits
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.formatting { async = true } end, bufopts)
end


require('lspconfig')['pylsp'].setup({
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pylint = { enabled = true },
        flake8 = { enabled = false },
        pycodestyle = { enabled = false },
        pyflakes = { enabled = false },
      }
    }
  }
})

require('lspconfig')['tsserver'].setup({
    on_attach = on_attach,
})

require('lspconfig')['eslint'].setup({
    on_attach = on_attach,
})
