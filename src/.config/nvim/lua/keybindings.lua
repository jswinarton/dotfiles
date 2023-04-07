-- Good keys for using in keybinding:
-- CTRL+I, CTRL+M, CTRL+N, CTRL+P, CTRL+_
-- Space, Backspace, Enter, +, \
-- Function keys starting from <F2> and shifted function keys <S-F2> etc.
-- Alt-key combinations
--
-- See :help map-which-keys for general strategies on keybinding
-- See :help index for a full list of keys that are used
-- Unbound keys marked as "not used", aliases marked as "same as"

local default_opts = { noremap = true, silent = true }
local telescope = require("telescope.builtin")

-- BASICS
---------

-- Command key without shift
vim.keymap.set("n", ";", ":", default_opts)

-- Move through word wrap easily
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "k", "gk", default_opts)

-- netrw replacement
vim.keymap.set('n', '-', ":NnnPicker %:p:h<CR>", default_opts)
vim.keymap.set('n', '_', ":NnnPicker<CR>", default_opts)


-- FUNCTION KEYS
----------------

-- TODO reserve <F10> for SmiteshP/nvim-navbuddy
vim.keymap.set("n", "<F11>", ":LazyGit<CR>", default_opts)
-- TODO reserve <F12> for pwntester/octo.nvim


-- CONTROL KEYS
---------------

vim.keymap.set('n', '<C-n>', telescope.live_grep, default_opts)
vim.keymap.set('n', '<C-p>', ":Telescope find_files find_command=rg,--files,--hidden<CR>", default_opts)


-- LEADER KEYMAPS
-----------------

vim.keymap.set("n", "<Leader>a", ":set wrap!<CR>", default_opts)
vim.keymap.set("n", "<Leader>i", ":set list!<CR>", default_opts)
vim.keymap.set("n", "<Leader>p", ":set paste!<CR>", default_opts)
-- TODO reserve <Leader>r for config reload + packer compile
vim.keymap.set("n", "<Leader>s", ":split<CR>", default_opts)
vim.keymap.set("n", "<Leader>v", ":vsplit<CR>", default_opts)
vim.keymap.set("n", "<Leader><Space>", ":nohlsearch<CR>", default_opts)

-- Git
-- Note that Git linker uses <Leader>gy
vim.keymap.set("n", "<Leader>gb", telescope.git_branches, default_opts)
vim.keymap.set("n", "<Leader>gg", ":LazyGit<CR>", default_opts)
vim.keymap.set("n", "<Leader>gs", telescope.git_status, default_opts)

-- Tabs
vim.keymap.set("n", "<Leader>th", ":tabprev<CR>", default_opts)
vim.keymap.set("n", "<Leader>tl", ":tabnext<CR>", default_opts)
vim.keymap.set("n", "<Leader>tn", ":tabnew<CR>", default_opts)
vim.keymap.set("n", "<Leader>tx", ":tabclose<CR>", default_opts)

-- Numbering settings
vim.keymap.set("n", "<Leader>nn", ":set number | set norelativenumber<CR>", default_opts)
vim.keymap.set("n", "<Leader>no", ":set nonumber | set norelativenumber<CR>", default_opts)
vim.keymap.set("n", "<Leader>nr", ":set number | set relativenumber<CR>", default_opts)
