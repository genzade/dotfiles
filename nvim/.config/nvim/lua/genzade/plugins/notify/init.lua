local config = function()
  local notify_ok, notify = pcall(require, 'notify')
  if not notify_ok then
    return
  else
    vim.notify = notify
  end

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<Leader>'] = {
      n = {
        name = '+Notify',
        c = {
          function()
            notify.dismiss()
          end,
          '[C]lose Notification',
        },
      },
    },
  }, { mode = 'n' })

  notify.setup({
    stages = 'static',
    background_colour = 'FloatShadow',
    timeout = 3000,
    fps = 60,
    icons = {
      ERROR = '',
      WARN = '',
      INFO = '',
      DEBUG = '',
      TRACE = '✎',
    },
  })

  vim.lsp.handlers['window/showMessage'] = function(_, method, params, _)
    -- map both hint and info to info?
    local severity = { 'error', 'warn', 'info', 'info' }

    notify(method.message, severity[params.type])
  end
end

return {
  'rcarriga/nvim-notify',
  dependencies = { 'folke/which-key.nvim' },
  config = config,
}
