-- Settings
local o = vim.o
local bo = vim.bo
local wo = vim.wo

o.splitbelow = true
o.splitright = true

wo.number = true
wo.relativenumber = true

wo.list = true
wo.listchars = "trail:·"

o.tabstop = 2
bo.tabstop = 2

o.shiftwidth = 2
bo.shiftwidth = 2

o.expandtab = true
bo.expandtab = true

o.scrolloff = 10
wo.scrolloff = 10

wo.signcolumn = "yes"

o.hidden = true

o.termguicolors = true

-- o.fileformats = "mac,unix,dos"
-- o.fileformat = "mac"

-- fileformats           = "mac,unix,dos",

