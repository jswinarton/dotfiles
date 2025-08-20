require "options"
require "plugins"
require "autocommands"
require "keybindings"

if vim.fn.filereadable("project_config.lua") == 1 then
  require "project_config"
end
