-- Treesitter config
require"nvim-treesitter.configs".setup {
  -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = { "bash", "lua", "ruby" },
  highlight = { enable = true },
}
