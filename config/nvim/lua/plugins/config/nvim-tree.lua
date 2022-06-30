DEFAULT_OFFSET = 50

local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
  print("nvim tree not ok ..................................")
  return
end

function NvimTreeSmartToggle()
  local buffline_state = require("bufferline.state")

  -- TODO: refactor this, barbar plugin is using the same open/close functions
  local open_current_file_in_tree =
    function()
      buffline_state.set_offset(DEFAULT_OFFSET, "FileTree")
      nvim_tree.find_file(true)
    end

  local close_nvim_tree = function()
    buffline_state.set_offset(0)
    nvim_tree.close()
    -- vim.cmd("NvimTreeClose")
  end

  local view = require("nvim-tree.view")

  if view.win_open() then
    close_nvim_tree()
  else
    if vim.fn.expand("%") == "" then
      buffline_state.set_offset(DEFAULT_OFFSET, "FileTree")
      nvim_tree.open()
    else
      open_current_file_in_tree()
    end
  end
end

local function config()
  vim.api.nvim_exec(
    [[
      augroup NVIMTREE
        autocmd!
        autocmd Colorscheme * highlight! NvimTreeNormal guibg=#21252B guifg=#9da5b3
        autocmd ColorScheme * highlight! NvimTreeBg guibg=#2B4252
        autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg
      augroup END
    ]], false
  )

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<Leader>e", "<CMD>lua NvimTreeSmartToggle()<CR>", opts)

  vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌",
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    lsp = { hint = "", info = "", error = "",
            warning = "" },
  }

  nvim_tree.setup {
    disable_netrw = true,
    hijack_netrw = true,
    view = { width = DEFAULT_OFFSET },
    auto_close = true,
  }
end

return {
  setup = function(use)
    use {
      "kyazdani42/nvim-tree.lua",
      -- commit = "dc5eae65123c41908139cf6f095a062760604414",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = config,
      -- config = function()
      --   require"nvim-tree".setup {}
      -- end,
    }
  end,
}
