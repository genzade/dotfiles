local modules = { 'core', 'lazy' }

for _, module in ipairs(modules) do
  require('genzade' .. '.' .. module).setup()
end
