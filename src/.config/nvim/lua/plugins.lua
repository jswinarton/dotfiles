-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to continue..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- Theme
  {
    "shaunsingh/moonlight.nvim",
    lazy = false,
    priority = 1000,
    config = function() require("plugin.moonlight") end,
  },

  -- Treesitter
  -- Pinned to master branch: the new default branch requires Neovim 0.12 nightly.
  -- Switch to the default branch when upgrading to 0.12+.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    config = function() require("plugin.treesitter") end,
  },

  -- Mason + LSP
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',
      'nvimtools/none-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
    config = function()
      require("mason").setup({})
      require("plugin.lsp")
    end,
  },

  -- nvim-cmp (completion engine)
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
      },
      'saadparwaiz1/cmp_luasnip',
    },
    config = function() require("plugin.cmp") end,
  },

  -- Telescope (fuzzy finder)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function() require("plugin.telescope") end,
  },

  -- Trouble (diagnostics panel)
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() require("plugin.trouble") end,
  },

  -- Lualine (statusline)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function() require("plugin.lualine") end,
  },

  -- Lazygit integration
  { 'kdheepak/lazygit.nvim' },

  -- Gitsigns (git decorations in gutter)
  {
    'lewis6991/gitsigns.nvim',
    config = function() require('gitsigns').setup() end,
  },

  -- Gitlinker (generate GitHub permalinks, default shortcut: <Leader>gy)
  {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = function() require("gitlinker").setup() end,
  },

  -- Which-key (keybinding hints)
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup {}
    end,
  },

  -- Hop (fast word jumping)
  {
    'smoka7/hop.nvim',
    config = function()
      require('hop').setup({})
    end,
  },

  -- Aerial (symbol navigation panel)
  {
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
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
    end,
  },

  -- DAP (debugger)
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',  -- required by nvim-dap-ui
    },
    config = function() require("plugin.dap") end,
  },

  -- Misc
  'christoomey/vim-tmux-navigator',
  'tpope/vim-commentary',
  'tpope/vim-surround',
})
