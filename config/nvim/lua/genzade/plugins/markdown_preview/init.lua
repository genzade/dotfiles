return {
  "iamcco/markdown-preview.nvim",
  run = "cd app && yarn install",
  cmd = "MarkdownPreview",
  setup = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  opt = true,
}
