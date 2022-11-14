local config = function()
  local notify_ok, notify = pcall(require, "notify")
  if not notify_ok then
    return
  else
    vim.notify = notify
  end

  notify.setup(
    {
      stages = "static",
      background_colour = "FloatShadow",
      timeout = 3000,
      fps = 60,
    }
  )

  vim.lsp.handlers["window/showMessage"] =
    function(_, method, params, _)
      -- map both hint and info to info?
      local severity = { "error", "warn", "info", "info" }

      notify(method.message, severity[params.type])
    end
end

return { "rcarriga/nvim-notify", config = config }
