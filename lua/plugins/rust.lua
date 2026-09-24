return {
  {
    "vxpm/ferris.nvim",
    -- version = "2758655",
    keys = {
      {
        "<leader>re",
        '<cmd>lua require("ferris.methods.expand_macro")() <CR>',
        desc = "Expand Rust macro recursively",
      },
    },
  },
  {
    "mrcjkb/rustaceanvim",
    -- version = "6ba2ec9",
    keys = {
      { "<leader><BS>", "<cmd>RustLsp parentModule<CR>", desc = "Go to parent module" },
    },
  },
}
