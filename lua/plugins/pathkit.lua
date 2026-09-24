return {
    {
        "MasterTemple/pathkit.nvim",
        dir = vim.g.personal and "/home/dgmastertemple/Development/lua/pathkit.nvim/" or nil,
        dev = vim.g.personal,
        -- version = "5a94c4b",
        lazy = false,
        dependencies = { "nvim-telescope/telescope.nvim" },  -- optional
        opts = {
            -- Named bookmarks: label → absolute path (file or directory)
            -- bookmarks = {
            --     ["My Project"]  = "C:\\Users\\me\\MyProject",
            --     ["Config file"] = "C:\\Users\\me\\MyProject\\config.json",
            -- },
            -- relative_prefix = "./",
        },
        keys = {
            {
                "<leader>cd.",
                function() require("pathkit").change_directory_to_parent() end,
                desc = "[C]hange [D]irectory to Parent ([.])",
            },
            {
                "<leader>cd/",
                function() require("pathkit").change_directory_with_picker() end,
                desc = "[C]hange [D]irectory with Picker ([/])",
            },
            -- {
            --     "<leader>cdb",
            --     function() require("pathkit").change_directory_with_bookmark_picker() end,
            --     desc = "[C]hange [D]irectory [B]ookmark",
            -- },

            -- {
            --     "<leader>sb",
            --     function() require("pathkit").change_directory_with_bookmark_picker({
            --         paths = {
            --             ["TRBC Church Connect 2026"] = "/home/dgmastertemple/Dropbox/Typst/TRBC Church Connect 2026",
            --             ["TRBC Church Connect 2026/main.typ"] = "/home/dgmastertemple/Dropbox/Typst/TRBC Church Connect 2026/main.typ",
            --             ["Biola Church Fair 2025"] = "/home/dgmastertemple/Dropbox/Typst/Biola Church Fair 2025",
            --         }
            --     }) end,
            --     desc = "[C]hange [D]irectory [B]ookmark",
            -- },

            -- Align: relative /}?\) end,/
            -- Align: pathkit -p 0 /\({?/ relative /}?\)/ end, },
            { "<leader>yafa", function() require("pathkit").copy_path_to_active_file   (                   ) end, desc = "[Y]ank [A]ctive [F]ile [A]bsolute"      },
            { "<leader>yafr", function() require("pathkit").copy_path_to_active_file   ({ relative = true }) end, desc = "[Y]ank [A]ctive [F]ile [R]elative"      },
            { "<leader>ysfa", function() require("pathkit").copy_file_with_picker      (                   ) end, desc = "[Y]ank [S]elect [F]ile [A]bsolute"      },
            { "<leader>ysfr", function() require("pathkit").copy_file_with_picker      ({ relative = true }) end, desc = "[Y]ank [S]elect [F]ile [R]elative"      },
            { "<leader>yada", function() require("pathkit").copy_parent_directory      (                   ) end, desc = "[Y]ank [A]ctive [D]irectory [A]bsolute" },
            { "<leader>yadr", function() require("pathkit").copy_parent_directory      ({ relative = true }) end, desc = "[Y]ank [A]ctive [D]irectory [R]elative" },
            { "<leader>ysda", function() require("pathkit").copy_directory_with_picker (                   ) end, desc = "[Y]ank [S]elect [D]irectory [A]bsolute" },
            { "<leader>ysdr", function() require("pathkit").copy_directory_with_picker ({ relative = true }) end, desc = "[Y]ank [S]elect [D]irectory [R]elative" },

        },
    },
}
