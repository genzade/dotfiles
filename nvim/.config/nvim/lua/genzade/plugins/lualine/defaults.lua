local M = {}

M.options = {
  section_separators = '',
  component_separators = '',
  globalstatus = true,
  theme = 'auto',
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
}

M.diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic', 'nvim_lsp' },
  sections = { 'error', 'warn', 'info', 'hint' },
  update_in_insert = false, -- Update diagnostics in insert mode.
  always_visible = true, -- Show diagnostics even if there are none.
}

M.fileformat = {
  'fileformat',
}

M.encoding = {
  'encoding',
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
}

M.filetype = {
  'filetype',
}

M.progress = {
  'progress',
}

M.location = {
  'location',
}

M.scrollbar = {
  function()
    local current_line = vim.fn.line('.')
    local total_lines = vim.fn.line('$')
    local icon = ''
    local chars = {
      icon .. ' __',
      icon .. ' ▁▁',
      icon .. ' ▂▂',
      icon .. ' ▃▃',
      icon .. ' ▄▄',
      icon .. ' ▅▅',
      icon .. ' ▆▆',
      icon .. ' ▇▇',
      icon .. ' ██',
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
