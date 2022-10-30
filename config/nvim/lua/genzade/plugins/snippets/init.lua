local config = function()
  local luasnip_status_ok, luasnip = pcall(require, "luasnip")
  if not luasnip_status_ok then
    return
  end

  luasnip.config.set_config(
    { history = true, updateevents = "TextChanged,TextChangedI" }
  )

  require("luasnip/loaders/from_vscode").lazy_load()
end

return {
 "L3MON4D3/LuaSnip",
 config = config,
}
