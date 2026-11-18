-- Buffer tabs along the top, in a fixed left-to-right order
-- https://github.com/akinsho/bufferline.nvim

-- Telescope's buffer picker, listed in the same order as the tabs
local function search_tabs()
    local position = {}
    for i, element in ipairs(require("bufferline").get_elements().elements) do
        position[element.id] = i
    end
    require("telescope.builtin").buffers({
        prompt_title = "Tabs",
        sort_buffers = function(a, b)
            return (position[a] or math.huge) < (position[b] or math.huge)
        end,
    })
end

return {
    "akinsho/bufferline.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        -- Move by what is visually left/right of the current tab, not by buffer number
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous tab" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
        { "<M-H>", "<cmd>BufferLineMovePrev<cr>", desc = "Move tab left" },
        { "<M-L>", "<cmd>BufferLineMoveNext<cr>", desc = "Move tab right" },
        { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "[B]uffer [P]ick tab" },
        { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "[B]uffer close [O]ther tabs" },
        { "<leader>st", search_tabs, desc = "[S]earch [T]abs" },
    },
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            show_buffer_close_icons = false,
            show_close_icon = false,
            -- Keep new buffers next to the one you opened them from
            sort_by = "insert_after_current",
            offsets = {
                { filetype = "oil", text = "Files", highlight = "Directory", text_align = "left" },
            },
        },
    },
}
