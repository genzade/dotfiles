local config = function()
  local ok, telescope = pcall(require, 'telescope')
  if not ok then
    return
  end

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  telescope.load_extension('yaml_schema')

  which_key.register({
    ['<Leader>'] = {
      f = {
        name = '+Telescope',
        -- y = { tbuiltin.yaml_schema, 'Find [Y]aml schema' },
        y = {
          function()
            telescope.extensions.yaml_schema.yaml_schema()
          end,
          'Find [Y]aml schema'
        },
      },
    },
  }, { mode = 'n' })
end

return {
  'someone-stole-my-name/yaml-companion.nvim',
  lazy = true,
  ft = { 'yaml', 'json' },
  dependencies = {
    -- { 'b0o/schemastore.nvim', commit = '6f2ffb8420422db9a6c43dbce7227f0fdb9fcf75' },
    'folke/which-key.nvim',
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = config,
}
