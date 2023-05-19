local config = function()
  local defaults = require('genzade.plugins.vim_test.defaults')
  local fterm_runner = defaults.fterm_runner
  local tmux_runner = defaults.tmux_runner
  local select_strategy = defaults.select_strategy
  local select_rspec_executable = defaults.select_rspec_executable
  -- local fterm_runner = function(cmd)
  --   local ok, fterm = pcall(require, 'FTerm')
  --   if not ok then
  --     return
  --   end
  --   local default_dimmensions = require('genzade.plugins.fterm.defaults').default_dimmensions

  --   fterm.scratch({ cmd = cmd, dimensions = default_dimmensions })
  -- end

  -- local tmux_runner = function(cmd)
  --   local function sendCommand()
  --     vim.fn.jobstart({ 'tmux', 'send-key', '-t', '.2', cmd, 'Enter' })
  --   end

  --   vim.fn.jobstart({ 'tmux', 'list-panes' }, {
  --     stdout_buffered = true, -- get all stdout rather than line by line
  --     on_stdout = function(_, data)
  --       if #data >= 3 then -- at least 2 lines for pane info and 1 empty string for EOF
  --         sendCommand()
  --       else
  --         vim.fn.jobstart({ 'tmux', 'split-window' }, { on_stdout = sendCommand })
  --       end
  --     end,
  --   })
  -- end

  -- local select_strategy = function()
  --   local set_selection = function(item, _)
  --     vim.api.nvim_set_var('test#strategy', item)
  --   end

  --   vim.ui.select({ 'tmux', 'fterm' }, { prompt = 'Select Test strategy:' }, set_selection)
  -- end

  vim.api.nvim_create_user_command('TestStrategySelect', select_strategy, { force = true })

  vim.api.nvim_set_var('test#custom_strategies', {
    fterm = fterm_runner,
    tmux = tmux_runner,
  })

  -- vim.g['test#strategy'] = 'fterm'
  vim.api.nvim_set_var('test#strategy', 'fterm')

  -- javascript
  vim.api.nvim_set_var('test#javascript#jest#executable', 'yarn jest')

  -- local selector = function(choice, readable_file)
  --   local availability

  --   if vim.fn.filereadable(readable_file) == 1 then
  --     availability = ' (available)'
  --   else
  --     availability = ' (unavailable)'
  --   end

  --   return choice .. availability
  -- end

  -- local select_rspec_executable = function()
  --   local set_selection = function(item, _)
  --     vim.api.nvim_set_var('test#ruby#rspec#executable', item)
  --   end

  --   vim.ui.select({
  --     'default (bundle exec rspec)',
  --     selector('bin', 'bin/rspec'),
  --     selector('docker-compose', 'docker-compose.yml'),
  --   }, { prompt = 'Select RSpec executable:' }, function(choice)
  --     local runner_cmd
  --     local docker_prefix = 'docker-compose exec -it -e RAILS_ENV=test app '

  --     if string.match(choice, 'bin') then
  --       runner_cmd = 'bin/rspec'
  --     elseif string.match(choice, 'docker') then
  --       runner_cmd = docker_prefix .. 'bundle exec rspec'
  --     else
  --       runner_cmd = 'bundle exec rspec'
  --     end

  --     set_selection(runner_cmd)
  --   end)
  -- end

  vim.api.nvim_create_user_command(
    'TestRSpecExecutableSelect',
    select_rspec_executable,
    { force = true }
  )

  -- vim.g["test#strategy"] = "fterm"
  -- vim.g["test#strategy"] = "dispatch"
  -- vim.g['test#strategy'] = 'neovim'
  -- vim.g['test#preserve_screen'] = 1

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<Leader>'] = {
      t = {
        name = '+TestRunner',
        n = { '<CMD>TestNearest<CR>', 'Run [N]earest test' },
        f = { '<CMD>TestFile<CR>', 'Run test [F]ile' },
        s = { '<CMD>TestSuite<CR>', 'Run test [S]uite' },
        S = { '<CMD>TestStrategySelect<CR>', 'Select test [S]trategy' },
        r = { '<CMD>TestRSpecExecutableSelect<CR>', 'Select [R]Spec executable' },
        l = { '<CMD>TestLast<CR>', 'Run [L]ast test' },
        v = { '<CMD>TestVisit<CR>', 'Run test [V]isit' },
      },
    },
  }, { mode = 'n' })
end

return {
  'vim-test/vim-test',
  dependencies = { 'numtostr/FTerm.nvim', 'folke/which-key.nvim' },
  config = config,
}
