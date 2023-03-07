local M = {}

M.keymaps = function()
  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    g = {
      name = 'Go to',
      D = { vim.lsp.buf.declaration, '[D]eclaration' },
      d = { vim.lsp.buf.definition, '[D]efinition' },
      i = { vim.lsp.buf.implementation, '[I]mplementation' },
      r = { vim.lsp.buf.references, '[R]eferences' },
    },
    K = { vim.lsp.buf.hover, 'Hover' },
    ['['] = {
      d = { vim.diagnostic.goto_prev, 'Previous [D]iagnostic' },
    },
    [']'] = { d = { vim.diagnostic.goto_next, 'Next [D]iagnostic' } },
    [','] = {
      D = { vim.lsp.buf.type_definition, 'Type [D]efinition' },
      rn = { vim.lsp.buf.rename, '[R]e[N]ame symbol' },
      ca = { vim.lsp.buf.code_action, '[C]ode [A]ction' },
      k = { vim.lsp.buf.signature_help, 'Signature help' },
      e = { vim.diagnostic.open_float, 'Op[E]n diagnostics' },
      q = {
        vim.diagnostic.setloclist,
        'Create/replace location list for window',
      },
      f = { vim.lsp.buf.format, '[F]ormat file' },
      w = {
        name = 'Workspace',
        a = { vim.lsp.buf.add_workspace_folder, '[A]dd folder' },
        r = { vim.lsp.buf.remove_workspace_folder, '[R]emove folder' },
        l = {
          function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end,
          '[L]ist folders',
        },
      },
    },
  })
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    'textDocument/formatting',
    vim.lsp.util.make_formatting_params({}),
    function(err, res, ctx)
      if err then
        local err_msg = type(err) == 'string' and err or err.message
        -- you can modify the log message / level (or ignore it completely)
        vim.notify('formatting: ' .. err_msg, vim.log.levels.WARN)
        return
      end

      -- don't apply results if buffer is unloaded or has been modified
      if
        not vim.api.nvim_buf_is_loaded(bufnr)
        or vim.api.nvim_buf_get_option(bufnr, 'modified')
      then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or 'utf-16')
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd('silent noautocmd update')
        end)
      end
    end
  )
end

M.on_attach = function(client, bufnr)
  vim.inspect(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  M.keymaps()

  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        async_formatting(bufnr)
      end,
    })
  end
end

return M
