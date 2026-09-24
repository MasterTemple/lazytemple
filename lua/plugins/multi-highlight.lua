return {
	{
	  dir = "/home/dgmastertemple/Dropbox/Development/lua/multi-highlighter.nvim",
	  config = function()
		require("multi-highlighter").setup({
		  categories = {
			mark  = { bg = "#5c3a1e", fg = "#ffcc80", bold = true },
			notes = { hl_group = "DiffAdd" },
			-- Colors
    		green = { bg = "#3d5a3e", fg = "#c8e6c9" },  -- green
    		purple = { bg = "#3b3a5c", fg = "#ce93d8" },  -- purple
    		orange = { bg = "#5c3a1e", fg = "#ffcc80" },  -- orange
    		blue = { bg = "#1e3a5c", fg = "#90caf9" },  -- blue
    		red = { bg = "#5c1e1e", fg = "#ef9a9a" },  -- red
    		yellow = { bg = "#3a3a1e", fg = "#fff176" },  -- yellow
    		teal = { bg = "#1e4a4a", fg = "#80cbc4" },  -- teal
    		pink = { bg = "#4a1e3a", fg = "#f48fb1" },  -- pink
		  },
		})
	  end,
	}
}
