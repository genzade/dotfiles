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

local efm = {}
efm.languages = { lua = { luaformatter }, sh = { shellcheck, shfmt } }

require"lspconfig".efm.setup {
  init_options = { documentFormatting = true, codeAction = true },
  filetypes = vim.tbl_keys(efm.languages),
  settings = { rootMarkers = { ".git/", vim.fn.getcwd() }, languages = efm.languages },
}
