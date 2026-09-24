local map = function(keys, func, desc)
    vim.keymap.set("v", keys, func, { desc = desc, silent = true })
end

-- Search visual selection
local function search_selection(backward)
    local start = vim.fn.getpos("v")
    local finish = vim.fn.getpos(".")

    local text = table.concat(vim.fn.getregion(start, finish, { type = vim.fn.mode() }), "\n")

    -- Literal Vim regex: escape backslashes and search delimiters.
    text = [[\V]] .. vim.fn.escape(text, [[\/]])

    vim.fn.setreg("/", text)

    -- Explicitly leave Visual mode.
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

    -- Now search from Normal mode.
    vim.cmd(backward and "normal! N" or "normal! n")
end

map("*", function()
    search_selection(false)
end, "Search for selection (forward)")
map("#", function()
    search_selection(true)
end, "Search for selection (backward)")
-- For learning's sake:
-- map("*", 'y/\\V<C-r>"<CR>', "Search for selection (forward)")
-- map("#", 'y?\\V<C-r>"<CR>', "Search for selection (backward)")

-- Move visual selection
map("<M-k>", ":'<m -2 | norm '>V'<<CR>", "Move up")
map("<M-j>", ":'>m '>+1 | norm '<V'><CR>", "Move down")
