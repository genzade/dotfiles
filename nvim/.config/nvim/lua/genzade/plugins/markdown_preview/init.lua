return {
  'iamcco/markdown-preview.nvim',
  -- build = 'cd app && yarn install',
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  cmd = 'MarkdownPreview',
  config = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
  -- "iamcco/markdown-preview.nvim",
  -- build = function()
  --   vim.fn["mkdp#util#install"]()
  -- end,
  -- ft = "markdown",
}
