local M = {}

M.fterm_runner = function(cmd)
  local ok, fterm = pcall(require, 'FTerm')
  if not ok then
    return
  end

  local default_dimmensions = require('genzade.plugins.fterm.defaults').default_dimmensions

  fterm.scratch({ cmd = cmd, dimensions = default_dimmensions })
end

M.tmux_runner = function(cmd)
  local function sendCommand()
    vim.fn.jobstart({ 'tmux', 'send-key', '-t', '.2', cmd, 'Enter' })
  end

  vim.fn.jobstart({ 'tmux', 'list-panes' }, {
    stdout_buffered = true, -- get all stdout rather than line by line
    on_stdout = function(_, data)
      if #data >= 3 then -- at least 2 lines for pane info and 1 empty string for EOF
        sendCommand()
      else
        vim.fn.jobstart({ 'tmux', 'split-window' }, { on_stdout = sendCommand })
      end
    end,
  })
end

M.select_strategy = function()
  local set_selection = function(item, _)
    vim.api.nvim_set_var('test#strategy', item)
  end

  vim.ui.select({ 'tmux', 'fterm' }, { prompt = 'Select Test strategy:' }, set_selection)
end

-- TODO: this should be refactored
M.select_rspec_executable = function()
  local selector = function(choice, readable_file)
    local availability

    if vim.fn.filereadable(readable_file) == 1 then
      availability = ' (available)'
    else
      availability = ' (unavailable)'
    end

    return choice .. availability
  end

  local set_selection = function(item, _)
    vim.api.nvim_set_var('test#ruby#rspec#executable', item)
  end

  vim.ui.select({
    'default (bundle exec rspec)',
    selector('bin', 'bin/rspec'),
    selector('docker-compose', 'docker-compose.yml'),
  }, { prompt = 'Select RSpec executable:' }, function(choice)
    local runner_cmd
    local docker_prefix = 'docker-compose exec -it -e RAILS_ENV=test app '

    if string.match(choice, 'bin') then
      runner_cmd = 'bin/rspec'
    elseif string.match(choice, 'docker') then
      runner_cmd = docker_prefix .. 'bundle exec rspec'
    else
      runner_cmd = 'bundle exec rspec'
    end

    set_selection(runner_cmd)
  end)
end

return M
