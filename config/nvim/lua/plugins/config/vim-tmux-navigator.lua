local function config()
  vim.g.tmux_navigator_disable_when_zoomed = 1

  -- Keybinding
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", opts)
  map("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", opts)
  map("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", opts)
  map("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", opts)
end

return {
  setup = function(use)
    use { "christoomey/vim-tmux-navigator", config = config }
  end,
}
