local config = function()
  local ok, mason_nls = pcall(require, 'mason-null-ls')
  if not ok then
    return
  end

  mason_nls.setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = true,
  })
  -- mason_nls.check_install(true)
end

return {
  'jayp0521/mason-null-ls.nvim',
  dependencies = { 'mason.nvim', 'null-ls.nvim' },
  config = config,
}
