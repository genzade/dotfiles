local config = function()
  local mason_ok, mason = pcall(require, 'mason')
  if not mason_ok then
    return
  end

  mason.setup({
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })
end

return {
  'williamboman/mason.nvim',
  priority = 1000,
  config = config,
}
