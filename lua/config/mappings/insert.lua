local map = function(keys, func, desc)
  vim.keymap.set("i", keys, func, { desc = desc, silent = true })
end

map("jk", "<Esc>", "Enter normal mode")
map("Jk", "<Esc>", "Enter normal mode")
