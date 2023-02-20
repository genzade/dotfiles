local config = function()
  vim.g.copilot_filetypes = { xml = false }
  -- vim.g.copilot_no_tab_map = true

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
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = '<C-a>',
        decline = '<C-e>',
        dismiss = '<C-e>',
        next = '<C-.>',
        prev = '<C-,>',
      },
    },
  })
end

return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = config,
}
