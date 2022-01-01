local M = {}

M.on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { noremap = true, silent = true }

  buf_set_keymap("n", "gD", "<CMD>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", ",k", "<CMD>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", ",wa", "<CMD>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  buf_set_keymap("n", ",wr", "<CMD>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  buf_set_keymap("n", ",wl",
    "<CMD>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  buf_set_keymap("n", ",D", "<CMD>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", ",rn", "<CMD>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", ",ca", "<CMD>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gr", "<CMD>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", ",e", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "[d", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", ",q", "<CMD>lua vim.diagnostic.setloclist()<CR>", opts)
  buf_set_keymap("n", ",f", "<CMD>lua vim.lsp.buf.formatting()<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
      augroup FormatOnSave
        autocmd!
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
      augroup END
    ]], true)
  end
end

return M