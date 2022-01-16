local function config()
  -- have a look at https://github.com/veezus/clean-living/blob/24a4271a6c/.projections.json
  vim.g.projectionist_heuristics = {
    ["Gemfile"] = {
      ["app/*.rb"] = {
        ["alternate"] = "spec/{}_spec.rb",
        ["type"] = "source",
      },
      ["spec/*_spec.rb"] = {
        ["alternate"] = "app/{}.rb",
        ["type"] = "test",
      },
      ["app/views/*.html.erb"] = {
        ["alternate"] = "spec/views/{}.html.erb_spec.rb",
        ["type"] = "source",
      },
      ["app/components/*.rb"] = {
        ["type"] = "component",
        ["alternate"] = {
          "app/components/{}.html.erb",
          "spec/components/{}_spec.rb",
        },
      },
      ["app/components/*.html.erb"] = {
        ["type"] = "component",
        ["alternate"] = {
          "spec/components/{}_spec.rb",
          "app/components/{}.rb",
        },
      },
      ["spec/components/*_spec.rb"] = {
        ["type"] = "component",
        ["alternate"] = {
          "app/components/{}.rb",
          "app/components/{}.html.erb",
        },
      },
      ["spec/views/*.html.erb_spec.rb"] = {
        ["alternate"] = "app/views/{}.html.erb",
        ["type"] = "test",
      },
      ["lib/*.rb"] = {
        ["alternate"] = "spec/lib/{}_spec.rb",
        ["type"] = "source",
      },
      ["spec/lib/{}_spec.rb"] = {
        ["alternate"] = "lib/{}.rb",
        ["type"] = "test",
      },
      ["lib/tasks/*.rake"] = {
        ["alternate"] = "spec/lib/tasks/{}_spec.rb",
        ["type"] = "source",
      },
      ["spec/lib/tasks/{}_spec.rb"] = {
        ["alternate"] = "lib/tasks/{}.rake",
        ["type"] = "test",
      },
    },
  }

  local map = vim.api.nvim_set_keymap
  local opts = { silent = true }

  map("n", "<leader>aa", [[:A<CR>]], opts)
  map("n", "<leader>av", [[:AV<CR>]], opts)
  map("n", "<leader>as", [[:AS<CR>]], opts)
  map("n", "<leader>at", [[:AT<CR>]], opts)
end

return {
  setup = function(use)
    use { "tpope/vim-projectionist", config = config }
  end,
}
