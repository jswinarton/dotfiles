-- Reference:
-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero

local navbuddy = require("nvim-navbuddy")
local null_ls = require("null-ls")

require("mason").setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
    'jedi_language_server',
    'lua_ls',
    'rust_analyzer',
    'tsserver',
  }
})
require("mason-null-ls").setup({
    ensure_installed = {
      'black',
      'pylint',
    },
    automatic_installation = true,
    handlers = {
      -- Disable import errors for pylint
      -- This is because pylint under mason runs in a different virtualenv than
      -- the one that is used for the project. This means all imports that are
      -- not part of the main package itself will fail
      -- Easier to just go without
      pylint = function(source_name, methods)
          null_ls.register(null_ls.builtins.diagnostics.pylint.with({
            extra_args = { "--disable", "import-error" },
          }))
      end,
    },
})
require("null-ls").setup({})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_attach = function(client, bufnr)
  navbuddy.attach(client, bufnr)
  -- TODO not sure this is necessary.
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Mappings that are meant to shadow existing Vim Mappings
  -- that do the same thing
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- TODO this is a test
  vim.keymap.set('n', 'gr', ":Telescope lsp_references<CR>", bufopts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  -- Extended leader mappings
  vim.keymap.set('n', '<Leader>lt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>lm', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format({ async = true }) end, bufopts)

  vim.keymap.set('n', '<Leader>lwa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>lwr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)

  -- Temporarily disable this because it interferes with navigating through splits
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

local lspconfig = require('lspconfig')
require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
})
