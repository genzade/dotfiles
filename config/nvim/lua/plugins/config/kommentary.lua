vim.cmd(
  [[
    augroup ItalicComments
      autocmd!
      autocmd ColorScheme * highlight Comment gui=italic
      autocmd ColorScheme * highlight Comment cterm=italic
    augroup END
  ]]
)

local function config()
  require("kommentary.config").configure_language(
    "default", { prefer_single_line_comments = true }
  )
end

return {
  setup = function(use)
    -- Commenting abilities
    use { "b3nj5m1n/kommentary", config = config }
  end,
}
