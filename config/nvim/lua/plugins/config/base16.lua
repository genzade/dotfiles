local function config()
  vim.g.base16colorspace = 256

  if vim.fn.filereadable("~/.vimrc_background") then
    vim.cmd("source ~/.vimrc_background")
  else
    vim.cmd("colorscheme base16-default-dark")
  end

  vim.cmd("hi LineNr guibg=none")
  vim.cmd("hi CursorLineNr guibg=none guifg=#98c379 gui=bold")
  vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
end

return {
  setup = function(use)
    use { "chriskempson/base16-vim", config = config }
  end,
}
