-- Useful plugin to show you pending keybinds.
return {
    {
        "folke/which-key.nvim",
        -- version = "3aab214",
        opts = {
            -- Delay between pressing a key and opening which-key (milliseconds)
            delay = 0,
            icons = { mappings = vim.g.have_nerd_font },
            -- Document existing key chains
            spec = {
                -- pathkit.nvim
                { "<leader>y", group = "[Y]ank" },
                { "<leader>ya", group = "[Y]ank [A]ctive" },
                { "<leader>ys", group = "[Y]ank [S]elect" },

                { "<leader>yaf", group = "[Y]ank [A]ctive [F]ile" },
                { "<leader>ysf", group = "[Y]ank [S]elect [F]ile" },

                { "<leader>yad", group = "[Y]ank [A]ctive [D]irectory" },
                { "<leader>ysd", group = "[Y]ank [S]elect [D]irectory" },

                { "<leader>yafa", group = "[Y]ank [A]ctive [F]ile [A]bsolute" },
                { "<leader>ysfa", group = "[Y]ank [S]elect [F]ile [A]bsolute" },
                { "<leader>yafr", group = "[Y]ank [A]ctive [F]ile [R]elative" },
                { "<leader>ysfr", group = "[Y]ank [S]elect [F]ile [R]elative" },

                { "<leader>yada", group = "[Y]ank [A]ctive [D]irectory [A]bsolute" },
                { "<leader>ysda", group = "[Y]ank [S]elect [D]irectory [A]bsolute" },
                { "<leader>yadr", group = "[Y]ank [A]ctive [D]irectory [R]elative" },
                { "<leader>ysdr", group = "[Y]ank [S]elect [D]irectory [R]elative" },
                -- pathkit.nvim

                { "<leader>cd", group = "[C]hange [D]irectory" },

                { "<leader>s", group = "[S]earch", mode = { "n", "v" } },
                { "<leader>sd", group = "[S]earch [D]iagnostics", mode = { "n", "v" } },
                { "<leader>t", group = "[T]oggle" },
                { "<leader>l", group = "[L]SP" },
                -- NOTE: Some of these are also [F]ile
                -- { "<leader>f", group = "[F]ind" },
                { "<leader>ls", group = "[L]SP [S]ymbols" },
                { "<leader>ld", group = "[L]SP [D]efinition" },
                { "<leader>q", group = "[Q]uickFix" },
                { "<leader>qa", group = "[Q]uickFix [A]dd" },
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
