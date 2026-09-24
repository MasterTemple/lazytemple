--[[
"/home/dgmastertemple/Dropbox/Apps/remotely-save/MasterTemple/Library/Books/EPUB/Watchfulness - Recovering a Lost Spiritual Discipline - Brian Hedges.epub"
"OEBPS/1_What_-_The_Nature_of_Watchfulness.xhtml"

zipedit-open "/home/dgmastertemple/Dropbox/Apps/remotely-save/MasterTemple/Library/Books/EPUB/Watchfulness - Recovering a Lost Spiritual Discipline - Brian Hedges.epub" "OEBPS/1_What_-_The_Nature_of_Watchfulness.xhtml" 120:4

nvim -c 'ZipEdit "/home/dgmastertemple/Dropbox/Apps/remotely-save/MasterTemple/Library/Books/EPUB/Watchfulness - Recovering a Lost Spiritual Discipline - Brian Hedges.epub" "OEBPS/1_What_-_The_Nature_of_Watchfulness.xhtml" 120:4'
--]]
return {
    {
        "MasterTemple/zipedit.nvim",
        dir = vim.g.personal and "/home/dgmastertemple/Development/lua/zipedit.nvim/" or nil,
        dev = vim.g.personal,
        name = "zipedit",
        cmd = "ZipEdit",
    },
}
