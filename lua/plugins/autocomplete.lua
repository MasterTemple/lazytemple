-- [[ Autocomplete Engine ]]
-- return {
--   {
--     "L3MON4D3/LuaSnip",
--     -- version = vim.version.range("2.*"),
--     version = "0abc8f3",
--   },
--   {
--     "saghen/blink.cmp",
--     -- version = vim.version.range("1.*"),
--     build = function() require('blink.cmp').build():pwait() end,
--     version = "35e3923",
--     ---@param opts blink.cmp.Config
--     opts = function(_, opts)
--       -- Neovide can actually accept CTRL+ENTER
--       local accept_key = vim.g.neovide and "<C-CR>" or "<CR>"
--
--       -- 'default' (recommended) for mappings similar to built-in completions
--       --   <c-y> to accept ([y]es) the completion.
--       --    This will auto-import if your LSP supports it.
--       --    This will expand snippets if the LSP sent a snippet.
--       -- 'super-tab' for tab to accept
--       -- 'enter' for enter to accept
--       -- 'none' for no mappings
--       --
--       -- For an understanding of why the 'default' preset is recommended,
--       -- you will need to read `:help ins-completion`
--       --
--       -- No, but seriously. Please read `:help ins-completion`, it is really good!
--       --
--       -- All presets have the following mappings:
--       -- <tab>/<s-tab>: move to right/left of your snippet expansion
--       -- <c-space>: Open menu or open docs if already open
--       -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
--       -- <c-e>: Hide menu
--       -- <c-k>: Toggle signature help
--       --
--       -- See `:help blink-cmp-config-keymap` for defining your own keymap
--       opts.keymap = opts.keymap or {}
--       opts.keymap.preset = "default"
--       -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--       --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--       opts.keymap[accept_key] = { "accept", "fallback" }
--       opts.keymap["<tab>"] = { "accept", "fallback" }
--       opts.keymap["<c-cr>"] = { "accept", "fallback" }
--       opts.keymap["<s-cr>"] = { "accept", "fallback" }
--
--       opts.appearance = {
--         -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
--         -- Adjusts spacing to ensure icons are aligned
--         nerd_font_variant = "mono",
--       }
--
--       opts.completion = {
--         -- By default, you may press `<c-space>` to show the documentation.
--         -- Optionally, set `auto_show = true` to show the documentation after a delay.
--         documentation = { auto_show = true, auto_show_delay_ms = 200 },
--         trigger = {
--           show_on_backspace_in_keyword = true,
--         },
--         -- list = {
--         --   preselect = true,
--         -- },
--       }
--
--       opts.sources = {
--         default = { "lsp", "path", "snippets", "lazydev", "buffer" },
--         providers = {
--           lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
--         },
--       }
--
--       opts.snippets = { preset = "luasnip" }
--
--       -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
--       -- which automatically downloads a prebuilt binary when enabled.
--       --
--       -- By default, we use the Lua implementation instead, but you may enable
--       -- the rust implementation via `'prefer_rust_with_warning'`
--       --
--       -- See `:help blink-cmp-config-fuzzy` for more information
--       -- fuzzy = { implementation = "lua" },
--
--       -- TODO: https://github.com/saghen/blink.cmp/pull/2526
--       opts.fuzzy = { implementation = "prefer_rust_with_warning" }
--       -- fuzzy = { implementation = "rust" },
--
--       -- Shows a signature help window while you type arguments for a function
--       opts.signature = { enabled = true }
--
--       return opts
--     end,
--   },
--   {
--     "saghen/blink.lib",
--     version = "f29d8ba",
--   },
--   {
--     "folke/lazydev.nvim",
--     version = "ff2cbcb",
--   },
-- }

return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "saghen/blink.lib",
      -- optional: provides snippets for the snippet source
      "rafamadriz/friendly-snippets",
      -- {
      --   "folke/lazydev.nvim",
      --   version = "ff2cbcb",
      -- },
    },
    build = function()
      -- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
      -- you can use `gb` in `:Lazy` to rebuild the plugin as needed
      require("blink.cmp").build():pwait()
    end,

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        preset = "default",
        ["<tab>"] = { "accept", "fallback" },
      },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        trigger = {
          show_on_backspace_in_keyword = true,
        },
      },

      -- (Default) list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"`
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "rust" },
      snippets = { preset = "luasnip" },
      signature = { enabled = true },
    },
  },
}
