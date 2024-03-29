local config = function()
  local ok, startup = pcall(require, 'startup')
  if not ok then
    return
  end

  local headers = require('genzade.plugins.startup.content_bank').headers

  startup.setup({
    -- every line should be same width without escaped \
    header = {
      type = 'text',
      oldfiles_directory = false,
      align = 'center',
      fold_section = false,
      title = 'Header',
      margin = 5,
      content = function()
        -- show a different header every time
        math.randomseed(os.clock())
        local index = math.random() * #headers

        return headers[math.floor(index) + 1]
      end,
      highlight = 'Statement',
      default_color = '',
      oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
      type = 'mapping',
      oldfiles_directory = false,
      align = 'center',
      fold_section = false,
      title = 'Basic Commands',
      margin = 5,
      content = {
        { '  Find File',    'Telescope find_files',              'ff' },
        { '  New File',     "lua require('startup').new_file()", 'N' },
        { '  Find Word',    'Telescope live_grep',               'fl' },
        { '  Recent Files', 'Telescope oldfiles',                'of' },
        { '  Colorschemes', 'Telescope colorscheme',             'cs' },
        { '  Quit NVIM',    'qa',                                'q' },
      },
      highlight = 'String',
      default_color = '',
      oldfiles_amount = 0,
    },
    footer1 = {
      type = 'text',
      oldfiles_directory = false,
      align = 'center',
      fold_section = false,
      title = 'Footer',
      margin = 5,
      -- content = { "startup.nvim" },
      content = require('startup.functions').quote(),
      highlight = 'Number',
      default_color = '',
      oldfiles_amount = 0,
    },
    footer2 = {
      type = 'text',
      content = function()
        local clock = ' ' .. os.date('%H:%M')
        local date = ' ' .. os.date('%d-%m-%y')
        return { clock .. ' ' .. date }
      end,
      oldfiles_directory = false,
      align = 'center',
      fold_section = false,
      title = '',
      margin = 5,
      highlight = 'TSString',
      default_color = '#FFFFFF',
      oldfiles_amount = 10,
    },
    options = {
      mapping_keys = true,
      cursor_column = 0.5,
      empty_lines_between_mappings = true,
      disable_statuslines = true,
      paddings = { 1, 3, 3, 1 },
    },
    mappings = {
      execute_command = '<CR>',
      open_file = 'o',
      open_file_split = '<c-o>',
      open_section = '<TAB>',
      open_help = '?',
    },
    colors = { background = '#1f2227', folded_section = '#56b6c2' },
    parts = { 'header', 'body', 'footer1', 'footer2' },
  })
end

return {
  'startup-nvim/startup.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = config,
}
