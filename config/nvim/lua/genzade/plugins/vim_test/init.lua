local config = function()
  -- vim.g["test#strategy"] = "fterm"
  -- vim.g["test#strategy"] = "dispatch"
  vim.g["test#strategy"] = "neovim"

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

return { "vim-test/vim-test", config = config }
