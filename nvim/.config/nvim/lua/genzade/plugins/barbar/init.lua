local config = function()
  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<A-x>'] = { '<CMD>BufferClose<CR>', 'Close the buffer' },
    ['<S-TAB>'] = { '<CMD>BufferNext<CR>', 'Go to next buffer' },
    ['<C-TAB>'] = { '<CMD>BufferPrevious<CR>', 'Go to previous buffer' },
  }, { mode = 'n' })

  local ok, bufferline_api = pcall(require, 'bufferline.api')
  if not ok then
    print('bufferline_api not ok ...........................')
    return
  end

  vim.api.nvim_create_autocmd('BufWinEnter', {
    pattern = '*',
    callback = function()
      if vim.bo.filetype == 'NvimTree' then
        bufferline_api.set_offset(FILETREE_WIDTH, 'FileTree')
      end
    end,
  })

  vim.api.nvim_create_autocmd('BufWinLeave', {
    pattern = '*',
    callback = function()
      if vim.fn.expand('<afile>'):match('NvimTree') then
        bufferline_api.set_offset(0)
      end
    end,
  })
end

return {
  'romgrk/barbar.nvim',
  dependencies = { 'folke/which-key.nvim', 'kyazdani42/nvim-web-devicons' },
  config = config,
}
