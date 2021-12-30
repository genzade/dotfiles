local function config()
  local colorizer_status_ok, colorizer = pcall(require, "colorizer")
  if not colorizer_status_ok then
    return
  end

  colorizer.setup()
end

return {
  setup = function(use)
    use { "norcalli/nvim-colorizer.lua", config = config }
  end,
}
