-- TODO: use which-key here
-- Keymaps
-- Leader
local map = vim.keymap.set

map("n", "<Space>", "<NOP>")

vim.g.mapleader = " "
vim.g.loaded_ruby_provider = 0

-- No more shift. one less keystroke
map("n", ";", ":", { noremap = true })
map("v", ";", ":", { noremap = true })

-- Remove highlight search
map("n", "<Leader><Space>", ":set hlsearch!<CR>")

-- Window naviagtion
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Tab navigation
map("n", "tn", ":tabnext<CR>")
map("n", "tp", ":tabprevious<CR>")
map("n", "tl", ":tablast<CR>")
map("n", "tf", ":tabfirst<CR>")
map("n", "tN", ":tabnew ", { noremap = true, silent = false })
map("n", "T", ":tabnew %<CR>")

-- copy filename to clipboard. TODO: refactor
map("n", "cp", ":let @*=expand('%')<CR>")

-- keep cursor position centred
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
