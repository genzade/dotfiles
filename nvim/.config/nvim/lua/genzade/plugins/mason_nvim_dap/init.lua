local config = function()
  local ok, mason_nvim_dap = pcall(require, 'mason-nvim-dap')
  if not ok then
    return
  end

  mason_nvim_dap.setup({
    ensure_installed = {
      'codelldb', -- C/C++/Rust
    },
    handlers = {
      function(config)
        mason_nvim_dap.default_setup(config)
      end,
    },
  })
end

return {
  'jay-babu/mason-nvim-dap.nvim',
  dependencies = {
    'mfussenegger/nvim-dap',
    'mason.nvim',
  },
  config = config,
}
