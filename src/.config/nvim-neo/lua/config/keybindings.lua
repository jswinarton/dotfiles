local default_opts = { noremap = true, silent = true }

local function extend_opts(opts)
  return vim.tbl_extend("force", default_opts, opts)
end

-- Command key without shift
vim.keymap.set("n", ";", ":", { noremap = true, desc = "Command key shortcut" })

-- Disable arrow keys (and mouse scroll wheel)
vim.keymap.set("", "<up>", "<nop>", { noremap = true })
vim.keymap.set("", "<down>", "<nop>", { noremap = true })
vim.keymap.set("i", "<up>", "<nop>", { noremap = true })
vim.keymap.set("i", "<down>", "<nop>", { noremap = true })

-- Move through word wrap easily
vim.keymap.set("n", "j", "gj", default_opts)
vim.keymap.set("n", "k", "gk", default_opts)
