local map = function(keys, func, desc)
  vim.keymap.set("n", keys, func, { desc = desc, silent = true })
end

----------
-- Misc --
----------

map("Y", "v$hy", "Yank to the end of the line")
-- map("<leader>/", "gcc", "Toggle line-wise comment")

map("<M-k>", ":m .-2<CR>", "Move up")
map("<M-j>", ":m .+1<CR>", "Move down")

map("<M-p>", vim.cmd.cprev, "Quick switcher (prev)")
map("<M-n>", vim.cmd.cnext, "Quick switcher (next)")

map("<S-h>", vim.cmd.bprev, "Previous tab")
map("<S-l>", vim.cmd.bnext, "Next tab")

map("<Esc>", vim.cmd.nohlsearch, "Clear search highlights")

--------------
-- QuickFix --
--------------

-- map("<leader>q", vim.diagnostic.setloclist, "Open diagnostic [Q]uickfix list")

map("<leader>qe", function()
  vim.diagnostic.setqflist({
    severity = vim.diagnostic.severity.ERROR,
  })
end, "[Q]uickFix: [E]rrors")

map("<leader>qw", function()
  vim.diagnostic.setqflist({
    severity = vim.diagnostic.severity.WARN,
  })
end, "[Q]uickFix: [W]arnings")

map("<leader>qr", function(opts)
  vim.lsp.buf.references(nil, {
    on_list = function(options)
      vim.fn.setqflist({}, " ", options)
      -- TODO: Not sure what args are being passed here..
      vim.cmd.copen(opts)
      -- vim.cmd[[copen]]
    end,
  })
end, "[Q]uickFix: LSP [R]eferences")

-- This will let me add references to multiple symbols if I want to iterate them together and fix them all at once
map("<leader>qar", function(opts)
  vim.lsp.buf.references(nil, {
    on_list = function(options)
      -- 'a' for append
      vim.fn.setqflist({}, "a", options)
      -- TODO: Not sure what args are being passed here..
      vim.cmd.copen(opts)
      -- vim.cmd[[copen]]
    end,
  })
end, "[Q]uickFix: [A]dd LSP [R]eferences")

-----------------------
-- Window Navigation --
-----------------------
map("<C-h>", "<C-w><C-h>", "Move focus to the left window")
map("<C-l>", "<C-w><C-l>", "Move focus to the right window")
map("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
map("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

----------
-- Case --
----------

-- -- snake -> Pascal
-- map(
-- 	"<leader>csp",
-- 	"\"aciw<C-c>:let @a=substitute(@a, '\\l', '\\u&', '')|let @a=substitute(@a, '\\v_(\\l)', '\\u\\1', 'g')|norm \"ap<CR>",
-- 	"snake_case -> PascalCase"
-- )
-- -- PascalCase -> snake_case
-- map(
-- 	"<leader>cps",
-- 	"\"aciw<C-c>:let @a=substitute(@a, '\\u', '\\l\\0', '') | let @a=substitute(@a, '\\u', '_\\l\\0', 'g')|norm \"ap<CR>",
-- 	"`PascalCase` -> `snake_case`"
-- )
-- -- camelCase -> snake_case
-- map(
-- 	"<leader>ccs",
-- 	"\"aciw<C-c>:let @a=substitute(@a, '\\b\\u', '\\l\\0', '') | let @a=substitute(@a, '\\u', '_\\l\\0', 'g')|norm \"ap<CR>",
-- 	"`camelCase` -> `snake_case`"
-- )
-- -- snake_case -> camelCase
-- map(
-- 	"<leader>csc",
-- 	"\"aciw<C-c>:let @a=substitute(@a, '\\v_(\\l)', '\\u\\1', 'g')|norm \"ap<CR>",
-- 	"`snake_case` -> `camelCase`"
-- )
-- -- snake_case -> PascalCase
-- map(
-- 	"<leader>csp",
-- 	"\"aciw<C-c>:let @a=substitute(@a, '\\l', '\\u\\0', '') | let @a=substitute(@a, '\\v_(\\l)', '\\u\\1', 'g')|norm \"ap<CR>",
-- 	"`snake_case` -> `PascalCase`"
-- )
-- -- PascalCase -> camelCase
-- map(
-- 	"<leader>cpc",
-- 	"\"aciw<C-c>:let @a=substitute(@a, '\\u', '\\l\\0', '')|norm \"ap<CR>",
-- 	"`PascalCase` -> `camelCase`"
-- )
-- -- camelCase -> PascalCase
-- map(
-- 	"<leader>ccp",
-- 	"\"aciw<C-c>:let @a=substitute(@a, '\\l', '\\u\\0', '')|norm \"ap<CR>",
-- 	"`camelCase` -> `PascalCase`"
-- )
