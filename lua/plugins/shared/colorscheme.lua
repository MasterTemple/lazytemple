return {
    {
        "folke/tokyonight.nvim",
        -- version = "cdc07ac",
        lazy = false,
        priority = 1000,
        opts = {
            styles = {
                comments = { italic = false }, -- Disable italics in comments
            },
            on_highlights = function(hl, c)
                -- Winbar (dropbar.nvim breadcrumbs)
                -- WinBar and WinBarNC must stay identical: that turns off dropbar's
                -- own dimming of inactive windows, which can get stuck on the wrong
                -- window and strips the icon colors. Focus is shown by the arrows
                -- instead (see shared/dropbar.lua).
                local winbar_bg = hl.WinBar and hl.WinBar.bg or c.bg_dark
                hl.WinBar = { fg = c.fg, bg = winbar_bg }
                hl.WinBarNC = { fg = c.fg, bg = winbar_bg }
                -- Focused window: bright blue arrows. Not a palette colour on purpose:
                -- c.blue matches the folder icons and c.blue1 the string/field icons.
                hl.DropBarIconUISeparator = { fg = "#3b9eff", bold = true }
                -- Other windows: readable grey arrows
                hl.DropBarIconUISeparatorNC = { fg = c.fg_dark }
            end,
        },
    },
}
