return {
    {
        enable = vim.g.personal,
        dir = vim.g.personal and "/home/dgmastertemple/Development/lua/align-workspace/align.nvim/" or nil,
        dev = vim.g.personal,
        lazy = false,
        keys = {
            { "<leader>a", "<cmd>Align<cr>", desc = "[A]lign Text", mode = { "n" } },
            { "<leader>a", "<cmd>'<,'>Align<cr>", desc = "[A]lign Text", mode = { "v" } },
        },
    },
}
