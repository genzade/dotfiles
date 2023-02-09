local config = function()
  local has_fwatch, fwatch = pcall(require, 'fwatch')
  if not has_fwatch then
    return
  end

  local Path = require('plenary.path')
  local vimrc_bg_file = Path:new({ HOME, '.vimrc_background' })
  local nvim_cmd = vim.api.nvim_cmd
  local set_hl = vim.api.nvim_set_hl

  if vimrc_bg_file:exists() then
    nvim_cmd({ cmd = 'source', args = { vimrc_bg_file.filename } }, {})
    -- vim.cmd([[source ]] .. vimrc_bg_file.filename)

    fwatch.watch(vimrc_bg_file.filename, {
      on_event = vim.schedule_wrap(function(_, events, unwatch)
        if events.change then
          nvim_cmd({ cmd = 'source', args = { vimrc_bg_file.filename } }, {})
          -- vim.cmd([[source ]] .. vimrc_bg_file.filename)
          -- vim.cmd([[PackerCompile]])
          nvim_cmd({ cmd = 'PackerCompile' }, {})
        end

        unwatch()
      end),
    })
  else
    nvim_cmd({ cmd = 'colorscheme', args = { 'base16-ayu-dark' } }, {})
  end

  set_hl(0, 'LineNr', { bg = 'NONE' })
  set_hl(0, 'CursorLineNr', { bg = 'NONE', fg = '#98c379', bold = true })
  set_hl(0, 'Normal', { bg = 'NONE', ctermbg = 'NONE' })

  -- example of how to ovverride any colorus, below shows how to ovverride
  -- some highlight groups
  -- (see https://github.com/RRethy/nvim-base16/blob/b1b9fe2c91/lua/base16-colorscheme.lua)
  local has_colors, base16 = pcall(require, 'base16-colorscheme')
  if not has_colors then
    return
  end
  local colors = base16.colors
  local hi = base16.highlight

  hi.SignColumn = {
    guifg = colors.base04,
    guibg = 'NONE',
    gui = nil,
    guisp = nil,
  }
end

return {
  'RRethy/nvim-base16',
  requires = { { 'nvim-lua/plenary.nvim' }, { 'rktjmp/fwatch.nvim' } },
  config = config,
}
