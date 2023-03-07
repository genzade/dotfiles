-- local config = function()
--   local which_key_ok, which_key = pcall(require, 'which-key')
--   if not which_key_ok then
--     vim.notify('which-key not found', vim.log.levels.ERROR)
--     return
--   end
--
--   local neotest_ok, neotest = pcall(require, 'neotest')
--   if not neotest_ok then
--     return
--   end
--
--   local neotest_plenary_ok, neotest_plenary = pcall(require, 'neotest-plenary')
--   if not neotest_plenary_ok then
--     return
--   end
--
--   local neotest_rspec_ok, neotest_rspec = pcall(require, 'neotest-rspec')
--   if not neotest_rspec_ok then
--     return
--   end
--
--   neotest.setup({
--     adapters = {
--       neotest_plenary,
--       neotest_rspec({
--         rspec_cmd = function()
--           return vim.tbl_flatten({
--             'bundle',
--             'exec',
--             'rspec',
--           })
--         end,
--       }),
--     },
--     -- icons = {
--     --   running_animated = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
--     --   passed = '✔',
--     --   running = '~',
--     --   failed = '✖',
--     --   skipped = 'ﰸ',
--     --   unknown = '?',
--     -- },
--   })
--
--   which_key.register({
--     ['<Leader>'] = {
--       t = {
--         name = '+TestRunner',
--         n = { neotest.run.run(), 'Run nearest test' },
--         f = { neotest.run.run(vim.fn.expand('%')), 'Run test file' },
--         -- s = { '<CMD>TestSuite<CR>', 'Run test suite' },
--         -- l = { neotest.run.run_last, 'Run last test' },
--         -- v = { '<CMD>TestVisit<CR>', 'Run test visit' },
--       },
--     },
--   }, { mode = 'n' })
-- end
--
-- return {
--   'nvim-neotest/neotest',
--   requires = {
--     'nvim-treesitter/nvim-treesitter',
--     'antoinemadec/FixCursorHold.nvim', -- remove once https://github.com/antoinemadec/FixCursorHold.nvim/issues/13 is fixed
--     'nvim-lua/plenary.nvim',
--     "nvim-neotest/neotest-plenary",
--     'olimorris/neotest-rspec',
--   },
--   config = config,
-- }

local config = function()
  -- vim.g["test#strategy"] = "fterm"
  -- vim.g["test#strategy"] = "dispatch"
  vim.g['test#strategy'] = 'neovim'

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<Leader>'] = {
      t = {
        name = '+TestRunner',
        n = { '<CMD>TestNearest<CR>', 'Run nearest test' },
        f = { '<CMD>TestFile<CR>', 'Run test file' },
        s = { '<CMD>TestSuite<CR>', 'Run test suite' },
        l = { '<CMD>TestLast<CR>', 'Run last test' },
        v = { '<CMD>TestVisit<CR>', 'Run test visit' },
      },
    },
  }, { mode = 'n' })
end

return {
  'vim-test/vim-test',
  config = config,
}
