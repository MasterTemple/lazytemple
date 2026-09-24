if not vim.g.neovide then
    return
end

vim.g.neovide_fullscreen = false
vim.g.neovide_remember_window_size = true
vim.g.neovide_disable_all_animations = 1
vim.g.neovide_cursor_smooth_blink = true
vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_short_animation_length = 0.0
vim.g.neovide_cursor_trail_size = 0.0
vim.g.neovide_scroll_animation_length = 0.0

-- Allow for font resizing in Neovide application
vim.keymap.set({ "n", "v" }, "<C-+>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
end, { silent = true })

vim.keymap.set({ "n", "v" }, "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
end, { silent = true })

vim.keymap.set({ "n", "v" }, "<C-0>", function()
    vim.g.neovide_scale_factor = 1
end, { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>tf", function()
    vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
end, { silent = true, desc = "[T]oggle [F]ullscreen" })
