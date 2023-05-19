local config = function()
  local ok, sudoku = pcall(require, 'sudoku')
  if not ok then
    return
  end

  sudoku.setup({
    persist_settings = true,
    persist_games = true,
    default_mappings = true,
  })
end

return {
  'jim-fx/sudoku.nvim',
  event = 'VeryLazy',
  cmd = 'Sudoku',
  config = config,
}
