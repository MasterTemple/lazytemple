local map = function(keys, func, desc)
    vim.keymap.set("i", keys, func, { desc = desc, silent = true })
end

map("jk", "<Esc>", "Enter normal mode")
map("Jk", "<Esc>", "Enter normal mode")
-- map("kj", "<Esc>", "Enter normal mode")

map("<C-h>", "<Left>", "Move h")
map("<C-l>", "<Right>", "Move l")
map("<C-j>", "<Down>", "Move j")
map("<C-k>", "<Up>", "Move k")
map("<C-b>", "<C-o>b", "Move b")
map("<C-w>", "<C-o>w", "Move w")
map("<C-e>", "<C-o>e", "Move e")
