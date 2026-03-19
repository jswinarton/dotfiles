-- Reference:
-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

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
  -- <Leader>lf is handled by conform.nvim (see plugin/conform.lua)

  vim.keymap.set('n', '<Leader>lwa', vim.lsp.buf.add_workspace_folder, extend_opts({ desc = "Add workspace folder" }))
  vim.keymap.set('n', '<Leader>lwr', vim.lsp.buf.remove_workspace_folder,
    extend_opts({ desc = "Remove workspace folder" }))
  vim.keymap.set('n', '<Leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, extend_opts({ desc = "List workspace folders" }))

  -- TODO Temporarily disable this because it interferes with navigating through splits
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

require('mason-lspconfig').setup({
  ensure_installed = {
    'eslint',
    'jedi_language_server',
    'lua_ls',
    'rust_analyzer',
    'tflint',
  },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({
        on_attach = on_attach,
        capabilities = lsp_capabilities,
      })
    end,
  },
})
