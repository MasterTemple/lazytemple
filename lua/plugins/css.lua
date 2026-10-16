return {
    {
        -- LSP for project CSS classes (complements tailwindcss)
        "MasterTemple/css-class-lsp",
        dir = vim.g.personal and "/home/dgmastertemple/Development/rust/css-class-lsp/" or nil,
        dev = vim.g.personal,
        main = "css-class-lsp",
        build = "cargo build --release",
        lazy = false,
        opts = {
            settings = {
                -- Built-in patterns already cover RSX (`class: "..."`, `class: if c { "a" }`,
                -- `format!`), HTML, JSX, Vue and clsx/cn calls.
                class_regex = {},
                diagnostics = {
                    enabled = true,
                    severity = "warning",
                    ignore = {},
                },
            },
        },
        keys = {
            {
                "<leader>sdc",
                "<cmd>Telescope css_class undefined<cr>",
                desc = "[S]earch [D]iagnostics: undefined [C]SS classes",
            },
            -- { "<leader>sC", "<cmd>Telescope css_class classes<cr>", desc = "[S]earch [C]SS classes" },
        },
    },
}
