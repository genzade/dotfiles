-- GIT PLUGIN begin
th.git = th.git
  or {
    -- Colours
    modified = ui.Style():fg('#0096DB'),
    added = ui.Style():fg('#239549'),
    untracked = ui.Style():fg('#B0B0B0'),
    ignored = ui.Style():fg('#B0B0B0'),
    deleted = ui.Style():fg('#D32752'),

    -- Unmerged
    updated = ui.Style():fg('#CD32C0'),

    -- Unmerged
    updated_sign = '',
  }

require('git'):setup({
  -- Order of status signs showing in the linemode
  order = 1500,
})
-- GIT PLUGIN end

-- FULL BORDER PLUGIN begin
require('full-border'):setup()
-- FULL BORDER PLUGIN end
