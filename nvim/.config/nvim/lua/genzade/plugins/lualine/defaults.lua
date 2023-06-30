local M = {}

local padding = {
  left = 1,
  right = 1,
}

M.options = {
  section_separators = '',
  component_separators = '',
  globalstatus = true,
  theme = 'base16',
}

-- local vim_icons = {
--   function()
--     return ""
--   end,
--   separator = { left = "", right = "" },
--   color = { bg = "#313244", fg = "#80A7EA" },
-- }

M.mode = {
  'mode',
  fmt = function(str)
    return str:sub(1, 1)
  end,
}

M.branch = {
  'branch',
}

M.diff = {
  'diff',
  -- uncomment and modify to use differenct symbols
  -- symbols = {
  --   added = '+',
  --   modified = '~',
  --   removed = '-',
  -- },
}

M.filename = {
  'filename',
  padding = padding,
}

M.diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic', 'nvim_lsp' },
  sections = { 'error', 'warn', 'info', 'hint' },
  update_in_insert = false, -- Update diagnostics in insert mode.
  always_visible = true, -- Show diagnostics even if there are none.
  padding = padding,
}

M.macro_recording = {
  'macro-recording',
  fmt = function()
    local recording_register = vim.fn.reg_recording()
    if recording_register == '' then
      return ''
    else
      return ' ' .. recording_register
    end
  end,
  padding = padding,
}

-- M.fileformat = {
--   'fileformat',
--   icons_enabled = false,
--   -- symbols = {
--   --   unix = '', -- e712
--   --   dos = '', -- e70f
--   --   mac = '', -- e711
--   -- },
--   padding = padding,
-- }

-- override this because it feels wrong to see the linux penguin on the mac
-- lualine looks at fileformat (see :h fileformat) which is always unix on mac
-- revert to previous a better solution is found
M.fileformat = function()
  local os = vim.loop.os_uname().sysname
  local icon

  if os == 'Linux' then
    icon = '  '
  elseif os == 'Darwin' then
    icon = '  '
  else
    icon = '  '
  end
  --return icon .. os
  return icon
end

M.encoding = {
  'encoding',
  padding = padding,
}

M.lsp_status = {
  function()
    local clients = vim.lsp.get_active_clients()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local lsp_icon = '  '

    if next(clients) == nil then
      return msg
    end

    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes

      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return lsp_icon .. client.name
      end
    end

    return lsp_icon .. msg
  end,
  padding = padding,
}

M.filetype = {
  'filetype',
  padding = padding,
}

M.progress = {
  'progress',
  padding = padding,
}

M.location = {
  'location',
  padding = padding,
}

M.scrollbar = {
  function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local icon = ''
    local chars = {
      icon .. ' ██',
      icon .. ' ▇▇',
      icon .. ' ▆▆',
      icon .. ' ▅▅',
      icon .. ' ▄▄',
      icon .. ' ▃▃',
      icon .. ' ▂▂',
      icon .. ' ▁▁',
      icon .. ' __',
    }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)

    return chars[index]
  end,
}

M.extensions = {
  'fzf',
  'man',
  'nvim-tree',
  'quickfix',
}

return M
