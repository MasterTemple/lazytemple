return {
  {
    "https://github.com/MasterTemple/mkmv",
    version = "5a94c4b",
    opts = {
      rename_on_move = false,
      rename_include_extension = false,
      write_empty_file_on_create = true,
    },
    keys = {
      { "<leader>fn", ":CreateInFolder<CR>", { desc = "[F]ile [N]ew" } },
      { "<leader>fm", ":MoveToFolder<CR>", { desc = "[F]ile [M]ove" } },
    },
  },
}
