local config = function()
  local status_ok, copilot = pcall(require, 'copilot')
  if not status_ok then
    return
  end

  copilot.setup({
    panel = {
      border = 'rounded',
      enabled = true,
      position = 'bottom',
      size = 20,
      keymap = {
        accept = '<C-y>',
        decline = '<C-e>',
        dismiss = '<C-e>',
        -- jump_next = '<C-kPoint>',
        -- jump_prev = '<C-kComma>',
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = '<C-y>',
        decline = '<C-e>',
        dismiss = '<C-e>',
        -- next = '<C-kPoint>',
        -- prev = '<C-kComma>',
      },
    },
  })

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  local copilot_panel_ok, copilot_panel = pcall(require, 'copilot.panel')
  if not copilot_panel_ok then
    return
  end

  local copilot_suggestion_ok, copilot_suggestion = pcall(require, 'copilot.suggestion')
  if not copilot_suggestion_ok then
    return
  end

  which_key.register({
    ['<Leader>'] = {
      c = {
        name = '+Copilot',
        p = {
          function()
            copilot_panel.open({ position = 'bottom', ratio = 0.4 })
          end,
          'Open panel',
        },
        s = {
          function()
            copilot_suggestion.toggle_auto_trigger()
          end,
          'Toggle auto trigger',
        },
      },
    },
  }, { mode = 'n' })
end

return {
  'zbirenbaum/copilot.lua',
  requires = { 'folke/which-key.nvim' },
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = config,
}
