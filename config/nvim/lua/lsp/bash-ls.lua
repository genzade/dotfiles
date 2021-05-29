local config = require"lspconfig".bashls.document_config

require"lspconfig/configs".bashls = nil -- important, unset the loaded config again

require"lspinstall/servers".bash = vim.tbl_extend("error", config, {
  -- lspinstall will automatically create/delete the install directory for every server
  install_script = [[
    ! -f package.json && npm init -y --scope=lspinstall || true
    npm install bash-language-server@latest
  ]],
  uninstall_script = nil, -- can be omitted
})

require"lspinstall".setup()
