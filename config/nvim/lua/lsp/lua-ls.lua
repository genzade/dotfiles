-- Lua LS
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

-- local function documentHighlight(client, bufnr)
--  -- Set autocommands conditional on server_capabilities
--  if client.resolved_capabilities.document_highlight then
--    vim.api.nvim_exec([[
--      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
--      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
--      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
--      augroup lsp_document_highlight
--        autocmd! * <buffer>
--        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
--        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
--      augroup END
--    ]], false)
--  end
-- end
--
-- local function common_on_attach(client, bufnr)
--  documentHighlight(client, bufnr)
-- end


require"lspconfig".lua.setup {
 cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
 -- on_attach = common_on_attach,
 settings = {
   Lua = {
     runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
     diagnostics = { globals = { "vim", "use" } },
     workspace = {
       library = {
         [vim.fn.expand("$VIMRUNTIME/lua")] = true,
         [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
       },
     },
     -- Do not send telemetry data containing a randomized but unique identifier
     telemetry = { enable = false },
   },
 },
}

-- return {
--   cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
--   -- on_attach = common_on_attach,
--   settings = {
--     Lua = {
--       runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
--       diagnostics = { globals = { "vim", "use" } },
--       workspace = {
--         library = {
--           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--           [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--         },
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = { enable = false },
--     },
--   },
-- }
