local M = {}

M.ensure_lazy = function()
  local lazypath = DATA_PATH .. '/lazy/lazy.nvim'

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)
end

M.lazy_setup = function()
  local ok, lazy = pcall(require, 'lazy')
  if not ok then
    return
  end

  lazy.setup('genzade.plugins', {
    defaults = {
      -- lazy = true,
    },
    ui = {
      border = 'rounded',
    },
  })
end

M.setup = function()
  M.ensure_lazy()
  M.lazy_setup()
end

return M
