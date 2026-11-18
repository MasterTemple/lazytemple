return {
    {
        "L3MON4D3/LuaSnip",
        -- version = vim.version.range("2.*"),
        -- version = "0abc8f3",
        config = function()
            local ls = require("luasnip")
            local s, f = ls.snippet, ls.function_node

            -- Evaluated at expansion time, not when the snippet is defined
            local function date(format)
                return f(function()
                    return os.date(format)
                end)
            end

            ls.add_snippets("all", {
                s({ trig = "date", desc = "YYYY-MM-DD" }, date("%Y-%m-%d")),
                s({ trig = "datetime", desc = "YYYY-MM-DD HH:MM:SS" }, date("%Y-%m-%d %H:%M:%S")),
                s(
                    { trig = "iso", desc = "ISO 8601 (YYYY-MM-DDTHH:MM:SS+HH:MM)" },
                    f(function()
                        -- %z gives -0500; ISO 8601 wants -05:00
                        local offset = os.date("%z"):gsub("^([+-]%d%d)(%d%d)$", "%1:%2")
                        return os.date("%Y-%m-%dT%H:%M:%S") .. offset
                    end)
                ),
            })
        end,
    },
}
