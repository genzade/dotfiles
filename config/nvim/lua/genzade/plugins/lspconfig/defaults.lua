local M = {}

M.keymaps = function()
  local which_key_ok, which_key = pcall(require, "which-key")
  if not which_key_ok then
    return
  end

  which_key.register(
    {
      g = {
        name = "Go to",
        D = { vim.lsp.buf.declaration, "Declaration" },
        d = { vim.lsp.buf.definition, "Definition" },
        i = { vim.lsp.buf.implementation, "Implementation" },
        r = { vim.lsp.buf.references, "References" },
      },
      K = { vim.lsp.buf.hover, "Hover" },
      ["["] = {
        d = { vim.diagnostic.goto_prev, "Previous diagnostic" },
      },
      ["]"] = { d = { vim.diagnostic.goto_next, "Next diagnostic" } },
      [","] = {
        D = { vim.lsp.buf.type_definition, "Type definition" },
        rn = { vim.lsp.buf.rename, "Rename symbol" },
        ca = { vim.lsp.buf.code_action, "Code action" },
        k = { vim.lsp.buf.signature_help, "Signature help" },
        e = { vim.diagnostic.open_float, "Open diagnostics" },
        q = {
          vim.diagnostic.setloclist,
          "Create/replace location list for window",
        },
        f = { vim.lsp.buf.format, "Format" },
        w = {
          name = "Workspace",
          a = { vim.lsp.buf.add_workspace_folder, "Add folder" },
          r = { vim.lsp.buf.remove_workspace_folder, "Remove folder" },
          l = {
            function()
              print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end,
            "List folders",
          },
        },
      },
    }
  )
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format(
    {
      filter = function(client)
        return client.name == "null-ls"
      end,
      bufnr = bufnr,
    }
  )
end

M.on_attach = function(client, bufnr)
  vim.inspect(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(
    bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc"
  )

  -- require("lsp_signature").setup({})

  M.keymaps()

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd(
      "BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      }
    )
  end
end

return M
