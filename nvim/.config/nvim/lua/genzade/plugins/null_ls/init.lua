local config = function()
  local ok, nls = pcall(require, 'null-ls')
  if not ok then
    return
  end

  local stylua_config = CONFIG_PATH .. '/stylua.toml'
  local code_actions = nls.builtins.code_actions
  local completion = nls.builtins.completion
  local diagnostics = nls.builtins.diagnostics
  local formatting = nls.builtins.formatting
  local command_resolver = require('null-ls.helpers.command_resolver')
  local on_attach = require('genzade.plugins.lspconfig.defaults').on_attach

  nls.setup({
    sources = {
      -- code_actions.proselint,
      -- code_actions.ltrs,
      code_actions.shellcheck,
      -- completion.luasnip,
      completion.spell.with({ filetypes = { 'markdown', 'txt' } }),
      diagnostics.codespell.with({ filetypes = { 'markdown', 'txt' } }),
      diagnostics.markdownlint,
      diagnostics.hadolint, -- for docker
      diagnostics.rubocop.with({
        prefer_local = true,
        -- command = 'bundle',
        -- args = vim.list_extend({ 'exec', 'rubocop' }, nls.builtins.diagnostics.rubocop._opts.args),
      }),
      diagnostics.yamllint,
      diagnostics.shellcheck,
      formatting.stylua.with({
        extra_args = { '--config-path', vim.fn.expand(stylua_config) },
      }),
      formatting.prettier.with({
        extra_args = { '--quote-props preserve', '--parser json5' },
        dynamic_command = command_resolver.from_node_modules(),
      }),
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
      formatting.erb_lint,
      formatting.rubocop.with({
        prefer_local = true,
        -- command = 'bundle',
        -- args = vim.list_extend({ 'exec', 'rubocop' }, nls.builtins.formatting.rubocop._opts.args),
      }),
      formatting.rome,
      formatting.yq,
      -- formatting.stylelint, --not needed
      -- formatting.terraform_fmt,
    },
    on_attach = on_attach,
  })
end

return {
  'jose-elias-alvarez/null-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = config,
}
