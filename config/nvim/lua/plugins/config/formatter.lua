vim.api.nvim_exec([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost *.js,*.html,*.css,*.scss,*.rb,*.lua FormatWrite
  augroup END
]], true)

return {
  setup = function(use)
    use {
      "mhartington/formatter.nvim",
      config = function()
        local formatter_status_ok, formatter = pcall(require, "formatter")
        if not formatter_status_ok then
          return
        end

        local prettier_config = function()
          return {
            exe = "prettier",
            args = {
              "--stdin-filepath",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
              "--quote-props preserve",
              "--parser json5",
            },
            stdin = true,
          }
        end

        local luaformat_config = function()
          local luaformatter_configfile = HOME .. "/dotfiles/lua/luaformatter/config.yml"
          return {
            exe = "lua-format", -- might prepend `bundle exec `
            args = { "--in-place", "--config=" .. luaformatter_configfile },
            stdin = true,
          }
        end

        local rubocop_config = function()
          return {
            exe = "bundle exec rubocop", -- might prepend `bundle exec `
            args = {
              "--auto-correct",
              "--stdin",
              "%:p",
              "2>/dev/null",
              "|",
              "awk 'f; /^====================$/{f=1}'",
            },
            stdin = true,
          }
        end

        formatter.setup({
          filetype = {
            css = { prettier_config },
            html = { prettier_config },
            javascript = { prettier_config },
            json = { prettier_config },
            scss = { prettier_config },
            typescript = { prettier_config },
            lua = { luaformat_config },
            ruby = { rubocop_config },
          },
        })
      end,
    }
  end,
}
