vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.expandtab = true          -- use spaces instead of tabs
vim.opt.ignorecase = true         -- searches are case insensitive by default
vim.opt.mouse = ""                -- disable mouse
vim.opt.number = true             -- show line numbers
vim.opt.relativenumber = true     -- show relative line numbers
vim.opt.smartcase = true          -- case sensitive if capital letters are used in the search
vim.opt.splitbelow = true         -- horizontal splits open below
vim.opt.splitright = true         -- vertical splits open to the right
vim.opt.swapfile = false          -- no swapfile
vim.opt.syntax = "off"            -- disable regex-based syntax highlighting (i.e. use treesitter only)
vim.opt.wrap = false              -- no word wrap by default

-- Test configs to maybe re-enable
-- vim.opt.scrolloff = 15            -- keep 15 lines above and below the cursor
-- vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
-- vim.opt.softtabstop = 2
