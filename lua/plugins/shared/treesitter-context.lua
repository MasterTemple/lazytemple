-- Sticky scroll: pin the enclosing structs/functions/conditions/loops to the
-- top of the window (like VS Code's "Sticky Scroll")
-- https://github.com/nvim-treesitter/nvim-treesitter-context
return {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        {
            "[x",
            function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end,
            desc = "Jump to enclosing conte[x]t",
        },
        {
            "<leader>lc",
            "<cmd>TSContext toggle<cr>",
            desc = "[L]SP Sticky [C]ontext toggle",
        },
    },
    opts = {
        max_lines = 6, -- Never take more than 6 lines of the window
        multiline_threshold = 1, -- Show only the first line of a multi-line signature
        trim_scope = "outer", -- When over max_lines, drop the outermost scopes
        mode = "cursor", -- Context for the cursor line, not the top line
    },
}
