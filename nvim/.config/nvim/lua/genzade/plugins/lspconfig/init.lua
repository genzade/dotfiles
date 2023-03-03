local config = function()
  local signs = {
    Error = ' ',
    Warn = ' ',
    Hint = ' ',
    Info = ' ',
  }

  for sign_type, sign_icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. sign_type
    vim.fn.sign_define(hl, { text = sign_icon, texthl = hl, numhl = hl })
  end

  local mason_ok, mason = pcall(require, 'mason')
  if not mason_ok then
    return
  end

  mason.setup({
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })

  local mason_lspc_ok, mason_lspc = pcall(require, 'mason-lspconfig')
  if not mason_lspc_ok then
    return
  end

  local lspc_ok, lspconfig = pcall(require, 'lspconfig')
  if not lspc_ok then
    return
  end

  local servers = {
    'bashls',
    'clangd',
    'cssls',
    'dockerls',
    'html',
    'solargraph',
    'lua_ls',
    'tailwindcss',
    'taplo',
    'terraformls',
    'tsserver',
    'yamlls',
  }

  mason_lspc.setup({ ensure_installed = servers, automatic_install = true })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local on_attach = require('genzade.plugins.lspconfig.defaults').on_attach

  local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
  if not cmp_nvim_lsp_ok then
    return
  end

  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

  mason_lspc.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
      -- opts = { on_attach = on_attach, capabilities = capabilities }
      lspconfig[server_name].setup({ on_attach = on_attach, capabilities = capabilities })
    end,
    -- -- Next, you can provide targeted overrides for specific servers.
    -- ["rust_analyzer"] = function()
    --   require("rust-tools").setup {}
    -- end,
    ['lua_ls'] = function()
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })
    end,
  })
end

return {
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = config,
}
