local config = function()
  local luasnip_status_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_status_ok then
    return
  end

  luasnip.filetype_extend("ruby", { "rails" })
end

return {
  "rafamadriz/friendly-snippets",
  requires = { "L3MON4D3/LuaSnip" },
  config = config,
}
