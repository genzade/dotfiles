local config = function()
  local ok, kommentary_config = pcall(require, 'kommentary.config')
  if not ok then
    return
  end

  kommentary_config.configure_language('default', { prefer_single_line_comments = true })
  kommentary_config.use_extended_mappings()

  vim.api.nvim_set_hl(0, 'Comment', { italic = true })
end

return { 'b3nj5m1n/kommentary', config = config }
