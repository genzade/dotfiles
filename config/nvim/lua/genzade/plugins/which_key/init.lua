local config = function()
  local which_key_ok, which_key = pcall(require, "which-key")
  if not which_key_ok then
    return
  end

  which_key.setup()
end

return { "folke/which-key.nvim", config = config }
