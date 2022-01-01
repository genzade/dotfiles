local function config()
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end
  local formatting = null_ls.builtins.formatting
  local luaformatter_config = HOME .. "/dotfiles/lua/luaformatter/config.yml"
  local on_attach = require"plugins.config.lsp.defaults".on_attach

  null_ls.setup({
    sources = {
      formatting.lua_format.with({
        extra_args = { "--in-place", "--config=" .. luaformatter_config },
      }),
      formatting.prettier.with({
        extra_args = { "--quote-props preserve", "--parser json5" },
      }),
      formatting.rubocop,
    },
    on_attach = on_attach,
  })
end

return {
  setup = function(use)
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      config = config,
    }
  end,
}
