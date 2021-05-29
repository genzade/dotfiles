-- Base16 config
vim.cmd "colorscheme base16-default-dark"

if vim.fn.filereadable("~/.vimrc_background") then
  vim.g.base16colorspace = 256
  vim.cmd("source ~/.vimrc_background")
  vim.cmd("hi LineNr guibg=none")
  vim.cmd("hi CursorLineNr guibg=none guifg=#98c379 gui=bold")
  vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end
