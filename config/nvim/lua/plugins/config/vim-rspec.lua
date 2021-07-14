local function config()
  -- Keybinding
  -- local map = vim.api.nvim_set_keymap
  -- local opts = { noremap = true, silent = true }

  -- Closer to the metal
  -- map("n", "<C-t>", "<CMD>lua require(\"FTerm\").toggle()<CR>", opts)
  -- map("t", "<C-t>", "<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>", opts)
  -- map("n", "<Leader>g", "<CMD>lua FTermLazyGit()<CR>", opts)
  -- vim.o.splitbelow = true
end

return {
  setup = function(use)
    use { "thoughtbot/vim-rspec", ft = "ruby", keys = "<Leader>t", config = config }
  end,
}
