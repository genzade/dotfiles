local function config()
  local Path = require("plenary.path")
  local vimrc_bg_file = Path:new({ HOME, ".vimrc_background" })

  if vimrc_bg_file:exists() then
    vim.cmd([[source ]] .. vimrc_bg_file.filename)

    -- watch for changes
    local watcher = vim.loop.new_fs_event()

    -- local function on_change(err, fname, status)
    local function on_change(_, _, _)
      vim.cmd([[source ]] .. vimrc_bg_file.filename)
    end

    local function watch_file(fname)
      local call_fn = vim.api.nvim_call_function
      local fullpath = call_fn("fnamemodify", { fname, ":p" })

      watcher:start(
        fullpath, {}, vim.schedule_wrap(
          function(...)
            on_change(...)
          end
        )
      )
    end

    watch_file(vimrc_bg_file.filename)
  else
    vim.cmd([[colorscheme base16-gruvbox-dark-soft]])
  end

  vim.cmd([[hi LineNr guibg=none]])
  vim.cmd([[hi CursorLineNr guibg=none guifg=#98c379 gui=bold]])
  vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
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
