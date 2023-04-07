-- Commands

vim.cmd([[
function! TrimEndLines()
    let save_cursor = getpos(".")
    :silent! %s#\($\n\s*\)\+\%$##
    call setpos('.', save_cursor)
endfunction
autocmd BufWritePre * call TrimEndLines()

function! TrimTrailingWhitespace()
    :%s/\s\+$//e
endfunction
autocmd BufWritePre * call TrimTrailingWhitespace()
]])


-- Language-specific settings

vim.cmd([[
autocmd Filetype ansible setlocal syntax=yaml
autocmd Filetype elixir setlocal colorcolumn=80
autocmd Filetype go setlocal noexpandtab ts=8 sw=0 sts=0
autocmd Filetype markdown setlocal linebreak conceallevel=0
autocmd Filetype php setlocal ts=2 sw=2 sts=2 colorcolumn=90
autocmd Filetype python setlocal ts=4 sw=4 sts=4 colorcolumn=88
autocmd Filetype ruby setlocal colorcolumn=90
]])
