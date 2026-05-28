vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.expandtab = true          -- use spaces instead of tabs
vim.opt.ignorecase = true         -- searches are case insensitive by default
vim.opt.mouse = ""                -- disable mouse
vim.opt.number = true             --  show line numbers
vim.opt.relativenumber = true     -- show relative line numbers
vim.opt.scrolloff = 15            -- keep 15 lines above and below the cursor
vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
vim.opt.smartcase = true          -- case sensitive if capital letters are used in the search
vim.opt.softtabstop = 2
vim.opt.splitbelow = true         -- horizontal splits open below
vim.opt.splitright = true         -- vertical splits open to the right
vim.opt.swapfile = false          -- no swapfile
vim.opt.syntax = "off"            -- disable syntax highlighting so that treesitter can take over
vim.opt.wrap = false              -- no word wrap by default
vim.opt.exrc = true               -- source .nvim.lua from project directories

-- TODO figure out what the new syntax for this should be
-- vim.opt.lcs = "tab:▸,trail:·,eol:¬,nbsp:_"  -- "invisible" characters

local function is_diffview_tab(tabnr)
  for _, bufnr in ipairs(vim.fn.tabpagebuflist(tabnr)) do
    local ft = vim.fn.getbufvar(bufnr, "&filetype")
    local bn = vim.fn.bufname(bufnr)
    if ft == "DiffviewFiles" or bn:match("^diffview://") then
      return true
    end
  end
  return false
end

function _G.MyTabLine()
  local s = ""
  for i = 1, vim.fn.tabpagenr("$") do
    local label
    if is_diffview_tab(i) then
      label = "DiffView"
    else
      local bufnr = vim.fn.tabpagebuflist(i)[vim.fn.tabpagewinnr(i)]
      local bufname = vim.fn.bufname(bufnr)
      local filename = bufname ~= "" and vim.fn.fnamemodify(bufname, ":t") or "[No Name]"
      local modified = vim.fn.getbufvar(bufnr, "&modified") == 1 and " [+]" or ""
      label = filename .. modified
    end
    s = s .. (i == vim.fn.tabpagenr() and "%#TabLineSel#" or "%#TabLine#")
    s = s .. " " .. label .. " "
  end
  return s .. "%#TabLineFill#"
end

vim.opt.tabline = "%!v:lua.MyTabLine()"
