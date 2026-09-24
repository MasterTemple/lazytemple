------------------------------
-- Automatically center cursor
------------------------------

vim.g.cursor_location_center = true
vim.g.cursor_location_top = false

-- auto-place cursor
vim.api.nvim_create_autocmd("CursorMoved", {
  callback = function()
    if vim.g.cursor_location_center == true then
      vim.cmd([[normal! zz]])
    end
    if vim.g.cursor_location_top == true then
      vim.cmd([[normal! zt]])
    end
  end,
})

-- toggle cursor location center
vim.keymap.set(
  { "n", "v" },
  "<leader>cc",
  "<cmd>lua vim.g.cursor_location_center = not vim.g.cursor_location_center<CR>",
  { desc = "Toggle Cursor Location: Center" }
)

-- toggle cursor location top
vim.keymap.set(
  { "n", "v" },
  "<leader>ct",
  "<cmd>lua vim.g.cursor_location_top = not vim.g.cursor_location_top<CR>",
  { desc = "Toggle Cursor Location: Top" }
)
