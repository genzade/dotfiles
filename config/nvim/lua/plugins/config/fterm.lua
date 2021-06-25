local function config()
  -- Floating Terminal config
  require"FTerm".setup({
    dimensions = { height = 0.9, width = 0.9, x = 0.5, y = 0.5 },
    border = "single", -- or 'double'
  })

  -- LazyGit integration
  local term = require("FTerm.terminal")
  local lazygit = term:new()

  lazygit:setup({
    dimensions = { height = 0.9, width = 0.9, x = 0.5, y = 0.5 },
    border = "single", -- or 'double'
    cmd = "lazygit",
  })

  function FTermLazyGit()
    vim.api.nvim_get_current_buf()
    lazygit:toggle()
  end

  -- Keybinding
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  -- Closer to the metal
  map("n", "<C-t>", "<CMD>lua require(\"FTerm\").toggle()<CR>", opts)
  map("t", "<C-t>", "<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>", opts)
  map("n", "<Leader>g", "<CMD>lua FTermLazyGit()<CR>", opts)

  vim.cmd("highlight VertSplit guibg=NONE ctermbg=NONE")
end

return {
  setup = function(use)
    -- Terminal Integration WIP
    use {
      "numtostr/FTerm.nvim",
      config = config,
    }
  end
}
