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
    "clangd",
    "html",
    "solargraph",
    "sumneko_lua",
    "tailwindcss",
    "tsserver",
  }

  local on_attach = function(client, bufnr)
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
  end

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
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

    return {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = { debounce_text_changes = 150 },
    }
  end

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, "lua/?.lua")
  table.insert(runtime_path, "lua/?/init.lua")

  local lua_settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
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

  require'lspconfig'.solargraph.setup(make_config())
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
