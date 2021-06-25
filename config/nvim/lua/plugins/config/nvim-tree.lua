local function config()
  -- Toggle file tree
  function NvimTreeSmartToggle()
    local nvim_tree = require "nvim-tree"

    local open_current_file_in_tree = function()
      nvim_tree.find_file(true)
    end

    local close_nvim_tree = function()
      nvim_tree.close()
    end

    local view = require "nvim-tree.view"

    if view.win_open() then
      close_nvim_tree()
    else
      open_current_file_in_tree()
    end
  end

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<Leader>e", "<CMD>lua NvimTreeSmartToggle()<CR>", opts)

  -- function NvimTreeXdgOpen()
  --   local lib = require "nvim-tree.lib"
  --   local node = lib.get_node_at_cursor()
  --   if node then
  --     vim.fn.jobstart("xdg-open '" .. node.absolute_path .. "' &", { detach = true })
  --   end
  -- end
end

return {
  setup = function(use)
    use {
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = config,
    }
  end,
}
