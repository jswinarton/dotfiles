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
  -- includes utilities that are themselves managed by mason,
  -- i.e. lspconfig, null-ls and nvim-dap
  use {
    "williamboman/mason.nvim",
    run = ":MasonUpdate",
    requires = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',
      'nvimtools/none-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
      -- 'mfussenegger/nvim-dap',
      -- 'jay-babu/mason-nvim-dap.nvim',
      -- 'rcarriga/nvim-dap-ui',
      -- 'nvim-neotest/nvim-nio',
      -- 'mfussenegger/nvim-dap-python',
    },
    config = function()
      require("mason").setup({})
      require("plugin.lsp")
      -- require("plugin.dap")
    end,
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
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function() require("plugin.telescope") end
  }

  -- trouble (diagnostics)
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require("plugin.trouble") end
  }

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
  -- TODO temporarily disabled because the current version seems to be causing errors
  -- use {
  --   "luukvbaal/nnn.nvim",
  --   config = function()
  --     require("nnn").setup({
  --       command = "nnn -o -H",
  --       replace_netrw = 1,
  --     })
  --   end
  -- }

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

  use {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup({
        layout = {
          placement = "edge",
          default_direction = "left",
          max_width = { 40, 0.2 },
          min_width = { 40, 0.2 },
          preserve_equality = true,
        },
        filter_kind = false,
        attach_mode = "global",
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
    end,
  }

  -- misc
  use 'christoomey/vim-tmux-navigator' -- navigate btwn vim/tmux splits with same hotkeys
  use 'tpope/vim-commentary'           -- keybindings and language support for commenting
  use 'tpope/vim-surround'             -- keybindings for editing within "surrounds" (quotes etc)
end)
