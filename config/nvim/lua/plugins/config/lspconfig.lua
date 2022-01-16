local function lsp_installer_config()
  local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " ",
  }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  local servers = {
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "html",
    "solargraph",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
    "yamlls",
  }

  local has_installer, lsp_installer =
    pcall(require, "nvim-lsp-installer")
  if not has_installer then
    return
  end

  lsp_installer.settings(
    {
      ui = {
        icons = {
          server_installed = "✓",
          server_pending = "➜",
          server_uninstalled = "✗",
        },
      },
    }
  )

  local function make_config()
    local on_attach = require"plugins.config.lsp.defaults".on_attach
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(
                     capabilities
                   )

    return {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = { debounce_text_changes = 300 },
    }
  end

  local enhance_server_opts = {
    ["sumneko_lua"] = function(opts)
      local runtime_path = vim.split(package.path, ";")

      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")

      opts.settings = {
        Lua = {
          runtime = { version = "LuaJIT", path = runtime_path },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = { enable = false },
        },
      }
    end,
  }

  for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
      server:on_ready(
        function()
          local opts = make_config()

          if enhance_server_opts[server.name] then
            -- Enhance the default opts with the server-specific ones
            enhance_server_opts[server.name](opts)
          end

          if server.name == "solargraph" then
            -- not working with nvim lsp installer, have to use lspconfig for this
            -- investigate/debug and then open an issue
            return
          end

          server:setup(opts)
        end
      )

      if not server:is_installed() then
        print("Installing " .. name)
        server:install()
      end
    end
  end

  local has_lspconfig, lspconfig = pcall(require, "lspconfig")
  if not has_lspconfig then
    return
  end

  lspconfig.solargraph.setup(make_config())
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
