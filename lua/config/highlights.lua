vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Visual", { reverse = true })
    vim.api.nvim_set_hl(0, "Comment", { fg = "#7e9c86" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ff9e64", bold = true })
    local line_nrs = { "LineNr", "LineNrAbove", "LineNrBelow" }
    for _, group in ipairs(line_nrs) do
	    vim.api.nvim_set_hl(0, group, { fg = "#a36845" })
    end
  end
})
