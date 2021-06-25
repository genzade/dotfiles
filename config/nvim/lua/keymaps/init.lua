-- Leader
local map = vim.api.nvim_set_keymap

map("n", "<Space>", "<NOP>", { noremap = true, silent = true })

vim.g.mapleader = " "

-- No more shift. one less keystroke
map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })

-- Remove highlight search
map("n", "<Leader><Space>", ":set hlsearch!<CR>", { noremap = true, silent = true })

-- Window naviagtion
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })
