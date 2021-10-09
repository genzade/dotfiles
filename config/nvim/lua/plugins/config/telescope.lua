local function config()
  -- Telescope config
  require('telescope').setup {
    defaults = {
      prompt_prefix = "$ ",
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case"
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        -- case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    }
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')

  local map = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  function CurrentBufferFuzzyFind()
    local opts = require("telescope.themes").get_ivy()

    require('telescope.builtin').current_buffer_fuzzy_find(opts)
  end

  map("n", "<Leader>ff", "<CMD>lua require('telescope.builtin').find_files()<CR>", opts)
  map("n", "<Leader>fb", "<CMD>lua require('telescope.builtin').buffers()<CR>", opts)
  map("n", "<Leader>fg", "<CMD>lua require('telescope.builtin').git_files()<CR>", opts)
  map("n", "<Leader>fs", "<CMD>lua require('telescope.builtin').grep_string()<CR>", opts)
  map("n", "<Leader>fl", "<CMD>lua require('telescope.builtin').live_grep()<CR>", opts)
  map("n", "<Leader>fc", "<CMD>lua CurrentBufferFuzzyFind()<CR>", opts)
end

return {
  setup = function(use)
    -- Telescope fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        {
          "nvim-telescope/telescope-fzf-native.nvim",
          run = "make", 
        },
      },
      config = config,
    }
  end,
}
