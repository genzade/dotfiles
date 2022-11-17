local M = {}

M.setup = function()
  local core_modules = { 'autocmds', 'globals', 'keymaps', 'settings' }

  for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, 'genzade' .. '.' .. 'core' .. '.' .. module)
    if not ok then
      error('Error loading ' .. module .. '\n\n' .. err)
    end
  end
end

return M
