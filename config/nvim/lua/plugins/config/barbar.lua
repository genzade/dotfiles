-- Buffer navigation
vim.api.nvim_set_keymap("n", "<TAB>", "<CMD>BufferNext<cr>",
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-TAB>", "<CMD>BufferPrevious<cr>",
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", "<CMD>BufferClose<cr>",
                        { noremap = true, silent = true })

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
