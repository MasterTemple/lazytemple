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
    -- {
    --     "christoomey/vim-tmux-navigator",
    --     cmd = {
    --         "TmuxNavigateLeft",
    --         "TmuxNavigateDown",
    --         "TmuxNavigateUp",
    --         "TmuxNavigateRight",
    --         "TmuxNavigatePrevious",
    --         "TmuxNavigatorProcessList",
    --     },
    --     keys = {
    --             {"<C-h>", "<cmd>TmuxNavigateLeft<cr>", },
    --             {"<C-j>", "<cmd>TmuxNavigateDown<cr>", },
    --             {"<C-k>", "<cmd>TmuxNavigateUp<cr>", },
    --             {"<C-l>", "<cmd>TmuxNavigateRight<cr>", },
    --     },
    --     lazy = false,
    -- },
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
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
      lazy = false,
    }
}
