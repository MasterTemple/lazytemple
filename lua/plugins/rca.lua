return {
    {
        "MasterTemple/rca.nvim",
        dir = vim.g.personal and "/home/dgmastertemple/Dropbox/Development/lua/rca.nvim" or nil,
        dev = vim.g.personal,
        -- commit = "91ff5ed",
        lazy = false,
        keys = {
            { "<leader>lai", "<cmd>RcaLocErrors Import<cr>", desc = "[L]SP [A]uto [I]mport (file only)" },
        },
    },
}
