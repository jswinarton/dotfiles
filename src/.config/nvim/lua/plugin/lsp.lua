-- Reference:
-- https://github.com/neovim/nvim-lspconfig/blob/master/README.md
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/lsp.md#you-might-not-need-lsp-zero

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')
local navbuddy = require("nvim-navbuddy")
local null_ls = require("null-ls")

local lsp_attach = function(client, bufnr)
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

  -- TODO I'm experimenting for preferring Telescope over the default quickfix behaviour
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, default_opts)
  -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, default_opts)

  -- Extended leader mappings
  vim.keymap.set('n', '<Leader>lt', vim.lsp.buf.type_definition, extend_opts({ desc = "Jump to type definition" }))
  vim.keymap.set('n', '<Leader>lm', vim.lsp.buf.rename, extend_opts({ desc = "Rename symbol" }))
  vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, extend_opts({ desc = "Show code actions" }))
  vim.keymap.set('n', '<Leader>lf', function() vim.lsp.buf.format({ async = true }) end, extend_opts({ desc = "Format buffer" }))

  vim.keymap.set('n', '<Leader>lwa', vim.lsp.buf.add_workspace_folder, extend_opts({ desc = "Add workspace folder" }))
  vim.keymap.set('n', '<Leader>lwr', vim.lsp.buf.remove_workspace_folder, extend_opts({ desc = "Remove workspace folder" }))
  vim.keymap.set('n', '<Leader>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, extend_opts({ desc = "List workspace folders" }))

  -- TODO not sure this is necessary.
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Temporarily disable this because it interferes with navigating through splits
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  navbuddy.attach(client, bufnr)
end


require("mason").setup({})

require("mason-null-ls").setup({
    ensure_installed = {
      'black',
      'mypy',
      'pylint',
    },
    automatic_installation = true,
    handlers = {
      -- Disable import errors for pylint
      -- This is because pylint under mason runs in a different virtualenv than
      -- the one that is used for the project. This means all imports that are
      -- not part of the main package itself will fail
      -- Easier to just go without
      pylint = function(_, _)
          null_ls.register(null_ls.builtins.diagnostics.pylint.with({
            extra_args = { "--disable", "import-error" },
          }))
      end,
      mypy = function(_, _)
          local virtualenv = os.getenv("VIRTUAL_ENV")
          if virtualenv ~= nil then
            null_ls.register(null_ls.builtins.diagnostics.mypy.with({
              extra_args = { "--python-executable", virtualenv .. "/bin/python" },
            }))
          else
            null_ls.register(null_ls.builtins.diagnostics.mypy)
          end
      end,
    },
})

require("null-ls").setup({})

require('mason-lspconfig').setup({
  ensure_installed = {
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
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
    })
  end,
  ["lua_ls"] = function (server_name)
    lspconfig[server_name].setup({
      on_attach = lsp_attach,
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
          },
        },
      },
    })
  end
})
