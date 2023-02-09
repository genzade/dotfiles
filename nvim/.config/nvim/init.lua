local modules = { 'core', 'packer' }

for _, module in ipairs(modules) do
  require('genzade' .. '.' .. module).setup()
end
