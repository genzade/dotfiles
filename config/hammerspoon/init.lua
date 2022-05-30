-- Hammerspoon Config

local utils = require("utils")

-- toggle alacritty app with control + enter
hs.hotkey.bind(
  { "ctrl" }, "return", function()
    utils.toggleApp("alacritty")
  end
)
