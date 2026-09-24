local dir = "config.mappings."
local files = { "normal", "insert", "visual", "terminal" }
for _, file in pairs(files) do
    require(dir .. file)
end
