local function config()
  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  -- Buffer navigation
  map("n", "<TAB>", "<CMD>BufferNext<CR>", opts)
  map("n", "<S-TAB>", "<CMD>BufferPrevious<CR>", opts)
  map("n", "<A-x>", "<CMD>BufferClose<CR>", opts)

  -- Bar Bar/NvimTree integration
  local tree = {}

  tree.open = function()
    require"bufferline.state".set_offset(31, "FileTree")
    require"nvim-tree".find_file(true)
  end

  tree.close = function()
    require"bufferline.state".set_offset(0)
    require"nvim-tree".close()
  end

  return tree
end

return {
  setup = function(use)
    -- Tab line
    use {
      "romgrk/barbar.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = config,
    }
  end,
}
