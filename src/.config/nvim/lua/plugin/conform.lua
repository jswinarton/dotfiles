local conform = require("conform")

-- Prefer the venv-local binary when inside a Python virtualenv,
-- so the formatter uses the same version/config as the project.
local function venv_or_default(tool)
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    local path = venv .. "/bin/" .. tool
    if vim.fn.executable(path) == 1 then
      return path
    end
  end
  return tool
end

conform.setup({
  formatters_by_ft = {
    python = { "black", "isort" },
    css    = { "stylelint" },
    scss   = { "stylelint" },
  },
  formatters = {
    black  = { command = function() return venv_or_default("black") end },
    isort  = { command = function() return venv_or_default("isort") end },
  },
})

-- <Leader>lf: format buffer (was vim.lsp.buf.format in lsp.lua)
-- lsp_fallback = true means if no conform formatter is configured for the
-- filetype, it falls back to the LSP formatter (e.g. rust_analyzer).
vim.keymap.set("n", "<Leader>lf", function()
  conform.format({ async = true, lsp_fallback = true })
end, { noremap = true, silent = true, desc = "Format buffer" })
