-- Leader
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Space>", "<NOP>", opts)

vim.g.mapleader = " "
vim.g.loaded_ruby_provider = 0

-- No more shift. one less keystroke
map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })

-- Remove highlight search
map("n", "<Leader><Space>", ":set hlsearch!<CR>", opts)

-- Window naviagtion
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Tab navigation
map("n", "tn", ":tabnext<CR>", opts)
map("n", "tp", ":tabprevious<CR>", opts)
map("n", "tN", ":tabnew ", { noremap = true, silent = false })
map("n", "T", ":tabnew %<CR>", opts)

-- copy filename to clipboard
map("n", "cp", ":let @*=expand('%')<CR>", opts)
