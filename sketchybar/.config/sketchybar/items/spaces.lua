local colors = require('colors')
local icons = require('icons')
local settings = require('settings')
local app_icons = require('helpers.app_icons')

local spaces = {}
local space_brackets = {}
local space_paddings = {}
local workspace_order = {}
local refresh_running = false
local refresh_queued = false
local queued_focused_workspace = nil

local function trim(value)
  if value == nil then
    return ''
  end
  return (value:gsub('^%s+', ''):gsub('%s+$', ''))
end

local function shell_escape(value)
  return "'" .. value:gsub("'", [["'"']]) .. "'"
end

local function workspace_key(workspace)
  local bytes = {}
  for i = 1, #workspace, 1 do
    bytes[#bytes + 1] = string.format('%02x', workspace:byte(i))
  end
  return table.concat(bytes)
end

local function reorder_aux_items(with_retry)
  local move_commands = {}
  local anchor_name = 'apple.logo'

  for _, workspace in ipairs(workspace_order) do
    local space = spaces[workspace]
    local padding = space_paddings[workspace]

    if space ~= nil then
      move_commands[#move_commands + 1] = 'sketchybar --move '
        .. shell_escape(space.name)
        .. ' after '
        .. shell_escape(anchor_name)
        .. ' >/dev/null 2>&1'
      anchor_name = space.name
    end

    if padding ~= nil then
      move_commands[#move_commands + 1] = 'sketchybar --move '
        .. shell_escape(padding.name)
        .. ' after '
        .. shell_escape(anchor_name)
        .. ' >/dev/null 2>&1'
      anchor_name = padding.name
    end
  end

  move_commands[#move_commands + 1] = 'sketchybar --query spaces.indicator >/dev/null 2>&1'
    .. ' && sketchybar --move spaces.indicator after '
    .. shell_escape(anchor_name)
    .. ' >/dev/null 2>&1'

  move_commands[#move_commands + 1] = 'sketchybar --query front_app >/dev/null 2>&1'
    .. " && sketchybar --move front_app after 'spaces.indicator' >/dev/null 2>&1"

  local command = table.concat(move_commands, '; ')
  sbar.exec(command)

  if with_retry then
    sbar.exec('sleep 0.05; ' .. command)
  end
end

local function same_workspace_order(left, right)
  if #left ~= #right then
    return false
  end

  for i = 1, #left, 1 do
    if left[i] ~= right[i] then
      return false
    end
  end

  return true
end

local function build_icon_line(apps)
  if apps == nil or #apps == 0 then
    return ' —'
  end

  local icon_line = ''
  for _, app in ipairs(apps) do
    local lookup = app_icons[app]
    local icon = (lookup == nil) and app_icons['Default'] or lookup
    icon_line = icon_line .. icon
  end
  return icon_line
end

local function set_focused_space(focused_workspace)
  local focused = trim(focused_workspace)
  if focused == '' then
    return
  end

  for _, workspace in ipairs(workspace_order) do
    local selected = workspace == focused
    if spaces[workspace] ~= nil then
      spaces[workspace]:set({
        icon = { highlight = selected },
        label = { highlight = selected },
        background = { border_color = selected and colors.black or colors.bg2 },
      })
    end
    if space_brackets[workspace] ~= nil then
      space_brackets[workspace]:set({
        background = { border_color = selected and colors.grey or colors.bg2 },
      })
    end
  end
end

local function update_focused_space(focused_workspace)
  local focused = trim(focused_workspace)
  if focused ~= '' then
    set_focused_space(focused)
    return
  end

  sbar.exec('aerospace list-workspaces --focused 2>/dev/null | head -n 1', function(result)
    set_focused_space(result)
  end)
end

local function remove_space(workspace)
  if spaces[workspace] ~= nil then
    sbar.remove(spaces[workspace].name)
    spaces[workspace] = nil
  end
  if space_brackets[workspace] ~= nil then
    sbar.remove(space_brackets[workspace].name)
    space_brackets[workspace] = nil
  end
  if space_paddings[workspace] ~= nil then
    sbar.remove(space_paddings[workspace].name)
    space_paddings[workspace] = nil
  end
end

local function create_space(workspace, monitor)
  local key = workspace_key(workspace)
  local space_name = 'space.' .. key
  local padding_name = 'space.padding.' .. key
  local bracket_name = 'space.bracket.' .. key

  local space = sbar.add('item', space_name, {
    icon = {
      font = {
        family = settings.font.numbers,
        style = settings.font.style_map['Black'],
        size = 12.0,
      },

      string = workspace,
      padding_left = 15,
      padding_right = 8,
      color = colors.white,
      highlight_color = colors.red,
    },
    label = {
      padding_right = 20,
      color = colors.grey,
      highlight_color = colors.red,
      -- font = 'sketchybar-app-font:Regular:16.0',
      font = settings.icons,
      y_offset = -1,
    },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      height = 26,
      border_color = colors.black,
    },
  })

  local space_bracket = sbar.add('bracket', bracket_name, { space.name }, {
    background = {
      color = colors.transparent,
      border_color = colors.bg2,
      height = 28,
      border_width = 2,
    },
  })

  local space_padding = sbar.add('item', padding_name, {
    script = '',
    width = settings.group_paddings,
  })

  spaces[workspace] = space
  space_brackets[workspace] = space_bracket
  space_paddings[workspace] = space_padding

  if monitor ~= nil and monitor ~= '' then
    space:set({ display = monitor })
    space_bracket:set({ display = monitor })
    space_padding:set({ display = monitor })
  end

  local escaped_workspace = shell_escape(workspace)
  space:subscribe('mouse.clicked', function(env)
    if env.BUTTON == 'right' then
      sbar.exec(
        'aerospace move-node-to-workspace --focus-follows-window '
          .. escaped_workspace
          .. ' >/dev/null 2>&1',
        function()
          update_focused_space(workspace)
        end
      )
    else
      sbar.exec('aerospace workspace ' .. escaped_workspace .. ' >/dev/null 2>&1', function()
        update_focused_space(workspace)
      end)
    end
  end)
end

local function sync_workspaces(callback)
  sbar.exec(
    "aerospace list-workspaces --empty no --monitor all --format '%{workspace}\t%{monitor-id}' 2>/dev/null",
    function(result)
      local seen = {}
      local ordered = {}
      local monitor_by_workspace = {}
      local structure_changed = false

      for line in string.gmatch(result, '[^\r\n]+') do
        local workspace, monitor = line:match('^([^\t]+)\t(.+)$')
        workspace = trim(workspace)
        monitor = trim(monitor)
        if workspace ~= '' then
          if not seen[workspace] then
            seen[workspace] = true
            ordered[#ordered + 1] = workspace
          end
          monitor_by_workspace[workspace] = monitor
        end
      end

      for workspace, _ in pairs(spaces) do
        if not seen[workspace] then
          remove_space(workspace)
          structure_changed = true
        end
      end

      for _, workspace in ipairs(ordered) do
        local monitor = monitor_by_workspace[workspace]
        if spaces[workspace] == nil then
          create_space(workspace, monitor)
          structure_changed = true
        elseif monitor ~= nil and monitor ~= '' then
          spaces[workspace]:set({ display = monitor })
          space_brackets[workspace]:set({ display = monitor })
          space_paddings[workspace]:set({ display = monitor })
        end
      end

      if not same_workspace_order(workspace_order, ordered) then
        structure_changed = true
      end
      print('New workspace order:', table.concat(ordered, ', '))
      workspace_order = ordered
      if structure_changed then
        reorder_aux_items(true)
      end

      if callback ~= nil then
        callback()
      end
    end
  )
end

local function update_windows_on_spaces(callback)
  sbar.exec(
    "aerospace list-windows --all --format '%{workspace}\t%{app-name}' 2>/dev/null",
    function(result)
      local apps_by_space = {}
      local seen_by_space = {}

      for workspace, _ in pairs(spaces) do
        apps_by_space[workspace] = {}
        seen_by_space[workspace] = {}
      end

      for line in string.gmatch(result, '[^\r\n]+') do
        local workspace, app = line:match('^([^\t]+)\t(.+)$')
        workspace = trim(workspace)
        app = trim(app)
        if apps_by_space[workspace] ~= nil and app ~= '' and not seen_by_space[workspace][app] then
          table.insert(apps_by_space[workspace], app)
          seen_by_space[workspace][app] = true
        end
      end

      sbar.animate('tanh', 10, function()
        for _, workspace in ipairs(workspace_order) do
          local space = spaces[workspace]
          if space ~= nil then
            space:set({ label = build_icon_line(apps_by_space[workspace]) })
          end
        end
      end)

      if callback ~= nil then
        callback()
      end
    end
  )
end

local function run_refresh(focused_workspace)
  refresh_running = true
  sync_workspaces(function()
    update_focused_space(focused_workspace)
    update_windows_on_spaces(function()
      refresh_running = false

      if refresh_queued then
        local queued = queued_focused_workspace
        refresh_queued = false
        queued_focused_workspace = nil
        sbar.exec('true', function()
          run_refresh(queued)
        end)
      end
    end)
  end)
end

local function refresh_spaces(focused_workspace)
  local focused = trim(focused_workspace)
  if focused == '' then
    focused = nil
  end

  if refresh_running then
    refresh_queued = true
    if focused ~= nil then
      queued_focused_workspace = focused
    end
    return
  end

  run_refresh(focused)
end

sbar.add('event', 'aerospace_workspace_change')
sbar.add('event', 'windows_on_spaces')
sbar.add('event', 'window_focus')

local space_focus_observer = sbar.add('item', {
  drawing = false,
  updates = true,
})

local space_window_observer = sbar.add('item', {
  drawing = false,
  updates = true,
  update_freq = 5,
})

local spaces_indicator = sbar.add('item', 'spaces.indicator', {
  padding_left = 0,
  padding_right = 0,
  icon = {
    padding_left = 8,
    padding_right = 9,
    color = colors.grey,
    string = icons.switch.on,
  },
  label = {
    width = 0,
    padding_left = 0,
    padding_right = 8,
    string = 'Spaces',
    color = colors.bg1,
  },
  background = {
    color = colors.with_alpha(colors.grey, 0.0),
    border_color = colors.with_alpha(colors.bg1, 0.0),
  },
})

space_focus_observer:subscribe('aerospace_workspace_change', function(env)
  refresh_spaces(env and env.FOCUSED or nil)
end)

space_window_observer:subscribe('aerospace_workspace_change', function(env)
  refresh_spaces(env and env.FOCUSED or nil)
end)

space_window_observer:subscribe('windows_on_spaces', function(env)
  refresh_spaces()
end)

space_window_observer:subscribe('front_app_switched', function(env)
  refresh_spaces()
end)

space_window_observer:subscribe('window_focus', function(env)
  refresh_spaces()
end)

space_window_observer:subscribe('routine', function(env)
  refresh_spaces()
end)

spaces_indicator:subscribe('swap_menus_and_spaces', function(env)
  local currently_on = spaces_indicator:query().icon.value == icons.switch.on
  spaces_indicator:set({
    icon = currently_on and icons.switch.off or icons.switch.on,
  })
end)

spaces_indicator:subscribe('mouse.entered', function(env)
  sbar.animate('tanh', 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 1.0 },
        border_color = { alpha = 1.0 },
      },
      icon = { color = colors.bg1 },
      label = { width = 'dynamic' },
    })
  end)
end)

spaces_indicator:subscribe('mouse.exited', function(env)
  sbar.animate('tanh', 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 0.0 },
        border_color = { alpha = 0.0 },
      },
      icon = { color = colors.grey },
      label = { width = 0 },
    })
  end)
end)

spaces_indicator:subscribe('mouse.clicked', function(env)
  sbar.trigger('swap_menus_and_spaces')
end)

refresh_spaces()
