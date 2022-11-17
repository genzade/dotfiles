local M = {}

M.toggleApp = function(appName)
  local app = hs.application.find(appName)
  local appPath = '/Applications/' .. appName .. '.app'
  local appWindow = app:mainWindow()

  if appWindow and app:isFrontmost() then
    app:hide()
  else
    app = hs.application.launchOrFocus(appPath)
  end
end

return M
