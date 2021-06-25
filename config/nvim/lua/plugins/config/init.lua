return {
  setup = function(use)
    require"plugins.config.lspconfig".setup(use)
    require"plugins.config.lspinstall".setup(use)

    require"plugins.config.barbar".setup(use)
    require"plugins.config.base16".setup(use)
    require"plugins.config.fterm".setup(use)
    require"plugins.config.gitsigns".setup(use)
    require"plugins.config.kommentary".setup(use)
    require"plugins.config.lualine".setup(use)
    require"plugins.config.nvim-tree".setup(use)
    require"plugins.config.overlength".setup(use)
    require"plugins.config.telescope".setup(use)
    require"plugins.config.treesitter".setup(use)
  end
}
