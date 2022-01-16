local function config()
  local has_fwatch, fwatch = pcall(require, "fwatch")
  if not has_fwatch then
    return
  end

  local Path = require("plenary.path")
  local vimrc_bg_file = Path:new({ HOME, ".vimrc_background" })

  if vimrc_bg_file:exists() then
    vim.cmd([[source ]] .. vimrc_bg_file.filename)

    fwatch.watch(
      vimrc_bg_file.filename, {
        on_event = vim.schedule_wrap(
          function(_, events, unwatch)
            if events.change then
              vim.cmd([[source ]] .. vimrc_bg_file.filename)
              vim.cmd([[PackerCompile]])
            end

            unwatch()
          end
        ),
      }
    )
  else
    vim.cmd([[colorscheme base16_default-dark]])
  end

  vim.cmd([[hi LineNr guibg=none]])
  vim.cmd([[hi CursorLineNr guibg=none guifg=#98c379 gui=bold]])
  vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])

  -- example of how to ovverride any colorus, below shows how to ovverride
  -- some highlight groups
  -- (see https://github.com/RRethy/nvim-base16/blob/b1b9fe2c91/lua/base16-colorscheme.lua)
  -- local has_colors, colorscheme = pcall(require, "base16-colorscheme")
  -- if not has_colors then
  --   return
  -- end
  -- local hi = colorscheme.highlight
  -- hi.StatusLineFileModified = { guibg = "#555965", guifg = "#00aa00" }
  -- hi.StatusLineFileReadonly = { guibg = "#555965", guifg = "#ffa003" }
  -- hi.StatusLineFileRestricted = { guibg = "#555965", guifg = "#dc322f" }
end

return {
  setup = function(use)
    use {
      "RRethy/nvim-base16",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "rktjmp/fwatch.nvim" },
      },
      config = config,
    }
  end,
}
