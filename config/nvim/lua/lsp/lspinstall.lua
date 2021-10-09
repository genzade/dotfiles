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
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  -- buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
      hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
      hi LspDiagnosticsVirtualTextInformation guifg=Blue ctermfg=Blue
      hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White
      hi LspDiagnosticsUnderlineError gui=undercurl guisp=red term=undercurl cterm=undercurl
      hi LspDiagnosticsUnderlineWarning gui=undercurl guisp=Yellow term=undercurl cterm=undercurl
      hi LspDiagnosticsUnderlineInformation gui=undercurl guisp=Blue term=undercurl cterm=undercurl
      hi LspDiagnosticsUnderlineHint gui=undercurl guisp=White term=undercurl cterm=undercurl
    ]], false)
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api
      .nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync(nil, 200)]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- Configure lua language server for neovim development
local lua_settings = {
  Lua = {
    runtime = {
      -- LuaJIT in the case of Neovim
      version = "LuaJIT",
      path = vim.split(package.path, ";"),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { "vim" },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      },
    },
  },
}

local ruby_settings = {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  flags = { debounce_text_changes = 150 },
  -- on_attach = function(_, _)
  --   print("Attached to Solargraph")
  -- end,
  -- handlers = {
  --   ["textDocument/publishDiagnostics"] = vim.lsp.with(
  --     vim.lsp.diagnostic.on_publish_diagnostics, {
  --       -- Disable virtual_text on file load
  --       -- Show with vim.lsp.diagnostic.show_line_diagnostics()
  --       virtual_text = false,
  --     }),
  -- },
}

-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end

-- Install missing servers
local function install_servers()
  local required_servers = {
    "bash",
    "efm",
    "css",
    "dockerfile",
    -- "elixir",
    "go",
    "html",
    "json",
    "lua",
    -- "python",
    "ruby",
    "tailwindcss",
    "typescript",
    "vue",
    "yaml",
  }

  local installed_servers = require"lspinstall".installed_servers()

  for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
      require"lspinstall".install_server(server)
    end
  end
end

-- lsp-install
local function setup_servers()
  require"lspinstall".setup()

  -- get all installed servers
  local servers = require"lspinstall".installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    -- language specific config
    if server == "lua" then
      config.settings = lua_settings
    end

    if server == "efm" then
      config = vim.tbl_extend("force", config, require "lsp.efm-ls")
    end

    if server == "ruby" then
      config.settings = ruby_settings
    end

    require"lspconfig"[server].setup(config)
  end
end

install_servers()

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require"lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
