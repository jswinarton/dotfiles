return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufWinEnter", "InsertEnter", "VeryLazy" },
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
      ensure_installed = {
        "bash",
        "c",
        "cpp",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "elixir",
        "erlang",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "hcl",
        "html",
        "http",
        "java",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "ledger",
        "liquid",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "php",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "scheme",
        "scss",
        "sql",
        "terraform",
        "tmux",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
    -- manual config method is necessary because lazy can't properly detect the module
    -- name that needs to be configured
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    keys = {
      {"<C-b>", "<cmd>Telescope buffers<CR>", desc = "Telescope: buffers"},
      {"<C-i>", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Telescope: document symbols"},
      {"<C-n>", "<cmd>Telescope live_grep_args<CR>", desc = "Telescope: workspace grep"},
      {"<C-p>", "<cmd>Telescope find_files find_command=rg,--files,--hidden<CR>", desc = "Telescope: find files"},
    }
  },

  {"folke/which-key.nvim", lazy = true },
}
