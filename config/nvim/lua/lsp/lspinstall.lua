vim.api
  .nvim_command [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]

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
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl',
  -- '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
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
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
  end
end

local function setup_servers()
  require"lspinstall".setup()

  local servers = require"lspinstall".installed_servers()

  for _, server in pairs(servers) do
    require"lspconfig"[server].setup { on_attach = on_attach }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require"lspinstall".post_install_hook = function()
  -- reload installed servers
  setup_servers()

  -- this triggers the FileType autocmd that starts the server
  vim.cmd("bufdo e")
end

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...)
--     vim.api.nvim_buf_set_keymap(bufnr, ...)
--   end
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
--
--   -- Mappings.
--   local opts = { noremap = true, silent = true }
--
--   buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   -- buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
--   -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   -- buf_set_keymap('n', '<space>wl',
--   -- '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--   buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
--   buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
--   buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
--   -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
--   -- Set autocommands conditional on server_capabilities
--   if client.resolved_capabilities.document_highlight then
--     vim.api.nvim_exec([[
--       hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
--       hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
--       hi LspDiagnosticsVirtualTextInformation guifg=Blue ctermfg=Blue
--       hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White
--       hi LspDiagnosticsUnderlineError gui=undercurl guisp=red term=undercurl cterm=undercurl
--       hi LspDiagnosticsUnderlineWarning gui=undercurl guisp=Yellow term=undercurl cterm=undercurl
--       hi LspDiagnosticsUnderlineInformation gui=undercurl guisp=Blue term=undercurl cterm=undercurl
--       hi LspDiagnosticsUnderlineHint gui=undercurl guisp=White term=undercurl cterm=undercurl
--     ]], false)
--   end
--
--   if client.resolved_capabilities.document_formatting then
--     vim.api.nvim_command [[augroup Format]]
--     vim.api.nvim_command [[autocmd! * <buffer>]]
--     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
--     vim.api
--       .nvim_command [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]
--     vim.api.nvim_command [[augroup END]]
--   end
-- end
--
-- -- config that activates keymaps and enables snippet support
-- local function make_config()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--   return {
--     -- enable snippet support
--     capabilities = capabilities,
--     -- map buffer local keybindings when the language server attaches
--     on_attach = on_attach,
--   }
-- end
--
-- -- lspinstall configuration
-- local lspinstall = require("lspinstall")
-- local lspconfig = require("lspconfig")
--
-- local function setup_servers()
--   lspinstall.setup()
--
--   local servers = lspinstall.installed_servers()
--
--   for _, server in pairs(servers) do
--     local config = make_config()
--
--     -- language specific config
--     -- local lang_config = { efm = true, bash = true, lua = true, ruby = true }
--     local lang_config = { lua = true }
--
--     if lang_config[server] then
--       config = vim.tbl_extend("force", config, require("lsp." .. server .. "-ls"))
--     end
--
--     lspconfig[server].setup(config)
--   end
-- end
--
-- setup_servers()
--
-- -- Automatically reload after `:LspInstall <server>` so we don"t have to restart neovim
-- lspinstall.post_install_hook = function()
--   setup_servers() -- reload installed servers
--
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- local handlers = {
--     ['textDocument/publishDiagnostics'] = vim.lsp.with(
--         vim.lsp.diagnostic.on_publish_diagnostics,
--         {signs = true, virtual_text = false})
-- }
--
-- local linters = require('efm/linters')
-- local formatters = require('efm/formatters')
--
-- local configs = {
--     efm = {
--         filetypes = {
--             'lua', 'sh', 'javascript', 'javascriptreact', 'typescript',
--             'typescriptreact', 'json', 'css', 'sass', 'scss', 'html', 'markdown'
--         },
--         init_options = {documentFormatting = true},
--         settings = {
--             languages = {
--                 lua = {formatters.luaFormat},
--                 sh = {linters.shellcheck, formatters.shfmt},
--                 javascript = {linters.eslint_d, formatters.prettier},
--                 javascriptreact = {linters.eslint_d, formatters.prettier},
--                 typescript = {linters.eslint_d, ormatters.prettier},
--                 typescriptreact = {linters.eslint_d, formatters.prettier},
--                 json = {formatters.prettier},
--                 css = {formatters.prettier},
--                 sass = {formatters.prettier},
--                 scss = {formatters.prettier},
--                 html = {formatters.prettier},
--                 markdown = {linters.markdownlint}
--             }
--         }
--     },
--     lua = {
--         settings = {
--             Lua = {
--                 runtime = {
--                     version = 'LuaJIT',
--                     path = vim.split(package.path, ';')
--                 },
--                 diagnostics = {globals = {'vim'}},
--                 workspace = {
--                     library = {
--                         [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--                         [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
--                     }
--                 }
--             }
--         }
--     },
--     typescript = {
--         on_attach = function(client, bufnr)
--             client.resolved_capabilities.document_formatting = false
--             on_attach(client, bufnr)
--         end
--     }
-- }
--
-- local installed_servers = lspinstall.installed_servers()
--
-- local servers = {
--     'bash', 'cpp', 'css', 'efm', 'html', 'java', 'json', 'lua', 'python',
--     'ruby', 'rust', 'typescript', 'vim'
-- }
--
-- for _, server in ipairs(servers) do
--     if not vim.tbl_contains(installed_servers, server) then
--         lspinstall.install_server(server)
--     end
--
--     local config = configs[server]
--
--     if not config then config = {} end
--
--     if not config.handlers then config.handlers = handlers end
--     if not config.capabilities then config.capabilities = capabilities end
--     if not config.on_attach then config.on_attach = on_attach end
--
--     lspconfig[server].setup(config)
-- endf
--
