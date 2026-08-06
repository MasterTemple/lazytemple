-- Add config path to run-time path
vim.opt.rtp:prepend(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h"))

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

local username = vim.env.USER or vim.env.USERNAME
vim.g.personal = not not username:match("temple")
vim.g.work = not vim.g.personal

-- Bootstrap lazy.nvim & plugins
require("config.lazy")

-- Add config path to run-time path (again)
vim.opt.rtp:prepend(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h"))

require("config.autocmds")
require("config.highlights")
require("config.mappings")
require("config.neovide")
require("config.options")

-- TODO:
require("config.scripts")

-- NOTE: https://lazy.folke.io/spec#spec-loading use enabled with vim.g.personal

-- I want to load this last
if vim.g.personal then
  require("config.personal")
else
  require("config.work")
end

vim.cmd[[

function! OpenZipFile(zip, path, line, col)
    " Construct the zipfile: URL
    let l:full_path = 'zipfile:' . getcwd() . '/' . a:zip . '::' . a:path
    " Open the file
    execute 'e ' . l:full_path
    " Jump to line and column
    execute 'call cursor(' . a:line . ', ' . a:col . ')'
endfunction   
]]
