return {
  setup = function(use)
    require"plugins.config.lspconfig".setup(use)
    -- require"plugins.config.lspinstall".setup(use)

    -- WIP
    -- require"plugins.config.lsp".setup(use)

    require"plugins.config.barbar".setup(use)
    require"plugins.config.base16".setup(use)
    require"plugins.config.completion".setup(use)
    require"plugins.config.formatter".setup(use)
    require"plugins.config.fterm".setup(use)
    require"plugins.config.gitsigns".setup(use)
    require"plugins.config.kommentary".setup(use)
    require"plugins.config.lualine".setup(use)
    require"plugins.config.nvim-tree".setup(use)
    require"plugins.config.overlength".setup(use)
    require"plugins.config.snippets".setup(use)
    require"plugins.config.telescope".setup(use)
    require"plugins.config.treesitter".setup(use)
    require"plugins.config.vim-autoswap".setup(use)
    require"plugins.config.vim-dispatch".setup(use)
    require"plugins.config.vim-projectionist".setup(use)
    require"plugins.config.vim-test".setup(use)
    require"plugins.config.vim-tmux-navigator".setup(use)
  end,
}
