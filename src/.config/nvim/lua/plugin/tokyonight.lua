local function apply_theme()
  if vim.o.background == "dark" then
    vim.cmd.colorscheme("tokyonight-storm")
  else
    vim.cmd.colorscheme("tokyonight-day")
  end
end

apply_theme()
