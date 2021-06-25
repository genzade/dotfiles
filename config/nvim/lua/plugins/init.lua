local function ensure_packer()
  local fn = vim.fn
  local install_path = DATA_PATH .. "/site/pack/packer/start/packer.nvim"
  local execute = vim.api.nvim_command

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system(
      { "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    execute "packadd packer.nvim"
  end
end

local function packer_setup()
  require("packer").startup(function(use)
    use "wbthomason/packer.nvim"

    require"plugins.config".setup(use)
  end)
end

local function setup()
  ensure_packer()
  packer_setup()
end

return { setup = setup }
