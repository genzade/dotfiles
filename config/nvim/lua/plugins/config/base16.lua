local function config()
  local has_fwatch, fwatch = pcall(require, "fwatch")
  if not has_fwatch then
    return
  end

  local Path = require("plenary.path")
  local vimrc_bg_file = Path:new({ HOME, ".vimrc_background" })
  local cmd = vim.cmd

  if vimrc_bg_file:exists() then
    cmd([[source ]] .. vimrc_bg_file.filename)

    fwatch.watch(
      vimrc_bg_file.filename, {
        on_event = vim.schedule_wrap(
          function(_, events, unwatch)
            if events.change then
              cmd([[source ]] .. vimrc_bg_file.filename)
              cmd([[PackerCompile]])
            end

            unwatch()
          end
        ),
      }
    )
  else
    cmd([[colorscheme base16_default-dark]])
  end

  cmd([[hi LineNr guibg=none]])
  cmd([[hi CursorLineNr guibg=none guifg=#98c379 gui=bold]])
  cmd([[hi Normal guibg=NONE ctermbg=NONE]])

  -- example of how to ovverride any colorus, below shows how to ovverride
  -- some highlight groups
  -- (see https://github.com/RRethy/nvim-base16/blob/b1b9fe2c91/lua/base16-colorscheme.lua)
  local has_colors, base16 = pcall(require, "base16-colorscheme")
  if not has_colors then
    return
  end
  local colors = base16.colors
  local hi = base16.highlight

  hi.SignColumn = {
    guifg = colors.base04,
    guibg = "none",
    gui = nil,
    guisp = nil,
  }
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
