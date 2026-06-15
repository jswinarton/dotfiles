local telescope = require("telescope")
local actions = require("telescope.actions")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
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
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
    },
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        }
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    live_grep_args = {
      auto_quoting = false,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        }
      }
    }
  }
}

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
