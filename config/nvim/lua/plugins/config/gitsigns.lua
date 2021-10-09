local function config()
  -- GitSigns config
  require("gitsigns").setup({
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "+",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      --   change = {
      --     hl = "GitSignsChange",
      --     text = "│",
      --     numhl = "GitSignsChangeNr",
      --     linehl = "GitSignsChangeLn",
      --   },
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
        hl = "GitSignsChange",
        text = "-",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
    -- numhl = false,
    -- linehl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ["n ]c"] = {
        expr = true,
        "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'",
      },
      ["n [c"] = {
        expr = true,
        "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'",
      },

      -- ["n <leader>hs"] = "<cmd>lua require\"gitsigns\".stage_hunk()<CR>",
      -- ["n <leader>hu"] = "<cmd>lua require\"gitsigns\".undo_stage_hunk)<CR>",
      -- ["n <leader>hr"] = "<cmd>lua require\"gitsigns\".reset_hunk()<CR>",
      -- ["n <leader>hR"] = "<cmd>lua require\"gitsigns\".reset_buffer()<CR>",
      -- ["n <leader>hp"] = "<cmd>lua require\"gitsigns\".preview_hunk()<CR>",
      ["n <leader>b"] = "<cmd>lua require\"gitsigns\".blame_line(true)<CR>",

      -- -- Text objects
      -- ["o ih"] = ":<C-U>lua require\"gitsigns\".select_hunk()<CR>",
      -- ["x ih"] = ":<C-U>lua require\"gitsigns\".select_hunk()<CR>",
    },
    -- watch_index = { interval = 1000 },
    current_line_blame = true,
    -- sign_priority = 6,
    -- update_debounce = 100,
    -- status_formatter = nil, -- Use default
    -- use_decoration_api = true,
    -- use_internal_diff = true, -- If luajit is present
  })

  vim.cmd("highlight GitSignsAdd guifg=green ctermbg=none")
  vim.cmd("highlight GitSignsChange guifg=yellow ctermbg=none")
  vim.cmd("highlight GitSignsDelete guifg=red ctermbg=none")
  vim.cmd("highlight clear SignColumn ctermbg=none")
  vim.cmd("highlight VertSplit guibg=NONE ctermbg=NONE")
end

return {
  setup = function(use)
    -- Git signs
    use {
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = config,
    }
  end,
}
