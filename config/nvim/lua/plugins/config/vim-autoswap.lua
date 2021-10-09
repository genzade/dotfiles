local function config()
  -- Buffer navigation
  -- local o = vim.o

  vim.g.title = "on"
  vim.g.titlestring = "on"
  vim.g.autoswap_detect_tmux = 1
end

return {
  setup = function(use)
    -- Tab line
    use { "gioele/vim-autoswap", config = config }
  end,
}
