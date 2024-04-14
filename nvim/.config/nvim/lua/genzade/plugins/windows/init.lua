-- Resorting to using this autocmd because the plugin doesn't resize windows
-- automatically. (at lease not for me)
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.cmd('WindowsMaximize')
  end,
  group = augroup('AutoResizeWindows', { clear = true }),
})

local config = function()
  local width = 20

  vim.o.equalalways = false
  vim.o.winheight = width
  vim.o.winminheight = width
  vim.o.winminwidth = width
  vim.o.winwidth = width

  local ok, windows = pcall(require, 'windows')
  if not ok then
    return
  end

  windows.setup({
    autowidth = {
      enable = false,
      -- winwidth = 5,
      filetype = {
        help = 2,
      },
    },
    ignore = {
      buftype = { 'quickfix' },
      filetype = { 'NvimTree', 'neo-tree', 'undotree', 'gundo' },
    },
    animation = {
      enable = true,
      duration = 150,
      fps = 60,
      easing = 'in_out_sine',
    },
  })
end

return {
  'anuvyklack/windows.nvim',
  event = { 'VimResized' },
  cmd = { 'WindowsMaximize', 'WindowsEqualize' },
  dependencies = {
    'anuvyklack/middleclass',
    'anuvyklack/animation.nvim',
  },
  -- keys = {
  --   { '<leader>z', '<cmd>WindowsMaximize<CR>', desc = 'Zoom window' },
  -- },
  config = config,
}
