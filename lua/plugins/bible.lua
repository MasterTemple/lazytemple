return {
    {
        "LetsChurch/usfm.vim",
        enabled = vim.g.personal,
    },
    -- {
    --     "MasterTemple/topos-bible",
    --     enabled = vim.g.personal,
    --     name = "topos-bible.nvim",
    --     dir = vim.g.personal and "/home/dgmastertemple/github/topos" or nil,
    --     -- dir = vim.g.personal and "/home/dgmastertemple/Development/nvim-plugins/topos-bible.nvim/" or nil,
    --     dev = vim.g.personal,
    --     main = "topos",
    --     build = "cargo build --release -p topos-lsp -p topos-bible-cli",
    --     dependencies = { "nvim-telescope/telescope.nvim" }, -- optional
    --     ft = { "markdown", "text" },
    --     cmd = {
    --         "ToposSearch",
    --         "ToposQuery",
    --         "ToposExplicitOverlap",
    --         "ToposAnyOverlap",
    --         "ToposExactOverlap",
    --         "ToposInside",
    --         "ToposExcludeOverlap",
    --         "ToposBuild",
    --         "ToposLspStart",
    --     },
    --     opts = {
    --         settings = {
    --             format = "name", -- Jn 3:16
    --             ["psg-fmt"] = { join_adjacent = true }, -- 3:16-18, not 3:16,17,18
    --             ["reference-diagnostics"] = "info", -- 'info' (default), 'hint', or 'never'
    --             ["inlay-hints"] = "never", -- 'changed' (default), 'always', 'osis', 'never'
    --             ext = "md,txt",
    --         },
    --     },
    -- },
    {
        -- "MasterTemple/topos-bible",
        enabled = vim.g.personal,
        -- "MasterTemple/topos-bible.nvim",
        main = "topos",
        dir = vim.g.personal and "/home/dgmastertemple/Development/nvim-plugins/topos-bible.nvim/" or nil,
        dev = vim.g.personal,
        -- Builds topos-lsp and topos with Cargo (needs Rust: https://rustup.rs)
        build = ":ToposBuild!",
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
            -- A folder of USX files, one book each (JHN.usx): hover shows the text, and go to
            -- definition opens the whole book
            -- bible = "~/Bibles/BSB",
            bible = "/home/dgmastertemple/Dropbox/Apps/remotely-save/MasterTemple/USX_1",
            markup = {
                verse_numbers = { show = true, display = "[{verse}]", color = nil },
                chapter_numbers = { show = true, display = "\n{name} {chapter}\n", color = nil },
                words_of_jesus = { show = false, color = nil },
                headings = { show = true, color = nil },
                notes = { show = false, color = nil },
                width = 80,
            },
            insertions = {
                {
                    name = "Callout",
                    display = "> [!bible] {reference}\n{text}",
                    line_prefix = "> ",
                    replace = "line",
                    markup = {
                        headings = { show = false },
                        verse_numbers = { display = "<sup>{verse}</sup>" },
                    },
                },
            },

            -- topos-lsp's settings: the CLI's config.toml keys, which these override
            settings = {
                format = "name", -- or 'abbreviation' for Jn 3:16
                ["psg-fmt"] = { join_adjacent = true }, -- 3:16-18, not 3:16,17,18
                ["reference-diagnostics"] = "hint", -- 'info' (default), 'hint', or 'never'
                ["inlay-hints"] = "never", -- 'changed' (default), 'always', 'osis', 'never'
                ext = "md,txt", -- what references and searches cover
            },
        },
    },
}
