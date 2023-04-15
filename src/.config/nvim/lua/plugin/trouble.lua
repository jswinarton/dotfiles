require("trouble").setup({})

-- Use the same icons for the gutter as trouble uses in quickfix
-- See https://github.com/folke/trouble.nvim/issues/52
local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info= " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
