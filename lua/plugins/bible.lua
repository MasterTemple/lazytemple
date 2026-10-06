return {
    -- https://lazy.folke.io/spec
    {
        "MasterTemple/topos-bible",
        enabled = vim.g.personal,
        name = "topos-bible.nvim",
        dir = vim.g.personal and "/home/dgmastertemple/github/topos" or nil,
        dev = vim.g.personal,
        main = "topos",
        build = "cargo build --release -p topos-lsp -p topos-bible-cli",
        dependencies = { "nvim-telescope/telescope.nvim" }, -- optional
        ft = { "markdown", "text" },
        cmd = {
            "ToposSearch",
            "ToposQuery",
            "ToposExplicitOverlap",
            "ToposAnyOverlap",
            "ToposExactOverlap",
            "ToposInside",
            "ToposExcludeOverlap",
            "ToposBuild",
            "ToposLspStart",
        },
        opts = {
            settings = {
                format = "name", -- Jn 3:16
                ["psg-fmt"] = { join_adjacent = true }, -- 3:16-18, not 3:16,17,18
                ["reference-diagnostics"] = "info", -- 'info' (default), 'hint', or 'never'
                ["inlay-hints"] = "never", -- 'changed' (default), 'always', 'osis', 'never'
                ext = "md,txt",
            },
        },
    },
}
