local config = function()
  local ok, mason_nls = pcall(require, 'mason-null-ls')
  if not ok then
    return
  end

  mason_nls.setup({ automatic_installation = true })
  -- mason_nls.check_install(true)
end

return {
  'jayp0521/mason-null-ls.nvim',
  after = { 'mason.nvim', 'null-ls.nvim' },
  config = config,
}
