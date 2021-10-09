
-- look at this https://github.com/s1n7ax/dotnvim/blob/244f8d5d05/lua/nvim/plugins/lsp/init.lua
-- also, get this in https://github.com/L3MON4D3/LuaSnip

  -- '   (Text) ', '   (Method)', '   (Function)', '   (Constructor)',
  -- ' ﴲ  (Field)', '[] (Variable)', '   (Class)', ' ﰮ  (Interface)',
  -- '   (Module)', ' 襁 (Property)', '   (Unit)', '   (Value)',
  -- ' 練 (Enum)', '   (Keyword)', '   (Snippet)', '   (Color)',
  -- '   (File)', '   (Reference)', '   (Folder)', '   (EnumMember)',
  -- ' ﲀ  (Constant)', ' ﳤ  (Struct)', '   (Event)', '   (Operator)',
  -- '   (TypeParameter)'





local on_attach = function()
  require('lsp_signature').on_attach({
    bind = true,
    handler_opts = { border = 'single' },
    hint_prefix = '',
    use_lspsaga = true
  })

  -- mappings
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local opts = { noremap = true, silent = true }
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>wa',
                 '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts) ]]
  --[[ buf_set_keymap('n', '<leader>wr',
                 '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts) ]]
  --[[ buf_set_keymap('n', '<leader>wl',
                '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                 opts) ]]
  --[[ buf_set_keymap('n', '<leader>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>',
                 opts) ]]
  -- buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                 opts) ]]
  -- buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>e',
                 '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts) ]]
  -- buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --[[ buf_set_keymap('n', '<leader>q',
                 '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts) ]]
end 


local function setup_servers()
  require"lspinstall".setup()

  -- get all installed servers
  local servers = require"lspinstall".installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()

    require"lspconfig"[server].setup(config)
  end
end


local function lsp_install_config()
  -- Automatically reload after `:LspInstall <server>`
  -- so we don't have to restart neovim
  require"lspinstall".post_install_hook = function()
    -- reload installed servers
    setup_servers()
    -- triggers the FileType autocmd that starts server
    vim.cmd("bufdo e")
  end
end


return {
  setup = function(use)
    -- Language servers installer
    use {
      "neovim/nvim-lspconfig",
      -- config = config,
    }

    use {
      "kabouzeid/nvim-lspinstall",
      after = "neovim/nvim-lspconfig",
      config = lsp_install_config,
    }
  end,
}
