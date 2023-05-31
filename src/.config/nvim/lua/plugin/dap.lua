require("mason-nvim-dap").setup({
  ensure_installed = {
    'python',
  },
  handlers = {},
})

-- dap-python provides much better handling than the built-in config provided by
-- mason-nvim-dap
require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
require("dapui").setup()
