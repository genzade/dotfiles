local function config()
  -- Treesitter config
  require"nvim-treesitter.configs".setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",
    highlight = { enable = true },
  }
end

return {
  setup = function(use)
    -- Treesitter language parser generator tool
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = config }
  end,
}
