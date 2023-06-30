local config = function()
  local ok, lualine = pcall(require, 'lualine')
  if not ok then
    print('lualine not ok ...........................')
    return
  end

  local lualine_defaults = require('genzade.plugins.lualine.defaults')

  lualine.setup({
    options = lualine_defaults.options,
    sections = {
      lualine_a = {
        lualine_defaults.mode,
      },
      lualine_b = {
        lualine_defaults.branch,
        lualine_defaults.diff,
      },
      lualine_c = {
        lualine_defaults.filename,
        lualine_defaults.diagnostics,
        lualine_defaults.macro_recording,
      },
      lualine_x = {
        lualine_defaults.fileformat,
        lualine_defaults.encoding,
        lualine_defaults.lsp_status,
        lualine_defaults.filetype,
      },
      lualine_y = {
        lualine_defaults.progress,
      },
      lualine_z = {
        lualine_defaults.scrollbar,
        lualine_defaults.location,
      },
    },
    extensions = lualine_defaults.extensions,
  })
end

return {
  'hoob3rt/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = config,
}
