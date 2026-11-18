return {
    {
        "LetsChurch/usfm.vim",
    },
    {
        -- "Logoxide/logoxide.nvim",
        main = "logoxide",
        dir = "/home/dgmastertemple/Dropbox/Development/nvim-plugins/logoxide.nvim",
        -- dev = true,
        -- Builds logoxide-lsp, lx, and topos with Cargo (needs Rust: https://rustup.rs)
        build = ":LxBuild!",
        dependencies = { "nvim-telescope/telescope.nvim" }, -- optional
        -- epub: epub.nvim's rendered EPUB chapters, and xhtml their source, so references in
        -- books get hover, hints, and :LxFileReferences
        ft = { "markdown", "text", "typst", "epub", "xhtml" },
        cmd = {
            "LxSearch",
            "LxQuery",
            "LxExplicitOverlap",
            "LxAnyOverlap",
            "LxExactOverlap",
            "LxInside",
            "LxExcludeOverlap",
            "LxBuild",
            "LxLspStart",
            "LxRead",
            "LxNextBook",
            "LxNextChapter",
            "LxNextVerse",
            "LxNextHeading",
            "LxPrevBook",
            "LxPrevChapter",
            "LxPrevVerse",
            "LxPrevHeading",
            "LxDirReferences",
            "LxFileReferences",
            "LxReadAt",
            "LxSwitch",
            "LxGrep",
        },
        keys = {
            { "[b", "<cmd>LxPrevBook<cr>" },
            { "[c", "<cmd>LxPrevChapter<cr>" },
            { "[v", "<cmd>LxPrevVerse<cr>" },
            { "[h", "<cmd>LxPrevHeading<cr>" },
            { "]b", "<cmd>LxNextBook<cr>" },
            { "]c", "<cmd>LxNextChapter<cr>" },
            { "]v", "<cmd>LxNextVerse<cr>" },
            { "]h", "<cmd>LxNextHeading<cr>" },
            -- { "<leader>sb", "<cmd>LxRead<cr>", desc = "[S]earch [B]ible" },
            -- { "<leader>lxb", "<cmd>LxRead<cr>", desc = "[L]ogo[X]ide [B]ible" },
            { "<leader>lxsd", "<cmd>LxDirReferences<cr>", desc = "[L]ogo[X]ide [S]earch [D]irectory" },
            { "<leader>lxsf", "<cmd>LxFileReferences<cr>", desc = "[L]ogo[X]ide [S]earch [F]ile" },
            { "<leader>lxst", "<cmd>LxSwitch<cr>", desc = "[L]ogo[X]ide [S]earch [T]ranslation" },
            { "<leader>lxsb", "<cmd>LxGrep<cr>", desc = "[L]ogo[X]ide [S]earch [B]ible" },
            { "<leader>lxrb", "<cmd>LxRead<cr>", desc = "[L]ogo[X]ide [R]ead [B]ook" },
            { "<leader>lxrv", "<cmd>LxReadAt<cr>", desc = "[L]ogo[X]ide [R]ead [V]erse" },
        },
        opts = {
            -- :LxBuild builds from these checkouts instead of GitHub
            source = {
                topos = "~/Development/rust/topos",
                logoxide = "~/Development/rust/logoxide",
            },
            -- A folder of USX files, one book each (JHN.usx): hover shows the text, and go to
            -- definition opens the whole book
            bibles = {
                -- NOTE: The default settings are applied if I have no Bibles
                ESV = "/home/dgmastertemple/Documents/local-usx/ESV/",
                LSB = "/home/dgmastertemple/Documents/local-usx/LSB/",
                NKJV = "/home/dgmastertemple/Documents/local-usx/NKJV/",
                BSB = "/home/dgmastertemple/Documents/local-usx/BSB/",
                AMP = "/home/dgmastertemple/Documents/local-usx/AMP/",
                NASB1995 = "/home/dgmastertemple/Documents/local-usx/NASB1995/",
            },
            default_bible = "ESV",
            markup = {
                indent = { q1 = 0, q2 = 2, q3 = 4, q4 = 6 },
                verse_numbers = { show = true, display = "[{verse}]", color = nil },
                chapter_numbers = { show = true, display = "\n{name} {chapter}", color = nil },
                words_of_jesus = { show = false, color = nil },
                headings = { show = true, color = nil, display = "\n{text}" },
                notes = { show = false, color = nil },
                width = 80,
            },
            templates = {
                callout = {
                    display = "> [!bible] {reference} {bible}\n{text}",
                    line_prefix = "> ",
                    action = "replace-line", -- was replace = "line"
                    markup = {
                        headings = { show = false },
                        verse_numbers = { display = "<sup>{verse}</sup>" },
                    },
                },
                -- the inline hint: the first verse, without its heading
                diagnostic = {
                    display = "{first:1}",
                    markup = { headings = { show = false } },
                },
            },

            -- TODO: These overlap with lazy.nvim
            lsp = {
                filetypes = { "markdown", "text", "typst" },
                search_folders = { "~/Obsidian" }
            },

            hover = {
                line = true,
                trim = true,
                max = false,
                book = {
                    "current",
                    "references",
                    "translations",
                }
            },

            -- logoxide-lsp's settings: the CLI's config.toml keys, which these override
            settings = {
                format = "name", -- or 'abbreviation' for Jn 3:16
                ["psg-fmt"] = { join_adjacent = true }, -- 3:16-18, not 3:16,17,18
                ["reference-diagnostics"] = "hint", -- 'info' (default), 'hint', or 'never'
                ["reference-diagnostics-template"] = "diagnostic", -- their text
                ["inlay-hints"] = "never", -- 'changed' (default), 'always', 'osis', 'never'
                ext = "md,txt,typ", -- what references and searches cover
                --   hover = { 'osis', 'book', 'genres', 'verses' } }
                -- any of `HoverField`
                hover = { "text" },
            },
            parallel = { highlight = "Search" },
            cache = true,
            -- Searches and go-to-references cover the workspace's EPUBs too; with epub.nvim, their
            -- references open in its rendered chapters
            -- This jumps me to the end of the file (at least for my results in Mt 1:1)
            -- epub = true,
        },
    },
}
