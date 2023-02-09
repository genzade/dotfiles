local config = function()
  local projections = require('genzade.plugins.projectionist.projections')
  -- have a look at https://github.com/veezus/clean-living/blob/24a4271a6c/.projections.json
  vim.g.projectionist_heuristics = {
    -- Rails
    ['Gemfile&config/boot.rb&config/application.rb'] = projections.ruby_on_rails,
    -- Generic ruby project
    ['Gemfile&!config/boot.rb&!spec/rails_helper.rb'] = projections.ruby_generic,
  }

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<Leader>'] = {
      a = {
        name = '+Projectionist',
        a = { '<CMD>A<CR>', 'Open alternate file' },
        v = { '<CMD>AV<CR>', 'Open alternate file (split vert)' },
        s = { '<CMD>AS<CR>', 'Open alternate file (split hor)' },
        t = { '<CMD>AT<CR>', 'Open alternate file (new tab)' },
      },
    },
  }, { mode = 'n' })
end

return {
  'tpope/vim-projectionist',
  requires = { 'folke/which-key.nvim' },
  config = config,
}
