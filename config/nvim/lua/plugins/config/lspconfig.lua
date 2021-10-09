-- local function config()
-- end
return {
  setup = function(use)
    -- Config for builtin LSP client
    use {
      "neovim/nvim-lspconfig",
      -- config = config,
    }
  end,
}
