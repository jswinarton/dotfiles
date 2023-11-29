local dap_python = require("dap-python")

-- TODO without this, how to ensure that debugpy is installed?
-- require("mason-nvim-dap").setup({
--   ensure_installed = {
--     'python',
--   },
--   handlers = {},
-- })

-- dap-python provides much better handling than the built-in config provided by
-- mason-nvim-dap
dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
dap_python.test_runner = 'pytest'

require("dapui").setup({})
