local fn = vim.fn
local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"
local execute = vim.api.nvim_command

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute "packadd packer.nvim"
end

return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Config for builtin LSP client
  use "neovim/nvim-lspconfig"

  -- Language servers installer
  use "kabouzeid/nvim-lspinstall"

  -- File tree, overrides builtin netrw
  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require "plugins.config.nvim-tree"
    end,
  }

  -- Status line
  use {
    "hoob3rt/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require "plugins.config.lualine"
    end,
  }

  -- Tab line
  use {
    "romgrk/barbar.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
      require "plugins.config.barbar"
    end,
  }

  -- Highlight column when limit reached
  use {
    "tjdevries/overlength.vim",
    config = function()
      require("plugins.config.overlength")
    end,
  }

  -- Colour Scheme
  use {
    "chriskempson/base16-vim",
    config = function()
      require "plugins.config.base16"
    end,
  }

  -- Terminal Integration WIP
  use {
    "numtostr/FTerm.nvim",
    config = function()
      require("plugins.config.fterm")
    end,
  }

  -- Telescope fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
    config = function()
      require("plugins.config.telescope")
    end,
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("plugins.config.treesitter")
    end,
  }
end)
