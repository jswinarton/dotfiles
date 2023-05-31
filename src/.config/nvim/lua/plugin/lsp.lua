-- Reference:
-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  local default_opts = { noremap = true, silent = true, buffer = bufnr }
  local function extend_opts(opts)
    return vim.tbl_extend("force", default_opts, opts)
  end

  -- Many of these mappings shadow the default mappings in vim

  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, extend_opts({ desc = "Jump to definition" }))
  -- Note: many LSP servers do not implement "jump to declaration" and prefer
  -- using "jump to definition"
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, extend_opts({ desc = "Jump to declaration" }))
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, extend_opts({ desc = "Show info about symbol in hover" }))
  vim.keymap.set('n', 'gi', ":Telescope lsp_implementations<CR>", extend_opts({ desc = "Jump to implementation" }))
  vim.keymap.set('n', 'gr', ":Telescope lsp_references<CR>", default_opts)

  -- Extended leader mappings
  vim.keymap.set('n', '<Leader>lt', vim.lsp.buf.type_definition, extend_opts({ desc = "Jump to type definition" }))
  vim.keymap.set('n', '<Leader>lm', vim.lsp.buf.rename, extend_opts({ desc = "Rename symbol" }))
  vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, extend_opts({ desc = "Show code actions" }))
  vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format({ async = true }) end,
    extend_opts({ desc = "Format buffer" }))

  vim.keymap.set('n', '<Leader>lwa', vim.lsp.buf.add_workspace_folder, extend_opts({ desc = "Add workspace folder" }))
  vim.keymap.set('n', '<Leader>lwr', vim.lsp.buf.remove_workspace_folder,
    extend_opts({ desc = "Remove workspace folder" }))
  vim.keymap.set('n', '<Leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, extend_opts({ desc = "List workspace folders" }))

  -- Auto format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end

  -- TODO Temporarily disable this because it interferes with navigating through splits
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

local setup_handler_with_venv = function(source, handler)
  return function(_, _)
    local virtualenv = os.getenv("VIRTUAL_ENV")
    if virtualenv ~= nil then
      null_ls.register(source.with({
        command = virtualenv .. "/bin/" .. handler,
      }))
    else
      null_ls.register(source)
    end
  end
end


require('mason-lspconfig').setup({
  ensure_installed = {
    'eslint',
    'jedi_language_server',
    'lua_ls',
    'rust_analyzer',
    'tflint',
    'tsserver',
  }
})

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
    })
  end,
  ["lua_ls"] = function(server_name)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { 'vim' },
          },
        },
      },
    })
  end
})


require("mason-null-ls").setup({
  ensure_installed = {
    'black',
    'isort',
    'mypy',
    'pylint',
    'ruff',
    'stylelint',
  },
  automatic_installation = true,
  handlers = {
    black = setup_handler_with_venv(null_ls.builtins.formatting.black, "black"),
    isort = setup_handler_with_venv(null_ls.builtins.formatting.isort, "isort"),
    mypy = setup_handler_with_venv(null_ls.builtins.diagnostics.mypy, "mypy"),
    pylint = setup_handler_with_venv(null_ls.builtins.diagnostics.pylint, "pylint"),
  },
})

null_ls.setup({
  on_attach = on_attach,
})

-- Disable these plugins by default, since they are not used on all projects
-- They can be re-enabled on a per-project basis
null_ls.disable("mypy")
null_ls.disable("pylint")
null_ls.disable("ruff")
