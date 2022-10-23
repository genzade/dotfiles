local function config()
  local g = vim.g
  local headers = require("plugins.config.dashboard.headers").headers

  -- give me a random header everytime
  g.dashboard_custom_header = headers[math.random(#headers)]

  g.dashboard_custom_section = {
    newfile = {
      description = { "  New File          " },
      command = "DashboardNewFile",
    },
    findfile = {
      description = { "  Find File         " },
      command = "DashboardFindFile",
    },
    last_session = {
      description = { "  Load Last Session " },
      command = "SessionLoad",
    },
    history = {
      description = { "  History           " },
      command = "DashboardFindHistory",
    },
    file_explorer = {
      description = { "  Open File Explorer" },
      command = "NvimTreeOpen",
    },
    zedit_config = {
      description = { "  Edit config      " },
      command = "Telescope fd cwd=$HOME/dotfiles/",
    },
  }

  g.dashboard_default_executive = "telescope"

  g.dashboard_custom_footer = {
    "'Do one thing, and do it well.' Unix philosophy",
  }
end

return {
  setup = function(use)
    use { "glepnir/dashboard-nvim", config = config }
  end,
}
