local config = function()
  local colorizer_status_ok, colorizer = pcall(require, "colorizer")
  if not colorizer_status_ok then
    return
  end

  colorizer.setup({ "*", css = { rgb_fn = true } })
end

return { "norcalli/nvim-colorizer.lua", config = config }
