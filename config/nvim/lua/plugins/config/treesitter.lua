local function config()
  local has_ts_config, ts_config = pcall("nvim-treesitter.configs")
  if not has_ts_config then
    return
  end

  ts_config.setup {
    -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = "maintained",
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return {
  setup = function(use)
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = config,
    }
  end,
}
