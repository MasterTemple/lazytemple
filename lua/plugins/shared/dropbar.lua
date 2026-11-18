-- LSP/treesitter breadcrumbs in the winbar of every window
-- https://github.com/Bekaboo/dropbar.nvim
return {
    "Bekaboo/dropbar.nvim",
    event = { "BufReadPost", "BufNewFile" },
    keys = {
        {
            "<leader>lb",
            function()
                require("dropbar.api").pick()
            end,
            desc = "[L]SP [B]readcrumb pick",
        },
    },
    config = function(_, opts)
        require("dropbar").setup(opts)

        -- Colour the arrows by focus each time a winbar is drawn. While a
        -- winbar is being drawn, g:actual_curwin holds the focused window and
        -- nvim_get_current_win() the one being drawn. Unlike dropbar's
        -- WinEnter/WinLeave dimming, this can't get out of sync.
        local mt = getmetatable(_G.dropbar)
        local render = mt.__call
        mt.__call = function(...)
            local bar = render(...)
            if tonumber(vim.g.actual_curwin) ~= vim.api.nvim_get_current_win() then
                bar = bar:gsub("%%#DropBarIconUISeparator#", "%%#DropBarIconUISeparatorNC#")
            end
            return bar
        end
    end,
    opts = {},
}
