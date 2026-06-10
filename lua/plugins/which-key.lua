-- Useful plugin to show you pending keybinds.
return {
  {
    "https://github.com/folke/which-key.nvim",
    version = "3aab214",
    opts = {
      -- Delay between pressing a key and opening which-key (milliseconds)
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },
      -- Document existing key chains
      spec = {
        { "<leader>cd", group = "[C]hange [D]irectory", mode = { "n" } },
        { "<leader>cp", group = "[C]hange [P]ath", mode = { "n" } },
        { "<leader>s", group = "[S]earch", mode = { "n", "v" } },
        { "<leader>t", group = "[T]oggle" },
        { "<leader>l", group = "[L]SP" },
        { "<leader>ls", group = "[L]SP [S]ymbols" },
        { "<leader>ld", group = "[L]SP [D]efinition" },
        { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } }, -- Enable gitsigns recommended keymaps first
        { "gr", group = "LSP Actions", mode = { "n" } },
      },
    },
  },
}

-- require("which-key").setup({
-- 	-- Delay between pressing a key and opening which-key (milliseconds)
-- 	delay = 0,
-- 	icons = { mappings = vim.g.have_nerd_font },
-- 	-- Document existing key chains
-- 	spec = {
-- 		{ "<leader>cd", group = "[C]hange [D]irectory", mode = { "n" } },
-- 		{ "<leader>cp", group = "[C]hange [P]ath", mode = { "n" } },
-- 		{ "<leader>s", group = "[S]earch", mode = { "n", "v" } },
-- 		{ "<leader>t", group = "[T]oggle" },
-- 		{ "<leader>l", group = "[L]SP" },
-- 		{ "<leader>ls", group = "[L]SP [S]ymbols" },
-- 		{ "<leader>ld", group = "[L]SP [D]efinition" },
-- 		{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } }, -- Enable gitsigns recommended keymaps first
-- 		{ "gr", group = "LSP Actions", mode = { "n" } },
-- 	},
-- })
