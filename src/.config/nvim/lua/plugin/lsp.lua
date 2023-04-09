-- Reference:
-- https://github.com/neovim/nvim-lspconfig/README.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero

require("mason").setup({
  PATH = "append"
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'pylsp',
    'rust_analyzer',
    'tsserver',
  }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_attach = function(client, bufnr)
  -- TODO not sure this is necessary.
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- Mappings that are meant to shadow existing Vim Mappings
  -- that do the same thing
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

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
  ['pylsp'] = function()
    lspconfig.pylsp.setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
      settings = {
        pylsp = {
          plugins = {
            autopep8 = { enabled = false },
            jedi_completion = {
              fuzzy = true,
              include_class_objects = true,
              include_function_objects = true,
            },
            pycodestyle = { enabled = false },
            pyflakes = { enabled = false },
            pylint = { enabled = true },
          }
        }
      }
    })
  end,
})
