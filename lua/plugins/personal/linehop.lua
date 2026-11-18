return {
    {
        -- Local-only (no remote), so it lives in plugins/personal
        dir = "~/Development/nvim-plugins/linehop.nvim",
        opts = {
            -- chars = "asdfghjklqwertyuiopzxcvbnm",
            -- display = "overlay", -- or "gutter"
            -- skip_empty = false,
            -- highlights = { label = { fg = "#ff007c", bold = true } },
        },
        cmd = { "LineHop", "LineHopAbove", "LineHopBelow" },
        keys = {
            {
                "<leader>j",
                function()
                    require("linehop").below()
                end,
                mode = { "n", "x" },
                desc = "Hop to line below",
            },
            {
                "<leader>k",
                function()
                    require("linehop").above()
                end,
                mode = { "n", "x" },
                desc = "Hop to line above",
            },
        },
    },
}
