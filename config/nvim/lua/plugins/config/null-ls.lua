local function config()
  local null_ls_status_ok, null_ls = pcall(require, "null-ls")
  if not null_ls_status_ok then
    return
  end
  local formatting = null_ls.builtins.formatting
  local lua_fmt_file = HOME .. "/dotfiles/lua/luaformatter/config.yml"
  local on_attach = require"plugins.config.lsp.defaults".on_attach

  null_ls.setup(
    {
      sources = {
        formatting.lua_format.with(
          { extra_args = { "--in-place", "--config=" .. lua_fmt_file } }
        ),
        formatting.prettier.with(
          {
            extra_args = { "--quote-props preserve", "--parser json5" },
          }
        ),
        formatting.shfmt.with(
          {
            extra_args = {
              "-i=2", -- Indent: 0 for tabs (default), >0 for number of spaces.
              "-bn", -- binary ops like && and | may start a line
              "-ci", -- switch cases will be indented
              "-s",
              "-sr", -- keep column alignment paddings
              "-kp", -- function opening braces are placed on a separate line
            },
          }
        ),
      },
      on_attach = on_attach,
    }
  )
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
