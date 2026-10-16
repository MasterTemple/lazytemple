return {
    {
        "tjdevries/present.nvim",
        -- version = "ce22dfa",
    },
    -- For `plugins/markview.lua` users.
    {
        {
            -- version = "a55e91f",
            "OXY2DEV/markview.nvim",
            ---@module 'markview'
            ---@type markview.config
            opts = {
                -- enable_hybrid_mode = true,
                typst = {
                    enable = false,
                },
                markdown = {
                    metadata_plus = {
                        enable = false,
                    },
                    metadata_minus = {
                        enable = false,
                    },
                    yaml = {
                        enable = false,
                    },
                    code_blocks = {
                        -- enable = false,
                        pad_amount = 0,
                    },
                    headings = {
                        enable = false,
                        org_indent_wrap = false,
                        shift_width = 0,
                        heading_1 = {
                            padding_left = 0,
                        },
                    },
                    -- https://github.com/OXY2DEV/markview.nvim/wiki/Markdown#list_items
                    list_items = {
                        enable = false,
                        wrap = true,
                        shift_width = 0,
                        indent_size = 0,
                        marker_minus = {
                            add_padding = true,
                            conceal_on_checkboxes = true,

                            text = "-",
                            hl = "MarkviewListItemMinus",
                        },
                    },
                    -- enable_hybrid_mode = true,
                    -- https://www.nerdfonts.com/cheat-sheet
                    -- TODO: Use aliases and write code
                    block_quotes = {
                        enable = true,
                        wrap = false,
                        ["TERM"] = {
                            hl = "@constant.macro",
                            preview = "󱀍 Term",
                            title = true,
                            icon = "󱀍",
                        },
                        ["WARN"] = {
                            hl = "@comment.warning",
                            preview = " Warning",
                            title = true,
                            icon = "",
                        },
                        ["WARNING"] = {
                            hl = "@comment.warning",
                            preview = " Warning",
                            title = true,
                            icon = "",
                        },
                        ["BIBLE"] = {
                            hl = "MarkviewBlockQuoteNote",
                            preview = " Bible",
                            title = true,
                            icon = "",
                        },
                        ["CF"] = {
                            hl = "@module.builtin",
                            preview = " Cross-Reference",
                            title = true,
                            icon = "",
                        },
                        ["X"] = {
                            hl = "@conceal",
                            preview = " Twitter",
                            title = true,
                            icon = "",
                        },
                        ["REMEMBER"] = {
                            hl = "@constructor",
                            preview = "󰑎 Remember",
                            title = true,
                            icon = "󰑎",
                        },
                        ["PRINCIPLE"] = {
                            hl = "@comment.hint",
                            preview = "  Principle",
                            title = true,
                            icon = " ",
                        },
                        ["TRUTH"] = {
                            hl = "@comment.hint",
                            preview = "  Truth",
                            title = true,
                            icon = " ",
                        },
                        ["HW"] = {
                            hl = "@comment.note",
                            preview = "󱓩 Homework",
                            title = true,
                            icon = "󱓩",
                        },
                        ["HOMEWORK"] = {
                            hl = "@comment.note",
                            preview = "󱓩 Homework",
                            title = true,
                            icon = "󱓩",
                        },
                        ["PDF|YELLOW"] = {
                            icon = "",
                            hl = "@comment.warning",
                            title = true,
                            preview = " PDF (Yellow)",
                        },
                        ["PDF|RED"] = {
                            icon = "",
                            hl = "@comment.error",
                            title = true,
                            preview = " PDF (Red)",
                        },
                        ["PDF|NOTE"] = {
                            icon = "",
                            hl = "@comment.todo",
                            title = true,
                            preview = " PDF (Note)",
                        },
                        ["PDF|IMPORTANT"] = {
                            icon = "",
                            hl = "@keyword.function",
                            title = true,
                            preview = " PDF (Important)",
                        },
                    },
                },
                markdown_inline = {
                    checkboxes = {
                        enable = false,
                    },
                    tags = {
                        enable = false,
                    },
                },
                preview = {
                    enable_hybrid_mode = true,
                    hybrid_modes = { "n", "no", "c" },
                    linewise_hybrid_mode = true,
                    edit_range = { 0, 0 },
                },
            },
        },
    },
}
