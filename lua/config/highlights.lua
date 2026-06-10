vim.api.nvim_set_hl(0, "Visual", { reverse = true })

-- -- [[ Colorscheme ]]
-- -- You can easily change to a different colorscheme.
-- -- Change the name of the colorscheme plugin below, and then
-- -- change the command under that to load whatever the name of that colorscheme is.
-- --
-- -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
-- vim.pack.add({ {
--   "https://github.com/folke/tokyonight.nvim",
--   version = "cdc07ac",
-- } })
-- ---@diagnostic disable-next-line: missing-fields
-- require("tokyonight").setup({
--   styles = {
--     comments = { italic = false }, -- Disable italics in comments
--   },
-- })
--
-- vim.cmd.colorscheme("tokyonight-night")
