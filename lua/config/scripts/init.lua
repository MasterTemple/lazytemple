local dir = "config.scripts."
local files = {
    "cd-parent",
    "fix-quotes",
    "center-cursor",
    "copy-path",
    -- "code-actions",
}
for _, file in pairs(files) do
    require(dir .. file)
end

require(dir .. "code-actions").setup({
    client_name = "rust_analyzer", -- name of the LSP client to target
    timeout = 10000, -- ms to wait for each LSP response
    settle_ms = 150, -- extra fixed pause for diagnostics debounce
})
