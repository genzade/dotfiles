local config = function()
  local default_dimmensions = {
    height = 0.9,
    width = 0.9,
    x = 0.5,
    y = 0.5,
  }

  local ok, fterm = pcall(require, "FTerm")
  if not ok then
    print("fterm not ok .....................................")
    return
  end

  fterm.setup(
    {
      dimensions = default_dimmensions,
      border = "single", -- or 'double'
    }
  )

  local which_key_ok, which_key = pcall(require, "which-key")
  if not which_key_ok then
    return
  end

  which_key.register(
    { ["<C-t>"] = { fterm.toggle, "Toggle built in terminal" } },
    { mode = "t" }
  )

  _G.lazygit_toggle = function()
    local term = require("FTerm.terminal")
    local lazygit = term:new():setup{
      dimensions = default_dimmensions,
      border = "single", -- or 'double'
      cmd = "lazygit",
    }

    vim.api.nvim_get_current_buf()

    lazygit:toggle()
  end

  -- -- Create LazyGit Terminal
  -- local term = require "FTerm.terminal"
  -- local lazy = term:new():setup(
  --                {
  --     dimensions = default_dimmensions,
  --     border = "single", -- or 'double'
  --     cmd = "lazygit",
  --   }
  --              )

  -- local function is_installed(exe)
  --   return vim.fn.executable(exe) == 1
  -- end

  -- -- Use this to toggle gitui in a floating terminal
  -- function _G.__fterm_lazygit()
  --   if is_installed "lazygit" ~= true then
  --     print "Please install lazygit. Check documentation for more information"
  --     return
  --   end

  --   lazy:toggle()
  -- end

  which_key.register(
    {
      ["<C-t>"] = { fterm.toggle, "Toggle built in terminal" },
      -- LazyGit integration
      ["<Leader>"] = {
        g = {
          "<CMD>lua _G.lazygit_toggle()<CR>",
          "Open Lazygit terminal",
        },
      },
    }
  )

  -- local map = vim.api.nvim_set_keymap
  -- local opts = { noremap = true, silent = true }

  -- map(
  --   "n", "<Leader>g", function()
  --     local term = require("FTerm.terminal")
  --     local lazygit = term:new()

  --     vim.api.nvim_get_current_buf()
  --     lazygit:setup(
  --       {
  --         dimensions = default_dimmensions,
  --         border = "single", -- or 'double'
  --         cmd = "lazygit",
  --       }
  --     )
  --   end, opts
  -- )

  -- might not be need post migration
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE" })
end

return {
  "numtostr/FTerm.nvim",
  requires = { "folke/which-key.nvim" },
  config = config,
}
