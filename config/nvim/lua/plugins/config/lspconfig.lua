local function lsp_installer_config()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local servers = {
    "clangd",
    "html",
    "solargraph",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
  }

  local lsp_installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
  if not lsp_installer_ok then
    return
  end

  lsp_installer.settings({
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
  })

  local function make_config()
    local on_attach = require"plugins.config.lsp.defaults".on_attach
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    return {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = { debounce_text_changes = 150 },
    }
  end

  local runtime_path = vim.split(package.path, ";")
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  local lua_settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = runtime_path },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  }

  for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
      server:on_ready(function()
        local config = make_config()

        if server.name == "sumneko_lua" then
          config.settings = lua_settings
        end

        if server.name == "solargraph" then
          -- not working with nvim lsp installer, have to use lspconfig for this
          -- investigate/debug and then open an issue
          return
        end

        server:setup(config)
      end)

      if not server:is_installed() then
        print("Installing " .. name)
        server:install()
      end
    end
  end

  require"lspconfig".solargraph.setup(make_config())
end

return {
  setup = function(use)
    use { "neovim/nvim-lspconfig" }

    use {
      "williamboman/nvim-lsp-installer",
      after = "nvim-lspconfig",
      config = lsp_installer_config,
    }
  end,
}
