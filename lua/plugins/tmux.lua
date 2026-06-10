return {
  {
    "https://github.com/christoomey/vim-tmux-navigator",
    version = "e41c431",
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
}

-- vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
-- vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
-- vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
-- vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
-- vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")
