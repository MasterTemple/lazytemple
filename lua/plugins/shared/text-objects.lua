-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
        -- version = "7b9923a",
    },
    {
        "dhruvasagar/vim-table-mode",
        -- version = "bb02530",
        keys = {
            { "<leader>ta", "<cmd>TableModeRealign<CR>", desc = "[T]able Mode [A]lign" },
        },
    },
}
