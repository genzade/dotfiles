local config = function()
  local hop_ok, hop = pcall(require, 'hop')
  if not hop_ok then
    return
  end

  hop.setup({ keys = 'etovxqpdygfblzhckisuran' })

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<Leader>'] = {
      s = {
        name = '+Hop',
        l = { '<CMD>HopWordCurrentLine<CR>', 'Hop [L]ine' },
        L = { '<CMD>HopAnywhereCurrentLine<CR>', 'Hop anywhere [L]ine' },
        w = { '<CMD>HopWord<CR>', 'Hop [W]indow' },
        W = { '<CMD>HopAnywhere<CR>', 'Hop anywhere [W]indow' },
      },
    },
  }, { mode = 'n' })

  which_key.register({
    ['<Leader>'] = {
      s = {
        name = '+Hop',
        l = { '<CMD>HopWordCurrentLine<CR>', 'Hop [L]ine' },
        L = { '<CMD>HopAnywhereCurrentLine<CR>', 'Hop anywhere [L]ine' },
        w = { '<CMD>HopWord<CR>', 'Hop [W]indow' },
        W = { '<CMD>HopAnywhere<CR>', 'Hop anywhere [W]indow' },
      },
    },
  }, { mode = 'v' })

  which_key.register({
    ['<Leader>'] = {
      s = {
        name = '+Hop',
        l = { '<CMD>HopWordCurrentLine<CR>', 'Hop [L]ine' },
        L = { '<CMD>HopAnywhereCurrentLine<CR>', 'Hop anywhere [L]ine' },
        w = { '<CMD>HopWord<CR>', 'Hop [W]indow' },
        W = { '<CMD>HopAnywhere<CR>', 'Hop anywhere [W]indow' },
      },
    },
  }, { mode = 'o' })

  -- uncomment to setup more advanced features
  -- local directions = require("hop.hint").HintDirection
  -- vim.keymap.set(
  --   "", "f", function()
  --     hop.hint_char1(
  --       {
  --         direction = directions.AFTER_CURSOR,
  --         current_line_only = true,
  --       }
  --     )
  --   end, { remap = true }
  -- )
  -- vim.keymap.set(
  --   "", "F", function()
  --     hop.hint_char1(
  --       {
  --         direction = directions.BEFORE_CURSOR,
  --         current_line_only = true,
  --       }
  --     )
  --   end, { remap = true }
  -- )
  -- vim.keymap.set(
  --   "", "t", function()
  --     hop.hint_char1(
  --       {
  --         direction = directions.AFTER_CURSOR,
  --         current_line_only = true,
  --         hint_offset = -1,
  --       }
  --     )
  --   end, { remap = true }
  -- )
  -- vim.keymap.set(
  --   "", "T", function()
  --     hop.hint_char1(
  --       {
  --         direction = directions.BEFORE_CURSOR,
  --         current_line_only = true,
  --         hint_offset = 1,
  --       }
  --     )
  --   end, { remap = true }
  -- )
end

return {
  'phaazon/hop.nvim',
  branch = 'v2',
  dependencies = { 'folke/which-key.nvim' },
  config = config,
}
