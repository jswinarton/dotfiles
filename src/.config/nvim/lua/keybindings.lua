-- Good keys for using in keybinding:
-- CTRL+I, CTRL+M, CTRL+N, CTRL+P, CTRL+_
-- Space, Backspace, Enter, +, \
-- Function keys starting from <F2> and shifted function keys <S-F2> etc.
-- Alt-key combinations
--
-- See :help map-which-keys for general strategies on keybinding
-- See :help index for a full list of keys that are used
-- Unbound keys marked as "not used", aliases marked as "same as"

local telescope = require("telescope.builtin")
local default_opts = { noremap = true, silent = true }

local function extend_opts(opts)
  return vim.tbl_extend("force", default_opts, opts)
end


-- BASICS
---------

-- Command key without shift
vim.keymap.set("n", ";", ":", { noremap = true, desc = "Command key shortcut" })

-- Move through word wrap easily
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "k", "gk", default_opts)

-- netrw replacement
vim.keymap.set('n', '-', ":NnnPicker %:p:h<CR>", extend_opts({ desc = "Open nnn in file dir" }))
vim.keymap.set('n', '_', ":NnnPicker<CR>", extend_opts({ desc = "Open nnn in workspace root" }))

-- hop-word
vim.keymap.set('n', '<Space>', ":HopWord<CR>", extend_opts({ desc = "Open HopWord" }))


-- FUNCTION KEYS
----------------

-- TODO reserve <F10> for SmiteshP/nvim-navbuddy
vim.keymap.set("n", "<F11>", ":LazyGit<CR>", extend_opts({ desc = "Open lazygit" }))
-- TODO reserve <F12> for pwntester/octo.nvim


-- CONTROL KEYS
---------------

vim.keymap.set('n', '<C-b>', ":Telescope buffers<CR>", extend_opts({ desc = "Telescope: buffers" }))
vim.keymap.set('n', '<C-i>', ":Telescope lsp_document_symbols<CR>", extend_opts({ desc = "Telescope: document symbols" }))
-- TODO temporarily disabled because for TS/JS projects, the language server
-- attempts to index every symbol in node_modules which crashes vim
-- vim.keymap.set('n', '<C-M-i>', ":Telescope lsp_dynamic_workspace_symbols<CR>", default_opts)
vim.keymap.set('n', '<C-n>', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", extend_opts({ desc = "Telescope: workspace grep" }))
vim.keymap.set('n', '<C-p>', ":Telescope find_files find_command=rg,--files,--hidden<CR>", extend_opts({ desc = "Telescope: find files" }))


-- LEADER KEYMAPS
-----------------

-- Note that <Leader>l is used by LSP mappings (see plugin/lsp.lua)

vim.keymap.set("n", "<Leader>a", ":set wrap!<CR>", extend_opts({ desc = "Toggle line wrap" }))
vim.keymap.set('n', "<Leader>dd", vim.diagnostic.open_float, extend_opts({ desc = "Show floating diagnostic info" }))
vim.keymap.set("n", "<Leader>da", ":TroubleToggle<CR>", extend_opts({ desc = "Toggle trouble" }))
vim.keymap.set("n", "<Leader>i", ":set list!<CR>", extend_opts({ desc = "Toggle invisible characters" }))
vim.keymap.set("n", "<Leader>n", ":Navbuddy<CR>", extend_opts({ desc = "Toggle 'breadcrumbs' navigation" }))
vim.keymap.set("n", "<Leader>o", ":AerialToggle!<CR>", extend_opts({ desc = "Toggle aerial" }))
vim.keymap.set("n", "<Leader>p", ":set paste!<CR>", extend_opts({ desc = "Toggle paste mode" }))
vim.keymap.set("n", "<Leader>s", ":split<CR>", extend_opts({ desc = "Horizontal split" }))
vim.keymap.set("n", "<Leader>t", ":lua require('FTerm').toggle()<CR>", extend_opts({ desc = "Toggle floating terminal" }))
vim.keymap.set("n", "<Leader>v", ":vsplit<CR>", extend_opts({ desc = "Vertical split" }))
vim.keymap.set("n", "<Leader><Space>", ":nohlsearch<CR>", extend_opts({ desc = "Clear search" }))

-- Git
-- Note that Git linker uses <Leader>gy
vim.keymap.set("n", "<Leader>gb", telescope.git_branches, extend_opts({ desc = "Git branches" }))
vim.keymap.set("n", "<Leader>gg", ":LazyGit<CR>", extend_opts({ desc = "Open lazygit" }))
vim.keymap.set("n", "<Leader>gs", telescope.git_status, extend_opts({ desc = "Git status" }))

-- Tabs
-- TODO temporarily disable
-- vim.keymap.set("n", "<Leader>th", ":tabprev<CR>", default_opts)
-- vim.keymap.set("n", "<Leader>tl", ":tabnext<CR>", default_opts)
-- vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>", default_opts)
-- vim.keymap.set("n", "<Leader>tx", ":tabclose<CR>", default_opts)

-- Numbering settings
-- TODO temporarily disable
-- maybe find a different key for these, if you need them at all
-- vim.keymap.set("n", "<Leader>nn", ":set number | set norelativenumber<CR>", default_opts)
-- vim.keymap.set("n", "<Leader>no", ":set nonumber | set norelativenumber<CR>", default_opts)
-- vim.keymap.set("n", "<Leader>nr", ":set number | set relativenumber<CR>", default_opts)

-- Copilot
vim.keymap.set("n", "<Leader>cp", ":Copilot panel<CR>", default_opts)
