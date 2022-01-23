-- local function config()
--   -- config
-- end
--
return {
  setup = function(use)
    use {
      "iamcco/markdown-preview.nvim",
      run = "cd app && yarn install",
      cmd = "MarkdownPreview",
      ft = "markdown",
      opt = true,
    }
  end,
}
