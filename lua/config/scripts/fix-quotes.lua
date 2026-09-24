local function fix_quotes()
    vim.cmd([[
    %s/[‘’]/'/ge
    %s/[“”]/"/ge
  ]])
end

vim.api.nvim_create_user_command("FixQuotes", fix_quotes, {
    desc = "Replace smart quotes with ASCII quotes",
})
