local function config()
  -- Keybinding
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<Leader>d", "<Cmd>Dispatch ", opts)
end

return {
  setup = function(use)
    use {
      -- Support for neovim's terminal emulator and job control to dispatch.vim
      "radenling/vim-dispatch-neovim",
      requires = { "tpope/vim-dispatch", config = config },
    }
  end,
}
