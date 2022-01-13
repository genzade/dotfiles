local function config()
  local has_npairs, npairs = pcall(require, "nvim-autopairs")
  if not has_npairs then
    return
  end

  npairs.setup({ enable_check_bracket_line = false })

  local has_cmp, cmp = pcall(require, "cmp")
  if not has_cmp then
    return
  end

  local npairs_cmp = require("nvim-autopairs.completion.cmp")

  cmp.event:on(
    "confirm_done",
    npairs_cmp.on_confirm_done({ map_char = { tex = "" } })
  )
end

return {
  setup = function(use)
    use { "windwp/nvim-autopairs", config = config }
  end,
}
