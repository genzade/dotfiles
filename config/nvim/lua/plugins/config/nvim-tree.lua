function NvimTreeSmartToggle()
  local buffline_state = require("bufferline.state")
  local nvim_tree = require("nvim-tree")

  local open_current_file_in_tree = function()
    buffline_state.set_offset(31, "FileTree")
    nvim_tree.find_file(true)
  end

  local close_nvim_tree = function()
    buffline_state.set_offset(0)
    nvim_tree.close()
  end

  local view = require("nvim-tree.view")

  if view.win_open() then
    close_nvim_tree()
  else
    if vim.fn.expand('%') == "" then
      buffline_state.set_offset(31, "FileTree")
      nvim_tree.open()
    else
      open_current_file_in_tree()
    end
  end
end

return {
  setup = function(use)
    use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map("n", "<Leader>e", "<CMD>lua NvimTreeSmartToggle()<CR>", opts)

        vim.api.nvim_exec([[
          augroup NVIMTREE
            autocmd!
            autocmd Colorscheme * highlight NvimTreeNormal guibg=#21252B guifg=#9da5b3
          augroup END
        ]], false)

        vim.g.nvim_tree_icons = {
          default        = '',
          symlink        = '',
          git = {
            unstaged     = "✗",
            staged       = "✓",
            unmerged     = "",
            renamed      = "➜",
            untracked    = "★",
            deleted      = "",
            ignored      = "◌"
          },
          folder = {
            arrow_open   = "",
            arrow_closed = "",
            default      = "",
            open         = "",
            empty        = "",
            empty_open   = "",
            symlink      = "",
            symlink_open = "",
          },
          lsp = {
            hint         = "",
            info         = "",
            error        = "",
            warning      = "",
          }
        }

        require'nvim-tree'.setup {
          disable_netrw = true,
          hijack_netrw = true,
        }
      end,
    }
  end,
}
