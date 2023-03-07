local config = function()
  local tsht_ok, tsht = pcall(require, 'tsht')
  if not tsht_ok then
    return
  end

  tsht.config.hint_keys = {
    'h',
    'j',
    'f',
    'd',
    'n',
    'v',
    's',
    'l',
    'a',
  }

  -- needs investigating
  vim.keymap.set('x', 'm', function()
    tsht.nodes()
  end, { desc = 'Select ts node' })

  vim.keymap.set('n', '<leader>m', function()
    tsht.nodes()
  end, { desc = 'Select ts node' })

  vim.keymap.set('o', 'n', function()
    tsht.nodes()
  end, { desc = 'Select ts node' })
end

return {
  'mfussenegger/nvim-treehopper',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    { 'phaazon/hop.nvim', branch = 'v2' },
  },
  config = config,
}
