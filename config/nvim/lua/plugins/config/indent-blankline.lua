vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

local function config()
  local has_indent_blankline, indent_blankline =
    pcall(require, "indent_blankline")

  if not has_indent_blankline then
    return
  end

  indent_blankline.setup(
    {
      -- char = "▏",
      show_first_indent_level = false,
      show_end_of_line = true,
      buftype_exclude = { "terminal", "packer", "nofile" },
      filetype_exclude = {
        "NvimTree",
        "dashboard",
        "help",
        "lspinfo",
        "packer",
      },
    }
  )
end

return {
  setup = function(use)
    use { "lukas-reineke/indent-blankline.nvim", config = config }
  end,
}
