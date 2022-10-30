local config = function()
  local ok, ts_config = pcall(require, "nvim-treesitter.configs")
  if not ok then
    return
  end

  ts_config.setup(
    {
      ensure_installed = "all",
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      -- needs testing post migration
      textobjects = {
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>df"] = {
              query = "@function.outer",
              desc = "Peek function",
            },
            ["<leader>dF"] = {
              query = "@class.outer",
              desc = "Peek class",
            },
          },
        },
        select = {
          enable = true,
          keymaps = {
            ["af"] = {
              query = "@function.outer",
              desc = "Select around function",
            },
            ["if"] = {
              query = "@function.inner",
              desc = "Select inner function",
            },
            ["ac"] = {
              query = "@class.outer",
              desc = "Select around function",
            },
            ["ic"] = {
              query = "@class.inner",
              desc = "Select inner part of a class region",
            },
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = {
              query = "@parameter.inner",
              desc = "Swap with next parameter",
            },
          },
          swap_previous = {
            ["<leader>A"] = {
              query = "@parameter.inner",
              desc = "Swap with previous parameter",
            },
          },
        },
      },
    }
  )
end

return {
  "nvim-treesitter/nvim-treesitter",
  run = function()
    local ok, ts_install = pcall(require, "nvim-treesitter.install")
    if not ok then
      vim.notify("Cannot run `TSUpdate`, treesitter not available")
      return
    end

    ts_install.update({ with_sync = true })
  end,
  requires = { "nvim-treesitter/nvim-treesitter-textobjects" },
  config = config,
}
