-- [[ Autocomplete Engine ]]
return {
  {
    "https://github.com/L3MON4D3/LuaSnip",
    -- version = vim.version.range("2.*"),
    version = "0abc8f3",
  },
  {
    "https://github.com/saghen/blink.cmp",
    -- version = vim.version.range("1.*"),
    version = "35e3923",
    ---@param opts blink.cmp.Config
    opts = function(_, opts)
      -- Neovide can actually accept CTRL+ENTER
      local accept_key = vim.g.neovide and "<C-CR>" or "<CR>"

      -- 'default' (recommended) for mappings similar to built-in completions
      --   <c-y> to accept ([y]es) the completion.
      --    This will auto-import if your LSP supports it.
      --    This will expand snippets if the LSP sent a snippet.
      -- 'super-tab' for tab to accept
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- For an understanding of why the 'default' preset is recommended,
      -- you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      --
      -- All presets have the following mappings:
      -- <tab>/<s-tab>: move to right/left of your snippet expansion
      -- <c-space>: Open menu or open docs if already open
      -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
      -- <c-e>: Hide menu
      -- <c-k>: Toggle signature help
      --
      -- See `:help blink-cmp-config-keymap` for defining your own keymap
      opts.keymap = opts.keymap or {}
      opts.keymap.preset = "default"
      -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
      --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      opts.keymap[accept_key] = { "accept", "fallback" }
      opts.keymap["<tab>"] = { "accept", "fallback" }
      opts.keymap["<c-cr>"] = { "accept", "fallback" }
      opts.keymap["<s-cr>"] = { "accept", "fallback" }

      opts.appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      }

      opts.completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        trigger = {
          show_on_backspace_in_keyword = true,
        },
        -- list = {
        -- 	preselect = true,
        -- },
      }

      opts.sources = {
        default = { "lsp", "path", "snippets", "lazydev", "buffer" },
        providers = {
          lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
        },
      }

      opts.snippets = { preset = "luasnip" }

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See `:help blink-cmp-config-fuzzy` for more information
      -- fuzzy = { implementation = "lua" },

      -- TODO: https://github.com/saghen/blink.cmp/pull/2526
      opts.fuzzy = { implementation = "prefer_rust_with_warning" }
      -- fuzzy = { implementation = "rust" },

      -- Shows a signature help window while you type arguments for a function
      opts.signature.enabled = true

      return opts
    end,
  },
  {
    "https://github.com/saghen/blink.lib",
    version = "f29d8ba",
  },
  {
    "https://github.com/folke/lazydev.nvim",
    version = "ff2cbcb",
  },
}
