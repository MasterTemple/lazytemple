-- return {
--   {
--     "christoomey/vim-tmux-navigator",
--     version = "e41c431",
-- 	lazy = false,
--     keys = {
--       { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
--       { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
--       { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
--       { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
--     },
--   },
-- }

-- return {
--   "christoomey/vim-tmux-navigator",
--   cmd = {
--     "TmuxNavigateLeft",
--     "TmuxNavigateDown",
--     "TmuxNavigateUp",
--     "TmuxNavigateRight",
--     "TmuxNavigatePrevious",
--     "TmuxNavigatorProcessList",
--   },
--   keys = {
--     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
--     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
--     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
--     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
--     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
--   },
--   lazy = false
-- }

-- vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
-- vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
-- vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
-- vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
-- vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")

return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		-- https://github.com/christoomey/vim-tmux-navigator/issues/469
		init = function()
			-- Reusable function to register keymaps in different contexts
			local function set_keymaps()
				vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
				vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd>TmuxNavigateDown<cr>")
				vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd>TmuxNavigateUp<cr>")
				vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd>TmuxNavigateRight<cr>")
			end

			-- Register once globally
			set_keymaps()

			-- Re-register for terminal buffers to prevent literal command injection
			vim.api.nvim_create_autocmd("TermOpen", {
				callback = set_keymaps,
			})
		end,
		lazy = false,
	},
}
