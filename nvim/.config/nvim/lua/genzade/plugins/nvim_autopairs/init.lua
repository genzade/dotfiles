local config = function()
  local has_npairs, npairs = pcall(require, 'nvim-autopairs')
  if not has_npairs then
    return
  end

  npairs.setup({ enable_check_bracket_line = false })

  -- TODO: sort this once completion plugins are installed
  local has_cmp, cmp = pcall(require, 'cmp')
  if not has_cmp then
    return
  end

  local npairs_cmp = require('nvim-autopairs.completion.cmp')

  cmp.event:on('confirm_done', npairs_cmp.on_confirm_done())
end

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  config = config,
}
