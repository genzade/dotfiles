local config = function()
  local ok, nvim_tree = pcall(require, "nvim-tree")

  if not ok then
    -- replace with notify
    print("nvim tree not ok ..................................")
    return
  end

  local augroup = vim.api.nvim_create_augroup
  local autocmd = vim.api.nvim_create_autocmd
  local set_hl = vim.api.nvim_set_hl
  local colorscheme_group = augroup("NVIMTREE", { clear = false })

  -- TODO: possibly move to after folder
  autocmd(
    "Colorscheme", {
      pattern = "*",
      group = colorscheme_group,
      callback = function()
        set_hl(0, "NvimTreeNormal", { bg = "#21252B", fg = "#9da5b3" })
        set_hl(0, "NvimTreeBg", { bg = "#2B4252", fg = nil })
      end,
    }
  )

  autocmd(
    "FileType", {
      pattern = "NvimTree",
      group = colorscheme_group,
      callback = function()
        vim.api.nvim_win_set_option(
          0, "winhighlight", "Normal:NvimTreeBg"
        )
      end,
    }
  )

  local which_key_ok, which_key = pcall(require, "which-key")
  if not which_key_ok then
    return
  end

  which_key.register(
    {
      ["<Leader>"] = {
        name = "NvimTree",
        e = { "<CMD>NvimTreeFindFileToggle<CR>", "NvimTree toggle" },
      },
    }, { mode = "n" }
  )
  nvim_tree.setup(
    {
      disable_netrw = true,
      ignore_ft_on_setup = { "startify", "dashboard" },
      view = {
        width = FILETREE_WIDTH,
        preserve_window_proportions = true,
        mappings = {
          custom_only = false,
          list = {
            { key = "C", action = "cd" },
            { key = "R", action = "refresh" },
            { key = "u", action = "dir_up" },
          },
        },
      },
    }
  )
end

return {
  "kyazdani42/nvim-tree.lua",
  requires = {
    { "folke/which-key.nvim" },
    { "kyazdani42/nvim-web-devicons", opt = true },
  },
  cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
  event = "BufEnter",
  config = config,
}
