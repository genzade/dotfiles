local function config()
  vim.g["test#strategy"] = "dispatch"

  -- Keybinding
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  -- Test nearest test
  map("n", "<leader>tn", "<CMD>TestNearest<CR>", opts)
  -- Test file
  map("n", "<leader>tf", "<CMD>TestFile<CR>", opts)
  -- Test suite
  map("n", "<leader>ts", "<CMD>TestSuite<CR>", opts)
  -- Test last test run
  map("n", "<leader>tl", "<CMD>TestLast<CR>", opts)
  -- Test visit
  map("n", "<leader>tv", "<CMD>TestVisit<CR>", opts)
end

return {
  setup = function(use)
    use { "vim-test/vim-test", config = config }
  end,
}
