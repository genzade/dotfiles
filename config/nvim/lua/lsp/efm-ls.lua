-- EFM language server
-- LUA
local luaformatter_config = vim.fn.expand("$HOME/dotfiles/lua/luaformatter/config.yml")
local luaformatter = {
  formatCommand = "lua-format --in-place --config=" .. luaformatter_config,
  formatStdin = true,
}

-- BASH
local shellcheck = {
  lintSource = "shellcheck",
  lintCommand = "shellcheck -f gcc -x",
  lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" },
}

-- used `go get -u github.com/mvdan/sh/cmd/shfmt` to install
local shfmt = { formatCommand = "shfmt -i=0 -ci -s -bn -sr -kp", formatStdin = true }
-- local shfmt = { formatCommand = "shfmt -ci -s -bn", formatStdin = true } --------- NOT WORKING

-- local prettier = {
--   formatCommand = "prettier --stdin-filepath ${INPUT}",
--   formatStdin = true
-- }

-- local eslint = {
--   lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--   lintStdin = true,
--   lintFormats = {"%f:%l:%c: %m"},
--   lintIgnoreExitCode = true,
--   formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--   formatStdin = true
-- }

local languages = {
  sh = { shellcheck, shfmt },
  bash = { shellcheck, shfmt },
  lua = { luaformatter },
  -- vue = {prettier, eslint},
  -- typescript = {prettier, eslint},
  -- javascript = {prettier, eslint},
  -- typescriptreact = {prettier, eslint},
  -- javascriptreact = {prettier, eslint},
  -- svelte = {prettier, eslint},
  -- yaml = {prettier},
  -- json = {prettier},
  -- html = {prettier},
  -- scss = {prettier},
  -- css = {prettier},
  -- markdown = {prettier},
}

return {
  init_options = {
    documentFormatting = true,
    hover = true,
    documentSymbol = true,
    codeAction = true,
    completion = true,
  },
  filetypes = vim.tbl_keys(languages),
  settings = { rootMarkers = { ".git/", vim.fn.getcwd() }, languages = languages },
}
