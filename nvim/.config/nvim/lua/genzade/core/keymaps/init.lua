-- TODO: use which-key here
-- Keymaps
-- Leader
local map = vim.keymap.set

map('n', '<Space>', '<NOP>')

vim.g.mapleader = ' '
vim.g.loaded_ruby_provider = 0

-- No more shift. one less keystroke
map('n', ';', ':', { noremap = true })
map('v', ';', ':', { noremap = true })

-- Remove highlight search
map('n', '<Leader><Space>', ':set hlsearch!<CR>')

-- Tab navigation
map('n', 'tn', vim.cmd.tabnext)
map('n', 'tp', vim.cmd.tabprevious)
map('n', 'tl', vim.cmd.tablast)
map('n', 'tf', vim.cmd.tabfirst)
map('n', 'tx', vim.cmd.tabclose)
map('n', 'to', vim.cmd.tabonly)
map('n', 'tN', ':tabnew ', { noremap = true, silent = false })
map('n', 'T', ':tabnew %<CR>')

-- something to consider
-- gt    -   go to next tab
-- gT    -   go to previous tab
-- {i}gt -   go to tab in position i
-- 1gt   -   go to first tab
-- 1gT   -   go to last tab

-- copy filename to clipboard
map('n', 'cp', function()
  local path = vim.fn.expand('%')
  vim.fn.setreg('+', path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end)

-- keep cursor position centred
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')
