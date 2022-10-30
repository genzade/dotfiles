local config = function()
  local notify_ok, notify = pcall(require, "notify")
  if not notify_ok then
    return
  end

  local plenary_log_ok, plenary_log = pcall(require, "plenary.log")
  if not plenary_log_ok then
    return
  end

  local log = plenary_log.new {
    plugin = "notify",
    level = "debug",
    use_console = false,
  }

  notify.setup(
    {
      stages = "fade_in_slide_out",
      background_colour = "FloatShadow",
      timeout = 3000,
    }
  )

  vim.notify = function(msg, level, opts)
    log.info(msg, level, opts)
    notify(msg, level, opts)
  end
end

return { "rcarriga/nvim-notify", config = config }
