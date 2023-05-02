require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use {
    "shaunsingh/moonlight.nvim",
    config = function() require("plugin.moonlight") end
  }

  -- Treesitter
  -- Improved syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require("plugin.treesitter") end
  }

  -- Mason
  -- package manager for LSP config, DAP, linting, etc.
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate", -- :MasonUpdate updates registry contents
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    requires = { "mason.nvim" },
  }

  -- LSP standard configs
  -- These are out-of-the-box configurations provided by neovim
  -- for most language servers (the server itself must be installed separately
  -- which is handled by Mason)
  use {
    'neovim/nvim-lspconfig',
    config = function() require("plugin.lsp") end,
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    }
  }

  -- null-ls
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'neovim/nvim-lspconfig' },
    config = function() require("null-ls").setup({}) end
  }
  -- nvim-dap
  use { 'mfussenegger/nvim-dap' }

  -- Bridging utils that connect Mason with null-ls and nvim-dap
  use {
    'jay-babu/mason-null-ls.nvim',
    requires = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim"
    }
  }
  use {
    'jay-babu/mason-nvim-dap.nvim',
    requires = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    }
  }


  -- nvim-cmp
  -- Completion engine and sources
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
    },
    config = function() require("plugin.cmp") end
  }

  -- telescope
  -- fuzzy finder engine
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function() require("plugin.telescope") end
  }

  -- trouble (diagnostics)
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require("plugin.trouble") end
  }

  -- copilot
  -- use "github/copilot.vim"

  -- TODO reconfigure navbuddy with server prefs
  -- to prevent LSP errors
  -- see https://github.com/SmiteshP/nvim-navbuddy#-customise
  -- navbuddy
  -- on-the-fly LSP navigation
  -- use {
  --   "SmiteshP/nvim-navbuddy",
  --   requires = {
  --     "neovim/nvim-lspconfig",
  --     "SmiteshP/nvim-navic",
  --     "MunifTanjim/nui.nvim"
  --   }
  -- }

  -- vim-airline
  -- statusline
  use {
    'vim-airline/vim-airline',
    requires = { 'vim-airline/vim-airline-themes' },
    config = function()
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_theme = 'base16'
      vim.g.airline_skip_empty_sections = 1
    end
  }

  -- syntax highlighters
  use {
    'plasticboy/vim-markdown',
    ft = { 'markdown' },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end
  }
  -- TODO this consistently does not install. Not sure why
  use { 'hashivim/vim-terraform', ft = { 'terraform' } }
  use { 'ledger/vim-ledger', ft = { 'ledger' } }

  -- lazygit integration
  use 'kdheepak/lazygit.nvim'

  -- gitsigns
  -- shows changed git lines in the left column
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    tag = "v0.6",
    config = function() require('gitsigns').setup() end
  }

  -- gitlinker
  -- highlight some lines and get a github permalink
  -- default shortcut is <Leader>gy
  use {
    'ruifm/gitlinker.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require("gitlinker").setup() end
  }

  -- nnn integration (netrw replacement)
  use {
    "luukvbaal/nnn.nvim",
    config = function() require("nnn").setup() end
  }

  -- FTerm (floating terminal)
  use "numToStr/FTerm.nvim"

  -- which-key
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup {}
    end
  }

  -- hop-word
  use {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup({})
    end
  }

  -- misc
  use 'christoomey/vim-tmux-navigator' -- navigate btwn vim/tmux splits with same hotkeys
  use 'tpope/vim-commentary'           -- keybindings and language support for commenting
  use 'tpope/vim-surround'             -- keybindings for editing within "surrounds" (quotes etc)

  -- TODO add back occasional syntaxes with conditional loading:
  -- use 'amadeus/vim-mjml'
  -- use 'chr4/nginx.vim'
  -- use 'elixir-lang/vim-elixir'
  -- use 'jwalton512/vim-blade'
  -- use 'mxw/vim-jsx'
  -- use 'peterhoeg/vim-qml'
  -- use 'posva/vim-vue'

  -- experimental
  -- stuff I am not sure that I really want but looks vaguely interesting

  -- octo
  -- Github integration
  -- use {
  --   'pwntester/octo.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --   config = function()
  --     require "octo".setup()
  --   end
  -- }
  --
  -- use {
  --   'stevearc/aerial.nvim',
  --   config = function()
  --     require('aerial').setup({
  --       min_width = { 40, 0.2 },
  --       show_guides = true,
  --     })
  --   end
  -- }
end)
