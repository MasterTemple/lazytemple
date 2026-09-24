vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h12"

-- -----------------------------------------------------------------
-- Restart Bible LSP (kill + start) – single keybinding
-- -----------------------------------------------------------------
local function restart_bible_lsp()
    -- Kill any running bible_lsp process (ignore errors)
    vim.cmd("silent! !pkill -f bible_lsp")

    -- Small pause (optional, but safe)
    vim.wait(100)

    -- Start the LSP again
    vim.cmd("BibleLsp")
end

-- Optional user command
vim.api.nvim_create_user_command("RestartBibleLsp", restart_bible_lsp, {})

-- Map <leader>br to the restart function
vim.keymap.set("n", "<leader>bl", restart_bible_lsp, { silent = true, desc = "[B]ible LSP [R]estart" })
vim.api.nvim_create_user_command("BibleLsp", function()
    vim.lsp.start({ name = "bible_lsp", cmd = { "/home/dgmastertemple/github/bible_lsp/target/release/bible_lsp" } })
end, {})
