return {
    {
        "MasterTemple/mkmv",
        dir = vim.g.personal and "/home/dgmastertemple/Development/lua/mkmv/" or nil,
        dev = vim.g.personal,
        -- version = "5a94c4b",
        lazy = false,
        opts = {
            rename_on_move = false,
            rename_include_extension = false,
            write_empty_file_on_create = true,
        },
        keys = {
            { "<leader>fn", ":CreateInFolder<CR>", desc = "[F]ile [N]ew" },
            { "<leader>fm", ":MoveToFolder<CR>", desc = "[F]ile [M]ove" },
        },
    },
}
