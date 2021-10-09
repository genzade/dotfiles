local function config()
  -- vim.api.nvim_set_var('projectionist_heuristics', {
  --   ['*.rb'] = {
  --     ['app/*.rb'] = {
  --       ['alternate'] = 'spec/{}_spec.rb',
  --       ['type'] = 'source'
  --     },
  --     ['spec/*_spec.rb'] = {
  --       ['alternate'] = 'app/{}.rb',
  --       ['type'] = 'test',
  --     },
  --   },
  -- }

  -- have a look at https://github.com/veezus/clean-living/blob/24a4271a6c/.projections.json
  vim.api.nvim_exec([[
    augroup PROJECTIONIST
    autocmd!
    let args = {}
    let args["app/*.rb"]       = { "alternate": "spec/{}_spec.rb" }
    let args["spec/*_spec.rb"] = { "alternate": "app/{}.rb" }
    autocmd User ProjectionistDetect call projectionist#append(getcwd(), args)
    augroup END
  ]], false)

  local map = vim.api.nvim_set_keymap
  local opts = { silent = true }

  map('n', '<leader>aa', [[:A<cr>]], opts)
  map('n', '<leader>av', [[:AV<cr>]], opts)
  map('n', '<leader>as', [[:AS<cr>]], opts)
end

return {
  setup = function(use)
    use {
      "tpope/vim-projectionist",
      config = config,
    }
  end,
}
