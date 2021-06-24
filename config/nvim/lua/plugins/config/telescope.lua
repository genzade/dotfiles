local function config()
  -- Telescope config
  require("telescope").setup({
    extensions = {
      fzy_native = { override_generic_sorter = false, override_file_sorter = true },
    },
  })

  require("telescope").load_extension("fzy_native")

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  map("n", "<Leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>", opts)
  map("n", "<Leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>", opts)
  map("n", "<Leader>fg", "<CMD>lua require('telescope.builtin').git_files()<CR>", opts)
  map("n", "<Leader>fs", "<CMD>lua require('telescope.builtin').grep_string()<CR>", opts)
  map("n", "<Leader>fl", "<CMD>lua require('telescope.builtin').live_grep()<CR>", opts)
end

return {
  setup = function(use)
    -- Telescope fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzy-native.nvim" },
      },
      config = config,
    }
  end,
}
