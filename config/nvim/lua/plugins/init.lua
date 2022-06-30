local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<Leader><CR>", ":source % | PackerCompile<CR>", opts)

local function ensure_packer()
  local fn = vim.fn
  local install_path = DATA_PATH ..
                         "/site/pack/packer/start/packer.nvim"
  local execute = vim.api.nvim_command

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system(
      {
        "git",
        "clone",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
    )
    execute "packadd packer.nvim"
  end
end

local function packer_setup()
  require("packer").startup(
    {
      function(use)
        use "wbthomason/packer.nvim"

        use {
          "kyazdani42/nvim-tree.lua",
          -- cmd = "NvimTreeSmartToggle",
          requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
            opt = true,
          },
          config = function()
            local nvim_tree_status_ok, nvim_tree = pcall(
                                                     require,
                                                     "nvim-tree"
                                                   )

            if not nvim_tree_status_ok then
              print("nvim tree not ok")
              return
            end

            DEFAULT_OFFSET = 50

            -- -- function NvimTreeSmartToggle()
            -- local buffline_ok, buffline_state = pcall(
            --                                       require,
            --                                       "bufferline.state"
            --                                     )
            -- if not buffline_ok then
            --   print("buffline not ok")
            --   return
            -- end

            -- -- TODO: refactor this, barbar plugin is using the same open/close functions
            -- local open_current_file_in_tree = function()
            --   buffline_state.set_offset(DEFAULT_OFFSET, "FileTree")
            --   -- nvim_tree.find_file(true)

            --   -- vim.cmd("NvimTreeFindFileToggle")
            -- end

            -- local close_nvim_tree = function()
            --   buffline_state.set_offset(0)
            --   -- nvim_tree.close()
            --   -- vim.cmd("NvimTreeClose")
            --   -- vim.cmd("NvimTreeFindFileToggle")
            -- end

            -- local view_ok, view = pcall(require, "nvim-tree.view")
            -- if not view_ok then
            --   print("nvim tree view not ok")
            --   return
            -- end

            -- if view.win_open() then
            --   -- close_nvim_tree()
            --   buffline_state.set_offset(DEFAULT_OFFSET, "FileTree")
            -- else
            --   -- open_current_file_in_tree()
            --   buffline_state.set_offset(0)
            -- end
            -- -- end

            -- vim.api.nvim_command(
            --   [[command! NvimTreeSmartToggle lua NvimTreeSmartToggle()]]
            -- )

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

            -- -- local map = vim.api.nvim_set_keymap
            -- -- local opts = { noremap = true, silent = true }
            -- map(
            --   "n", "<Leader>e", [[<cmd>NvimTreeSmartToggle<CR>]],
            --   { noremap = true, silent = true }
            -- )

            vim.api.nvim_set_keymap(
              "n", "<Leader>e", [[<cmd>NvimTreeFindFileToggle<CR>]],
              { noremap = true, silent = true }
            )

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
              lsp = {
                hint = "",
                info = "",
                error = "",
                warning = "",
              },
            }
            nvim_tree.setup {
              disable_netrw = true,
              hijack_netrw = true,
              view = { width = DEFAULT_OFFSET },
              auto_close = true,
            }

            -- local tree ={}
            -- tree.open = function ()
            --    require'bufferline.state'.set_offset(31, 'FileTree')
            --    require'nvim-tree'.find_file(true)
            -- end

            -- tree.close = function ()
            --    require'bufferline.state'.set_offset(0)
            --    require'nvim-tree'.close()
            -- end

            -- return tree
          end,
        }

        require("plugins.config").setup(use)
      end,
      config = {
        display = {
          open_fn = function()
            return require("packer.util").float({ border = "single" })
          end,
        },
      },
    }
  )
end

local function setup()
  ensure_packer()
  packer_setup()
end

return { setup = setup }
