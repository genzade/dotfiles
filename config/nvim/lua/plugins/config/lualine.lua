-- Lualine config
require("lualine").setup({
  options = { theme = "onedark" },
  -- sections = { lualine_x = { "filetype" }, lualine_y = { { colored = true } } },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
