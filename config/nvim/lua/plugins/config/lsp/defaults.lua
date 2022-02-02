local M = {}

-- M.border = {
--   { "╭", "FloatBorder" },
--   { "─", "FloatBorder" },
--   { "╮", "FloatBorder" },
--   { "│", "FloatBorder" },
--   { "╯", "FloatBorder" },
--   { "─", "FloatBorder" },
--   { "╰", "FloatBorder" },
--   { "│", "FloatBorder" },
-- }

-- local orig_util_open_floating_preview =
--   vim.lsp.util.open_floating_preview

-- function vim.lsp.util.open_floating_preview(contents,
--                                             syntax,
--                                             opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or M.border

--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

M.on_attach = function(client, bufnr)
  local function buf_map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_map("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_map("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
  buf_map("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
  buf_map("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_map("n", ",k", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_map(
    "n", ",wa", "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>",
    opts
  )
  buf_map(
    "n", ",wr", "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>",
    opts
  )
  buf_map(
    "n", ",wl",
    "<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )
  buf_map(
    "n", ",D", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts
  )
  buf_map("n", ",rn", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
  buf_map("n", ",ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_map("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
  buf_map("n", ",e", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
  buf_map("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_map("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_map("n", ",q", "<CMD>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_map("n", ",f", "<CMD>lua vim.lsp.buf.formatting()<CR>", opts)

  -- let null-ls handle formatting for these languages
  local servers = { "bashls", "tsserver" }
  for _, server_name in ipairs(servers) do
    if client.name == server_name then
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec(
      [[
        augroup FormatOnSave
          autocmd!
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]], true
    )
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup DocumentHighlight
          autocmd! * <buffer>
          autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]], true
    )
  end
end

return M
