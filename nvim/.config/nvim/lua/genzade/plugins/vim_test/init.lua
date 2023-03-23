local config = function()
  local fterm_runner = function(cmd)
    local ok, fterm = pcall(require, 'FTerm')
    if not ok then
      return
    end
    local default_dimmensions = require('genzade.plugins.fterm.defaults').default_dimmensions

    fterm.scratch({ cmd = cmd, dimensions = default_dimmensions })
  end

  local tmux_runner = function(cmd)
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

  local select_strategy = function()
    local set_selection = function(item, _)
      vim.g['test#strategy'] = item
    end

    vim.ui.select({ 'tmux', 'fterm' }, { prompt = 'Select Test strategy:' }, set_selection)
  end

  vim.api.nvim_create_user_command('TestStrategySelect', select_strategy, { force = true })

  vim.g['test#custom_strategies'] = {
    fterm = fterm_runner,
    tmux = tmux_runner,
  }

  vim.g['test#strategy'] = 'fterm'

  -- javascript
  vim.g['test#javascript#jest#executable'] = 'yarn jest'

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
