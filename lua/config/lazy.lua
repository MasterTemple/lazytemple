-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- Loaded on every machine
        { import = "plugins.shared" },
        -- Disabled imports are skipped entirely, so specs in here can point at local-only paths
        { import = "plugins.personal", enabled = vim.g.personal },
        { import = "plugins.work", enabled = vim.g.work },
    },
    -- Plugins with `dev = true` use a local checkout when one exists, else are cloned from GitHub
    dev = {
        path = function(plugin)
            for _, root in ipairs({ "lua", "rust", "nvim-plugins" }) do
                local dir = vim.fn.expand("~/Development/" .. root .. "/" .. plugin.name)
                if vim.fn.isdirectory(dir) == 1 then
                    return dir
                end
            end
            return vim.fn.expand("~/Development/" .. plugin.name)
        end,
        fallback = true,
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- don't automatically check for plugin updates
    checker = { enabled = false },
})
