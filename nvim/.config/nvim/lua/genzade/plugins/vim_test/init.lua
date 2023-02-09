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

return { 'vim-test/vim-test', config = config }
