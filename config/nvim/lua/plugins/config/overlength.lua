local function config()
  -- Orverlength config
  local default_length = 100

  vim.g["overlength#default_overlength"] = 0 -- disable everywhere
  vim.g["overlength#highlight_to_end_of_line"] = false

  -- vim.fn["overlength#disable_filetypes"]({ "term" }) -- not working

  vim.fn["overlength#set_overlength"]("lua", default_length)
  vim.fn["overlength#set_overlength"]("ruby", default_length)
  vim.fn["overlength#set_overlength"]("sh", default_length)
end

return {
  setup = function(use)
    -- Highlight column when limit reached
    use { "tjdevries/overlength.vim", config = config }
  end,
}
