-- Add config path to run-time path
vim.opt.rtp:prepend(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h"))

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Add config path to run-time path
vim.opt.rtp:prepend(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h"))

local username = vim.env.USER or vim.env.USERNAME
if username:match("temple") then
  vim.g.personal = true
else
  vim.g.personal = false
end
vim.g.work = not vim.g.personal

-- require("config.autocmds")
-- require("config.core")
require("config.highlights")
require("config.mappings")
require("config.neovide")
-- require("config.options")
-- require("config.plugins")

-- TODO:
require("config.scripts")

-- TODO:
-- I want to load this last
if vim.g.personal then
  require("config.personal")
else
  require("config.work")
end
