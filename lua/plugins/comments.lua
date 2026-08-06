return {
  {
    "numToStr/Comment.nvim",
    -- version = "e30b7f2",
    keys = {
      { "<leader>/", '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', desc = "Toggle comment" },
      {
        "<leader>/",
        '<Esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>',
        desc = "Toggle comment",
        mode = { "v" },
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- version = "31e3c38",
    opts = {
		keywords = {
		  CHECK = { icon = "󱉶 ", color = "check", alt = { "VERIFY" } },
		  HANDLE = { icon = " ", color = "handle" },
		  DONE = { icon = " ", color = "done", alt = { "FINISHED" } },
		  SAFE = { icon = "🦀", color = "safe", alt = { "SAFETY" } },
		  JUSTIFY = { icon = " ", color = "justify" },
		  FEAT = { icon = "", color = "feat", alt = { "IDEA" } },
		  IDK = { icon = "?", color = "idk", alt = { "HELP", "QUESTION" } },
		  HIGH = { icon = "H", color = "high", alt = { "H", "HI" } },
		  MEDIUM = { icon = "M", color = "medium", alt = { "M", "MED" } },
		  LOW = { icon = "L", color = "low", alt = { "L", "LO" } },
		},
		colors = {
		  check = { "#67eb34" },
		  handle = { "#e3cb14" },
		  done = { "#42fcab" },
		  safe = { "#ffa75e" },
		  justify = { "#bc80ff" },
		  feat = { "#f5e618" },
		  idk = { "#fc4242" },
		  high = { "#fc4242" },
		  medium = { "#f7cf54" },
		  low = { "#996e29" },
		},
		-- highlight = {
		-- 	pattern = [[.*<(KEYWORDS)\s*:?]], -- pattern or table of patterns, used for highlightng (vim regex)
		-- },
		-- search = {
		-- 	pattern = [[\b(KEYWORDS)\b:?]], -- pattern or table of patterns, used for highlightng (vim regex)
    },
  },
}
