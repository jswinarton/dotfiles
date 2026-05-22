require("telescope").setup({
  pickers = {
    find_files = {
      search_dirs = { "browser", "toolkit" },
    },
    live_grep = {
      search_dirs = { "browser", "toolkit" },
    },
    grep_string = {
      search_dirs = { "browser", "toolkit" },
    },
  },
})
