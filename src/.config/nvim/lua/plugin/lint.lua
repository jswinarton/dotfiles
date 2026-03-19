local lint = require("lint")

-- Python linters are opt-in per project — too noisy and project-specific
-- to run everywhere. Enable in project_config.lua like:
--   require("lint").linters_by_ft.python = { "ruff", "pylint", "mypy" }
lint.linters_by_ft = {
  css  = { "stylelint" },
  scss = { "stylelint" },
}

-- Resolve venv-local binary paths so linters use the project's
-- installed versions (matches the conform.lua approach for formatters).
local function resolve_venv(tool)
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    local path = venv .. "/bin/" .. tool
    if vim.fn.executable(path) == 1 then
      return path
    end
  end
  return tool
end

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    for _, tool in ipairs({ "pylint", "mypy", "ruff" }) do
      if lint.linters[tool] then
        lint.linters[tool].cmd = resolve_venv(tool)
      end
    end
    lint.try_lint()
  end,
})
