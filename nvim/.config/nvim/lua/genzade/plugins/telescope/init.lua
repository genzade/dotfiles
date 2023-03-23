local config = function()
  local has_telescope, telescope = pcall(require, 'telescope')
  if not has_telescope then
    print('telescope not ok ..................................')
    return
  end
  telescope.setup({
    defaults = {
      prompt_prefix = '$ ',
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        -- case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
  })
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  telescope.load_extension('fzf')
  telescope.load_extension('notify')
  telescope.load_extension('neoclip')

  local has_tbuiltin, tbuiltin = pcall(require, 'telescope.builtin')
  if not has_tbuiltin then
    print('telescope builtin not ok ...........................')
    return
  end

  local which_key_ok, which_key = pcall(require, 'which-key')
  if not which_key_ok then
    return
  end

  which_key.register({
    ['<Leader>'] = {
      f = {
        name = '+Telescope',
        B = { tbuiltin.buffers, 'Find opened [B]uffers' },
        b = {
          function()
            local ok, theme = pcall(require, 'telescope.themes')
            if not ok then
              return
            end

            tbuiltin.current_buffer_fuzzy_find(theme.get_ivy())
          end,
          'Search current [B]uffer',
        },
        C = { tbuiltin.command_history, 'Search [C]ommand history' },
        c = { tbuiltin.commands, 'Search available [C]ommands' },
        f = { tbuiltin.find_files, 'Find [F]ile' },
        g = { tbuiltin.git_files, 'Find [G]it files' },
        G = { tbuiltin.git_commits, 'Search [G]it commits' },
        h = { tbuiltin.help_tags, 'Search [H]elp docs' },
        l = { tbuiltin.live_grep, '[L]ive search string' },
        L = { tbuiltin.resume, 'Resume [L]ast search' },
        r = { tbuiltin.registers, 'Search [R]egisters' },
        R = { tbuiltin.resume, '[R]esume previous search' },
        s = { tbuiltin.grep_string, '[S]earch word under cursor' },
        p = { tbuiltin.neoclip, 'Search yank/[P]aste registers' }, -- not working
        m = { tbuiltin.marks, 'Search [M]arks' }, -- not working
        n = {
          function()
            telescope.extensions.notify.notify()
          end,
          'Search [N]otification',
        },
      },
    },
  }, { mode = 'n' })

  which_key.register({
    ['<Leader>'] = {
      f = {
        name = '+Telescope (x)',
        s = {
          function()
            local visual_selection = function()
              -- Get visually selected text

              -- TODO: make this work with new nvim_cmd api
              vim.cmd('noau normal! "vy"')
              -- vim.api.nvim_cmd(
              --   { cmd = "noau normal!", args = { "\"vy\"" } }, {}
              -- )

              local text = vim.fn.getreg('v')

              vim.fn.setreg('v', {})

              text = string.gsub(text, '\n', '')

              if string.len(text) == 0 then
                text = nil
              end

              return text
            end

            tbuiltin.grep_string({ search = visual_selection() })
          end,
          'Find visually [S]elected word/s',
        },
      },
    },
  }, { mode = 'x' })
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'folke/which-key.nvim',
    'rcarriga/nvim-notify',
  },
  event = 'VimEnter',
  config = config,
}
