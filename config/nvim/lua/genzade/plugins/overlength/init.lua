local config = function()
  -- Orverlength config
  local default_length = 100

  vim.g['overlength#default_overlength'] = 0 -- disable everywhere
  vim.g['overlength#highlight_to_end_of_line'] = false

  -- vim.fn["overlength#disable_filetypes"]({ "term" }) -- not working

  local ol_filetypes = {
    'css',
    'html',
    'javascript',
    'lua',
    'markdown',
    'ruby',
    'scss',
    'sh',
  }

  for _, ft in ipairs(ol_filetypes) do
    vim.fn['overlength#set_overlength'](ft, default_length)
  end
end

return { 'tjdevries/overlength.vim', config = config }
