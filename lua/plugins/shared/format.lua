return {
    {
        "stevearc/conform.nvim",
        -- version = "18aeab3",
        opts = {
            notify_on_error = false,
            -- format_on_save = function(bufnr)
            --     -- You can specify filetypes to autoformat on save here:
            --     local enabled_filetypes = {
            --         rust = true,
            --         lua = true,
            --         python = true,
            --     }
            --     if enabled_filetypes[vim.bo[bufnr].filetype] then
            --         return { timeout_ms = 5000 }
            --     else
            --         return nil
            --     end
            -- end,

            -- https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#autoformat-with-extra-features
            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 5000, lsp_format = "fallback" }
            end,
            default_format_opts = {
                lsp_format = "fallback", -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
            },
            -- You can also specify external formatters in here.
            formatters_by_ft = {
                rust = { "rustfmt" },
                -- Conform can also run multiple formatters sequentially
                -- python = { "isort", "black" },
                python = { "ruff" },
                --
                -- You can use 'stop_after_first' to run the first available formatter from the list
                -- javascript = { "prettierd", "prettier", stop_after_first = true },
            },
        },
        keys = {
            {
                "<leader>lfb",
                function()
                    require("conform").format({ async = true })
                end,
                desc = "[L]SP [F]ormat [B]uffer",
                mode = { "n", "v" },
            },
        },
    },
}
