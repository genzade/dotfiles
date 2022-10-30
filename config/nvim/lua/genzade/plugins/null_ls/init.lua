local config = function()
  local ok, nls = pcall(require, "null-ls")
  if not ok then
    return
  end

  local lua_fmt_file = CONFIG_PATH .. "/luaformatter.yml"
  local code_actions = nls.builtins.code_actions
  local completion = nls.builtins.completion
  local diagnostics = nls.builtins.diagnostics
  local formatting = nls.builtins.formatting
  local command_resolver = require("null-ls.helpers.command_resolver")

  nls.setup(
    {
      sources = {
        -- code_actions.proselint,
        code_actions.ltrs,
        code_actions.shellcheck,
        completion.luasnip,
        completion.spell.with({ filetypes = { "markdown", "txt" } }),
        diagnostics.codespell.with(
          { filetypes = { "markdown", "txt" } }
        ),
        diagnostics.markdownlint,
        diagnostics.hadolint, -- for docker
        diagnostics.rubocop,
        diagnostics.yamllint,
        diagnostics.shellcheck,
        formatting.lua_format.with(
          { extra_args = { "--in-place", "--config=" .. lua_fmt_file } }
        ),
        formatting.prettier.with(
          {
            extra_args = { "--quote-props preserve", "--parser json5" },
            dynamic_command = command_resolver.from_node_modules(),
          }
        ),
        formatting.shellharden,
        -- formatting.shfmt.with(
        --   {
        --     extra_args = {
        --       "-i=2", -- Indent: 0 for tabs (default), >0 for number of spaces.
        --       "-bn", -- binary ops like && and | may start a line
        --       "-ci", -- switch cases will be indented
        --       "-s",
        --       "-sr", -- keep column alignment paddings
        --       "-kp", -- function opening braces are placed on a separate line
        --     },
        --   }
        -- ),
        formatting.rubocop, -- ruby formatter
        formatting.stylelint,
        formatting.terraform_fmt,
      },
    }
  )
end

return {
  "jose-elias-alvarez/null-ls.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = config,
}
