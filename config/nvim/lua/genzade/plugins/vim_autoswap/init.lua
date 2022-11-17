local config = function()
  vim.g.title = 'on'
  vim.g.titlestring = 'on'
  vim.g.autoswap_detect_tmux = 1
end

return { 'gioele/vim-autoswap', config = config }
