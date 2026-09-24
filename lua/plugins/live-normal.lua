return {
    {
        "smjonas/live-command.nvim",
        main = "live-command",
        opts = {
            commands = {
                Norm = { cmd = "norm" },
            },
        },
        init = function()
            vim.cmd("cnoreabbrev norm Norm")
        end,
        lazy = false,
    },
}
