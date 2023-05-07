require "options"
require "plugins"
require "autocommands"
require "keybindings"

if vim.fn.filereadable("project_config.lua") then
  require "project_config"
end
