return {
    {
        "dmtrKovalenko/fff.nvim",
        -- version = "16b34f5",
        build = function()
            -- downloads a prebuilt binary or falls back to cargo build
            require("fff.download").download_or_build_binary()
        end,
        -- for nixos:
        -- build = "nix run .#release",
        opts = {
            debug = {
                enabled = true,
                show_scores = true,
            },
        },
        lazy = false, -- the plugin lazy-initialises itself
        keys = {
            {
                "<leader>ff",
                function()
                    require("fff").find_files()
                end,
                desc = "FFFind files",
            },
            {
                "<leader>fg",
                function()
                    require("fff").live_grep()
                end,
                desc = "LiFFFe grep",
            },
            {
                "<leader>fz",
                function()
                    require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
                end,
                desc = "Live fffuzy grep",
            },
            {
                "<leader>fc",
                function()
                    require("fff").live_grep({ query = vim.fn.expand("<cword>") })
                end,
                desc = "Search current word",
                mode = { "n" },
            },
            {
                "<leader>fs",
                function()
                    local start = vim.fn.getpos("'<")
                    local finish = vim.fn.getpos("'>")

                    local lines = vim.api.nvim_buf_get_lines(0, start[2] - 1, finish[2], false)

                    lines[1] = string.sub(lines[1], start[3])

                    if #lines > 1 then
                        lines[#lines] = string.sub(lines[#lines], 1, finish[3])
                    else
                        lines[1] = string.sub(lines[1], 1, finish[3] - start[3] + 1)
                    end

                    local selection = table.concat(lines, " ")

                    require("fff").live_grep({
                        query = selection,
                    })
                end,
                desc = "Search current selection",
                mode = { "v" },
            },
        },
    },
}
