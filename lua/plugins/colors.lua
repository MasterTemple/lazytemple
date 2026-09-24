return {
    --[[
  TODO: Not sure which one to use
  - https://github.com/brenoprata10/nvim-highlight-colors
  - https://github.com/norcalli/nvim-colorizer.lua
  ]]
    --

    ---@module 'lazy'
    ---@type LazySpec
    {
        "brenoprata10/nvim-highlight-colors",
        ---@module "nvim-highlight-colors"
        opts = {
            enable_tailwind = true,
        },
    },
    -- {
    --   "norcalli/nvim-colorizer.lua",
    -- },
}
