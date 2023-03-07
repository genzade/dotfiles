local config = function()
  local tmux_nav_ok, tmux_nav = pcall(require, 'nvim-tmux-navigation')
  if not tmux_nav_ok then
    return
  end

  tmux_nav.setup({ disable_when_zoomed = true })

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<C-h>'] = { tmux_nav.NvimTmuxNavigateLeft, 'Navigate Left' },
    ['<C-j>'] = { tmux_nav.NvimTmuxNavigateDown, 'Navigate Down' },
    ['<C-k>'] = { tmux_nav.NvimTmuxNavigateUp, 'Navigate Up' },
    ['<C-l>'] = { tmux_nav.NvimTmuxNavigateRight, 'Navigate Right' },
  }, { mode = 'n' })
end

-- this needs to be tested properly post migration with tmux
return {
  'alexghergh/nvim-tmux-navigation',
  dependencies = { 'folke/which-key.nvim' },
  config = config,
}
