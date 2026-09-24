local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- CopyFilePath: Copy path to current file to clipboard
local function copy_current_file()
    local current_file = vim.fn.expand("%:p")
    if current_file == "" then
        print("No file in current buffer")
        return
    end
    vim.fn.setreg("+", current_file)
    print("Copied file path: " .. current_file)
end
vim.api.nvim_create_user_command("CopyFilePath", copy_current_file, { desc = "Copy path to current file to clipboard" })

-- CopyDirectoryPath: Copy path to current directory to clipboard
local function copy_current_directory()
    local current_file = vim.fn.expand("%:p")
    if current_file == "" then
        print("No file in current buffer")
        return
    end
    local dir = vim.fn.fnamemodify(current_file, ":h")
    vim.fn.setreg("+", dir)
    print("Copied directory path: " .. dir)
end
vim.api.nvim_create_user_command(
    "CopyDirectoryPath",
    copy_current_directory,
    { desc = "Copy path to current directory to clipboard" }
)

-- <leader>cpf: Pick a file with Telescope and copy its path to clipboard
local function copy_file_path_picker()
    local handle = io.popen("fd . --type f -E '*/\\.*' -E '*/target/*' -E '*/node_modules/*'")
    if not handle then
        return
    end
    local result = handle:read("*a")
    handle:close()

    local files = {}
    for line in result:gmatch("[^\r\n]+") do
        table.insert(files, line)
    end

    pickers
        .new({}, {
            prompt_title = "Copy File Path",
            finder = finders.new_table({ results = files }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local file = vim.fn.fnamemodify(selection[1], ":p")
                    vim.fn.setreg("+", file)
                    print("Copied file path: " .. file)
                end)
                return true
            end,
        })
        :find()
end
vim.keymap.set("n", "<leader>cpf", copy_file_path_picker, { desc = "[C]opy [P]ath to [F]ile" })

-- <leader>cpd: Pick a directory with Telescope and copy its path to clipboard
local function copy_directory_path_picker()
    local handle = io.popen("fd . --type d -E '*/\\.*' -E '*/target/*' -E '*/node_modules/*'")
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
            prompt_title = "Copy Directory Path",
            finder = finders.new_table({ results = dirs }),
            sorter = conf.generic_sorter({}),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local dir = vim.fn.fnamemodify(selection[1], ":p")
                    vim.fn.setreg("+", dir)
                    print("Copied directory path: " .. dir)
                end)
                return true
            end,
        })
        :find()
end
vim.keymap.set("n", "<leader>cpd", copy_directory_path_picker, { desc = "[C]opy [P]ath to [D]irectory" })
