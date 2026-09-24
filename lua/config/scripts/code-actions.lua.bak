-- code_actions_qf.lua
--
-- Iterate the quickfix list, and at each entry:
--   1. Move to that buffer/position
--   2. Request textDocument/codeAction (including the diagnostics on that line)
--   3. Search the returned action titles with a *Vim* regex (\-escapes, not Lua % patterns)
--   4. Resolve (if needed) + apply the first matching action
--   5. Force a request/response round trip so we never race ahead of the server
--   6. Save the buffer
--   7. Move to the next quickfix entry
--
-- Usage (as a plugin file, e.g. ~/.config/nvim/lua/code_actions_qf.lua):
--   require('code_actions_qf').setup {
--     client_name = 'rust_analyzer', -- name of the LSP client to target
--     timeout = 10000,               -- ms to wait for each LSP response
--     settle_ms = 150,               -- extra fixed pause for diagnostics debounce
--   }
--
-- Then, with a populated quickfix list (e.g. from diagnostics):
--   :CodeActions Remove all unused imports
--
-- The text after :CodeActions is compiled with vim.regex(), i.e. Vim regex
-- syntax where special characters are escaped with `\` (like `\.` `\<` `\>`),
-- NOT Lua string patterns (which use `%`). A plain literal string like
-- "Remove all unused imports" works as-is since it has no magic characters.
-- Add `\c` anywhere in the pattern for case-insensitive matching.
--
-- Requires Neovim >= 0.10 (vim.lsp.get_clients, client:request colon API).

local M = {}

M.config = {
  client_name = 'rust_analyzer',
  timeout = 10000,
  settle_ms = 150,
}

function M.setup(opts)
  M.config = vim.tbl_extend('force', M.config, opts or {})
end

--- Fire an LSP request and block (via vim.wait, which still pumps the event
--- loop so the async response can arrive) until the response comes back or
--- we time out.
local function sync_request(client, bufnr, method, params, timeout)
  local done, result, err = false, nil, nil

  local ok, request_id = client:request(method, params, function(e, r)
    err = e
    result = r
    done = true
  end, bufnr)

  if not ok then
    return nil, 'failed to send ' .. method
  end

  local waited_ok = vim.wait(timeout or M.config.timeout, function()
    return done
  end, 10)

  if not waited_ok then
    if request_id then
      pcall(client.cancel_request, client, request_id)
    end
    return nil, 'timeout waiting for ' .. method
  end

  return result, err
end

--- Round-trip a cheap request so any didChange/didSave notifications we just
--- sent have definitely been processed before we continue. This is a
--- best-effort "wait for idle" barrier: LSP servers generally handle
--- messages in the order received, so a response here means our prior
--- notifications are at least dequeued. rust-analyzer's diagnostics
--- computation is separately debounced, hence the extra settle_ms pause.
local function wait_for_idle(client, bufnr, opts)
  sync_request(client, bufnr, 'textDocument/documentSymbol', {
    textDocument = vim.lsp.util.make_text_document_params(bufnr),
  }, opts.timeout)

  if opts.settle_ms and opts.settle_ms > 0 then
    vim.wait(opts.settle_ms)
  end
end

--- Apply a Command | CodeAction returned from textDocument/codeAction,
--- resolving it first if the server only sent back lazy `data`.
local function apply_code_action(client, bufnr, action, opts)
  if not action.edit
      and client.server_capabilities.codeActionProvider
      and type(client.server_capabilities.codeActionProvider) == 'table'
      and client.server_capabilities.codeActionProvider.resolveProvider
  then
    local resolved, err = sync_request(client, bufnr, 'codeAction/resolve', action, opts.timeout)
    if err then
      vim.notify('codeAction/resolve failed: ' .. vim.inspect(err), vim.log.levels.ERROR)
    elseif resolved then
      action = resolved
    end
  end

  if action.edit then
    vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
  end

  if action.command then
    local cmd
    if type(action.command) == 'string' then
      -- `action` itself is a Command object: {title, command, arguments}
      cmd = { command = action.command, arguments = action.arguments }
    else
      cmd = action.command
    end
    local _, err = sync_request(client, bufnr, 'workspace/executeCommand', cmd, opts.timeout)
    if err then
      vim.notify('workspace/executeCommand failed: ' .. vim.inspect(err), vim.log.levels.ERROR)
    end
  end
end

--- Whether `client`'s root_dir covers the given buffer's file (or the
--- client has no root_dir, e.g. single-file mode).
local function client_covers_buf(client, bufnr)
  local root = client.config and client.config.root_dir
  if not root then
    return true
  end
  local fname = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr))
  return vim.startswith(fname, vim.fs.normalize(root))
end

--- `vim.fn.bufload()` reads the file into memory but doesn't reliably fire
--- the FileType/autocmd chain that normally makes an LSP client attach to a
--- newly opened buffer (that usually happens on a real `:edit`). So a
--- client already running for this workspace may simply not know about the
--- buffer yet. Check for an existing attachment first; if there isn't one,
--- reuse a running client with a matching root_dir and attach it manually.
local function find_client(bufnr, client_name)
  local attached = vim.lsp.get_clients({ bufnr = bufnr, name = client_name })
  if #attached > 0 then
    return attached[1], false
  end

  for _, client in ipairs(vim.lsp.get_clients({ name = client_name })) do
    if client_covers_buf(client, bufnr) then
      vim.lsp.buf_attach_client(bufnr, client.id)
      return client, true
    end
  end

  return nil, false
end

--- Collect the raw LSP diagnostics (not nvim's internal Diagnostic shape) on
--- a given 0-indexed line, so we can hand them to textDocument/codeAction's
--- context.diagnostics.
local function lsp_diagnostics_on_line(bufnr, lnum0)
  local out = {}
  for _, d in ipairs(vim.diagnostic.get(bufnr, { lnum = lnum0 })) do
    local raw = d.user_data and d.user_data.lsp
    if raw then
      table.insert(out, raw)
    end
  end
  return out
end

--- Run the whole quickfix -> code action -> apply -> save pipeline.
function M.run(pattern_str, user_opts)
  local opts = vim.tbl_extend('force', M.config, user_opts or {})

  local regex_ok, regex = pcall(vim.regex, pattern_str)
  if not regex_ok then
    vim.notify('CodeActions: invalid pattern: ' .. pattern_str, vim.log.levels.ERROR)
    return
  end

  local qflist = vim.fn.getqflist()
  if #qflist == 0 then
    vim.notify('CodeActions: quickfix list is empty', vim.log.levels.WARN)
    return
  end

  local applied, skipped = 0, 0

  for i, item in ipairs(qflist) do
    if not item.bufnr or item.bufnr == 0 then
      skipped = skipped + 1
      goto continue
    end

    vim.fn.bufload(item.bufnr)
    vim.api.nvim_set_current_buf(item.bufnr)

    local lnum0 = math.max((item.lnum or 1) - 1, 0)
    local col0 = math.max((item.col or 1) - 1, 0)
    pcall(vim.api.nvim_win_set_cursor, 0, { lnum0 + 1, col0 })

    local client, just_attached = find_client(item.bufnr, opts.client_name)
    if not client then
      vim.notify(
        string.format('CodeActions[%d]: no "%s" client attached to buffer %d', i, opts.client_name, item.bufnr),
        vim.log.levels.WARN
      )
      skipped = skipped + 1
      goto continue
    end

    if just_attached then
      -- Let the server process didOpen before we ask it for code actions.
      wait_for_idle(client, item.bufnr, opts)
    end

    local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
    params.context = {
      diagnostics = lsp_diagnostics_on_line(item.bufnr, lnum0),
      triggerKind = 1,
    }

    local actions, err = sync_request(client, item.bufnr, 'textDocument/codeAction', params, opts.timeout)
    if err then
      vim.notify(
        string.format('CodeActions[%d]: codeAction request failed: %s', i, vim.inspect(err)),
        vim.log.levels.ERROR
      )
      skipped = skipped + 1
      goto continue
    end

    if not actions or #actions == 0 then
      vim.notify(string.format('CodeActions[%d]: no code actions available', i), vim.log.levels.WARN)
      skipped = skipped + 1
      goto continue
    end

    local match = nil
    for _, action in ipairs(actions) do
      if action.title and regex:match_str(action.title) then
        match = action
        break
      end
    end

    if not match then
      vim.notify(string.format('CodeActions[%d]: no action title matched %q', i, pattern_str), vim.log.levels.WARN)
      skipped = skipped + 1
      goto continue
    end

    apply_code_action(client, item.bufnr, match, opts)

    -- Let the server catch up on the didChange our edit just triggered
    -- before we save and move on.
    wait_for_idle(client, item.bufnr, opts)

    vim.api.nvim_buf_call(item.bufnr, function()
      vim.cmd('silent write')
    end)

    -- ...and again after didSave.
    wait_for_idle(client, item.bufnr, opts)

    applied = applied + 1

    ::continue::
  end

  vim.notify(string.format('CodeActions: applied %d, skipped %d', applied, skipped), vim.log.levels.INFO)
end

-- Commands

vim.api.nvim_create_user_command('QfListCodeActions', function(cmd_opts)
  M.run(cmd_opts.args)
end, {
  nargs = '+',
  desc = 'Iterate the quickfix list, apply the first code action whose title matches a Vim regex, and save each file',
})

vim.api.nvim_create_user_command('QfWarningCodeActions', function(cmd_opts)
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
  M.run(cmd_opts.args)
end, {
  nargs = '+',
  desc = 'Iterate the warning diagnostics, apply the first code action whose title matches a Vim regex, and save each file',
})

vim.api.nvim_create_user_command('QfErrorCodeActions', function(cmd_opts)
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
  M.run(cmd_opts.args)
end, {
  nargs = '+',
  desc = 'Iterate the error diagnostics, apply the first code action whose title matches a Vim regex, and save each file',
})

-- Keybinds

vim.keymap.set("n", "<leader>qfa", "<cmd>QfCodeActions<CR>", {
	desc = "[Q]uick[F]ix Code [A]ctions"
})

-- Shorthands

vim.api.nvim_create_user_command('QfRemoveAllUnusedImports', function(cmd_opts)
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
  M.run("Remove all unused imports")
end, {
  desc = 'Remove all unused imports across project (sets QFList)',
})

return M
