require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Theme
  use {
    'chriskempson/base16-vim',
    config = function()
      vim.cmd.colorscheme("base16-default-dark")
    end
  }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function() require("plugin.treesitter") end
  }

  -- LSP standard configs
  -- These are out-of-the-box configurations provided by neovim
  -- for most language servers (the server itself must be installed separately)
  use {
    'neovim/nvim-lspconfig',
    config = function() require("plugin.lsp") end,
    after = {"mason-lspconfig.nvim", "mason.nvim"}
  }
  use {
      "williamboman/mason.nvim",
      run = ":MasonUpdate", -- :MasonUpdate updates registry contents
  }
  use "williamboman/mason-lspconfig.nvim"

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

  -- trouble (diagnostics)
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("trouble").setup({})
      require("plugin.trouble")
    end
  }

  use {
      "SmiteshP/nvim-navbuddy",
      requires = {
          "neovim/nvim-lspconfig",
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim"
      }
  }

  use {
    'stevearc/aerial.nvim',
    config = function() require('aerial').setup({
      min_width = {40, 0.2},
      show_guides = true,
    }) end
  }

  -- syntax highlighters
  use {
    'plasticboy/vim-markdown',
    ft = { 'markdown' },
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end
  }
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

  -- telescope
  -- fuzzy finder engine
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
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
      }
    end
  }

  -- nnn integration (netrw replacement)
  use {
    "luukvbaal/nnn.nvim",
    config = function() require("nnn").setup() end
  }

  -- copilot
  use "github/copilot.vim"

  -- misc
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
