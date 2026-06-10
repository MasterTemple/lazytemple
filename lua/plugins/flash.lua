return {
  {
    "https://github.com/folke/flash.nvim",
    version = "fcea7ff",
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm1234890",
      label = {
        uppercase = false,
        after = false,
        before = true,
        rainbow = {
          enabled = true,
          -- number between 1 and 9
          shade = 5,
        },
      },
      modes = {
        search = {
          enabled = true,
        },
        char = {
          enabled = false,
        },
      },
    },
    keys = {
      {
        "<leader>v",
        function()
          require("flash").treesitter()
        end,
        { desc = "Flash Treesitter", mode = { "n", "x", "o" } },
      },
    },
  },
}
