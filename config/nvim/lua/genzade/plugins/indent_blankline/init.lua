vim.opt.list = true

local config = function()
  local has_indent_blankline, indent_blankline =
    pcall(require, "indent_blankline")

  if not has_indent_blankline then
    return
  end

  indent_blankline.setup(
    {
      show_first_indent_level = false,
      show_end_of_line = true,
      buftype_exclude = { "terminal", "packer", "nofile" },
      filetype_exclude = {
        "NvimTree",
        "dashboard",
        "startup",
        "help",
        "lspinfo",
        "markdown",
        "packer",
        "txt",
      },
    }
  )
end

return { "lukas-reineke/indent-blankline.nvim", config = config }
