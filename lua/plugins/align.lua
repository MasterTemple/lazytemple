return {
    -- {
    --     enable = vim.g.personal,
    --     -- dir = vim.g.personal and "/home/dgmastertemple/Development/lua/align-workspace/align.nvim/" or nil,
    --     dir = vim.g.personal and "/home/dgmastertemple/Development/lua/align-workspace" or nil,
    --     dev = vim.g.personal,
    --     lazy = false,
    --     keys = {
    --         { "<leader>a", "<cmd>Align<cr>", desc = "[A]lign Text", mode = { "n" } },
    --         { "<leader>a", "<cmd>'<,'>Align<cr>", desc = "[A]lign Text", mode = { "x" } },
    --     },
    -- },
    {
        "MasterTemple/align",
        dir = vim.g.personal and "/home/dgmastertemple/Development/lua/align-workspace" or nil,
        dev = vim.g.personal,
        -- optional: dependencies = { "nvim-telescope/telescope.nvim" },
        keys = {
            { "<leader>a", ":Align<CR>", mode = { "n", "x" }, desc = "Align" },
        },
        opts = {
            bin = nil, -- path to the binary; nil = plugin build → $PATH → ~/.cargo/bin
            debounce_ms = 50, -- preview delay
            history_max = 100,
            border = "rounded",
            patterns = { -- saved patterns: :Align <name>, completion, Telescope
                { name = "arms", pattern = "if '=>'", filetypes = { "rust" } },
                { name = "sql", pattern = "join on = --" },
                { name = "eq", pattern = "=" }, -- filetypes omitted = everywhere; "" = no filetype
            },
        },
    },
}
