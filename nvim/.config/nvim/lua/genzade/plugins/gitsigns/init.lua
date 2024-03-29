local config = function()
  local set_hl = vim.api.nvim_set_hl
  local has_gitsigns, gitsigns = pcall(require, 'gitsigns')
  if not has_gitsigns then
    return
  end

  set_hl(0, 'SignColumn', { fg = 'NONE', bg = 'NONE' })
  set_hl(0, 'GitSignsAdd', { fg = 'Green', bg = 'NONE' })
  set_hl(0, 'GitSignsChange', { fg = 'Yellow', bg = 'NONE' })
  set_hl(0, 'GitSignsDelete', { fg = 'Red', bg = 'NONE' })
  set_hl(0, 'VertSplit', { fg = 'NONE', bg = 'NONE' })

  gitsigns.setup({
    signs = {
      add = {
        hl = 'GitSignsAdd',
        text = '+',
        numhl = 'GitSignsAddNr',
        linehl = 'GitSignsAddLn',
      },
      change = {
        hl = 'GitSignsChange',
        text = '│',
        -- text = "│ ",
        -- text = "▎",
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
      --   delete = {
      --     hl = "GitSignsDelete",
      --     text = "_",
      --     numhl = "GitSignsDeleteNr",
      --     linehl = "GitSignsDeleteLn",
      --   },
      --   topdelete = {
      --     hl = "GitSignsDelete",
      --     text = "‾",
      --     numhl = "GitSignsDeleteNr",
      --     linehl = "GitSignsDeleteLn",
      --   },
      changedelete = {
        hl = 'GitSignsChange',
        text = '-',
        numhl = 'GitSignsChangeNr',
        linehl = 'GitSignsChangeLn',
      },
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns
      local which_key_ok, which_key = pcall(require, 'which-key')
      if not which_key_ok then
        return
      end

      which_key.register({
        [']'] = {
          name = 'gitsigns',
          c = {
            function()
              if vim.wo.diff then
                return ']c'
              end

              vim.schedule(function()
                gs.next_hunk()
              end)

              return '<Ignore>'
            end,
            'Go to next hunk',
          },
        },
      }, { mode = 'n', buffer = bufnr })

      which_key.register({
        ['['] = {
          name = 'gitsigns',
          c = {
            function()
              if vim.wo.diff then
                return '[c'
              end

              vim.schedule(function()
                gs.prev_hunk()
              end)

              return '<Ignore>'
            end,
            'Go to previous hunk',
          },
        },
      }, { mode = 'n', buffer = bufnr })

      which_key.register({
        ['<Leader>'] = {
          h = {
            name = 'gitsigns',
            s = { gs.stage_hunk, '[S]tage hunk (visual)' },
            r = { gs.reset_hunk, '[R]eset hunk (visual)' },
          },
        },
      }, { mode = 'v', buffer = bufnr })

      which_key.register({
        ['<Leader>'] = {
          h = {
            name = 'gitsigns',
            s = { gs.stage_hunk, '[S]tage hunk' },
            r = { gs.reset_hunk, '[R]eset hunk' },
            u = { gs.undo_stage_hunk, '[U]ndo staged hunk' },
            R = { gs.reset_buffer, '[R]eset buffer' },
            p = { gs.preview_hunk, '[P]review hunk' },
            S = { gs.stage_buffer, '[S]tage buffer' },
            b = {
              function()
                gs.blame_line({ full = true })
              end,
              'Git [B]lame',
            },
            B = { gs.toggle_current_line_blame, 'Git [B]lame toggle' },
            d = { gs.diffthis, 'Git [D]iff' },
            D = {
              function()
                gs.diffthis('~')
              end,
              'Git [D]iff ~',
            },
          },
          l = { gs.toggle_deleted, 'Toggle de[L]eted' },
        },
      }, { mode = 'n', buffer = bufnr })

      which_key.register(
        { ih = { gs.select_hunk, 'Select [I]nner [H]unk' } },
        { mode = 'o', buffer = bufnr }
      )

      which_key.register(
        { ih = { gs.select_hunk, 'Select [I]nner [H]unk' } },
        { mode = 'x', buffer = bufnr }
      )
    end,
    -- watch_index = { interval = 1000 },
    current_line_blame = true,
    -- sign_priority = 6,
    -- update_debounce = 100,
    -- status_formatter = nil, -- Use default
    -- use_decoration_api = true,
    -- use_internal_diff = true, -- If luajit is present
  })
end

return {
  'lewis6991/gitsigns.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'folke/which-key.nvim' },
  event = 'BufRead',
  config = config,
}
