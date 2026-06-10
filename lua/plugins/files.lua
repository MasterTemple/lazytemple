-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    -- version = vim.version.range("*"),
    version = "8f858a7",
    opts = {

      ---@module 'neo-tree'
      ---@type neotree.Config.Filesystem
      filesystem = {
        window = {
          mappings = {
            -- ["\\"] = "close_window",
            -- ["w"] = "open_with_window_picker",
            -- ["<CR>"] = "open_with_window_picker",

            -- ["r"] = "rename_basename",
            -- ["R"] = "rename",
            -- ["<c-r>"] = "refresh",

            ["gx"] = {
              command = function(state)
                local node = state.tree:get_node()
                local filepath = node.path
                local osType = os.getenv("OS")

                local command

                if osType == "Windows_NT" then
                  command = "start " .. filepath
                elseif osType == "Darwin" then
                  command = "open " .. filepath
                else
                  command = "xdg-open " .. filepath
                end
                os.execute(command)
              end,
              desc = "open_with_system_defaults",
            },
          },
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          leave_dirs_open = false, -- `false` closes auto-opened dirs when moving to a new file
        },
      },
    },
    keys = {
      {
        "\\",
        function()
          local manager = require("neo-tree.sources.manager")
          local renderer = require("neo-tree.ui.renderer")

          local state = manager.get_state("filesystem")
          local winid = state and state.winid

          if winid and vim.api.nvim_win_is_valid(winid) then
            if vim.api.nvim_get_current_win() == winid then
              vim.cmd("wincmd p")
            else
              vim.api.nvim_set_current_win(winid)
            end
          else
            require("neo-tree.command").execute({
              toggle = false,
              reveal = true,
            })

            -- return focus to previous window after opening
            vim.cmd("wincmd p")
            vim.cmd("wincmd =")
          end
        end,
        { desc = "NeoTree Toggle Focus", silent = true },
      },
      {
        "<leader>\\",
        function()
          require("neo-tree.command").execute({
            toggle = true,
            reveal = false,
          })
          vim.cmd("wincmd =")

          -- if NeoTree stole focus, return it
          vim.schedule(function()
            local manager = require("neo-tree.sources.manager")
            local state = manager.get_state("filesystem")
            local winid = state and state.winid

            if winid and vim.api.nvim_get_current_win() == winid then
              vim.cmd("wincmd p")
            end
          end)
        end,
        { desc = "NeoTree Toggle Window", silent = true },
      },
    },
  },

  {
    "https://github.com/nvim-lua/plenary.nvim",
    version = "74b06c6",
  },
  {
    "https://github.com/MunifTanjim/nui.nvim",
    version = "de74099",
  },
  {
    "https://github.com/s1n7ax/nvim-window-picker",
    version = "6382540",
    opts = {
      hint = "floating-big-letter",
    },
  },
  {
    "https://github.com/nvim-tree/nvim-web-devicons",
    version = "dfbfaa9",
  },

  -- alternative: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-files.md
  {
    "https://github.com/stevearc/oil.nvim",
    version = "0fcc838",
    keys = {
      { "<BS>", "<cmd>Oil<CR>", { desc = "Edit files of parent directory" } },
    },
  },
  {
    "https://github.com/nvim-mini/mini.icons",
    version = "520995f",
  },
}
