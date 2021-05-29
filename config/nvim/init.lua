require("globals")
require("lsp")
require("keymaps")
require("plugins")
require("settings")

-- highlight column when text reeaches it
-- local cmd = vim.cmd
-- vim.api.nvim_command([[highlight ColorColumn ctermbg=magenta]])
-- cmd([[autocmd BufEnter * call matchadd('ColorColumn', '\\%81v', 100)]])

-- Helper function because no native API exists yet
-- Ref https://github.com/norcalli/nvim_utils/blob/master/lua/nvim_utils.lua#L554-L567
-- function nvim_create_augroups(definitions)
--   for group_name, definition in pairs(definitions) do
--     vim.api.nvim_command("augroup " .. group_name)
--     vim.api.nvim_command("autocmd!")
--
--     for _, def in ipairs(definition) do
--       local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
--       vim.api.nvim_command(command)
--     end
--
--     vim.api.nvim_command("augroup END")
--   end
-- end

-- vim.api.nvim_command([[highlight ColorColumn ctermbg=magenta]])
-- vim.api.nvim_command([[
--   autocmd BufEnter * call matchadd('ColorColumn', '\\%81v', 100)
-- ]])

-- function Nvim_create_augroups(definitions)
--   for group_name, definition in pairs(definitions) do
--     vim.api.nvim_command("augroup " .. group_name)
--     vim.api.nvim_command("autocmd!")
--
--     for _, def in ipairs(definition) do
--       -- if type(def) == 'table' and type(def[#def]) == 'function' then
--       --          --  def[#def] = lua_callback(def[#def])
--       --                      -- end
--       local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
--       vim.api.nvim_command(command)
--     end
--
--     vim.api.nvim_command("augroup END")
--   end
-- end
--
-- local autocmds = {
--   highlight_column = { { "BufEnter", "*", "call matchadd('ColorColumn', '%120v', 100)" } },
--   -- highlight_column = { { "BufEnter", "*", "match ErrorMsg '%>80v.+'" } },
-- }
--
-- Nvim_create_augroups(autocmds)
