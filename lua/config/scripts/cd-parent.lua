local function change_to_parent()
    local current_file = vim.fn.expand("%:p")
    if current_file == "" then
        print("No file in current buffer")
        return
    end
    local parent_dir = vim.fn.fnamemodify(current_file, ":h")
    vim.cmd("cd " .. parent_dir)
    print("Changed to: " .. parent_dir)
end

vim.api.nvim_create_user_command("CdParent", change_to_parent, { desc = "Change directory to parent of current file" })

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function change_directory_picker()
    -- Use fd to get directories
    local subcommand = table.concat({
        "fd . --type d",
        "-E '*/\\.*'",
        "-E '*/target/*'",
        "-E '*/node_modules/*'",
    }, " ")

    local handle = io.popen(subcommand)

    if not handle then
        return
    end
    local result = handle:read("*a")
    handle:close()

    local dirs = {}
    for line in result:gmatch("[^\r\n]+") do
        table.insert(dirs, line)
    end

    pickers
        .new({}, {
            prompt_title = "Change Directory",
            finder = finders.new_table({
                results = dirs,
            }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local dir = selection[1]
                    vim.cmd.cd(dir)
                    print("Changed directory to: " .. dir)
                    -- What is the first action I do after changing a directory?
                    -- For now I will just open Oil
                    -- Think about it, I can just use `tv dirs` to get to the right dir, and it doesn't look at git ignored folders
                    vim.cmd([[:e .]])
                    -- vim.cmd([[:Oil]])
                end)
                return true
            end,
        })
        :find()
end

vim.keymap.set("n", "<leader>cdp", change_to_parent, { desc = "[C]hange [D]irectory to [Parent]" })
vim.keymap.set("n", "<leader>cd.", change_to_parent, { desc = "[C]hange [D]irectory to Parent ([.])" })
vim.keymap.set("n", "<leader>cds", change_directory_picker, { desc = "[C]hange [D]irectory [S]earch" })
