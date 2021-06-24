" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/genzade/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/genzade/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/genzade/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/genzade/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/genzade/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\1\4\0\t6\0\0\0009\0\1\0009\0\2\0B\0\1\1-\0\0\0\18\2\0\0009\0\3\0B\0\2\1K\0\1\0\1À\vtoggle\25nvim_get_current_buf\bapi\bvim‘\5\1\0\n\0\25\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\2\18\3\0\0009\1\a\0B\1\2\2\18\4\1\0009\2\2\0015\5\t\0005\6\b\0=\6\5\5B\2\3\0013\2\n\0007\2\v\0006\2\f\0009\2\r\0029\2\14\0025\3\15\0\18\4\2\0'\6\16\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\1\18\4\2\0'\6\19\0'\a\17\0'\b\20\0\18\t\3\0B\4\5\1\18\4\2\0'\6\16\0'\a\21\0'\b\22\0\18\t\3\0B\4\5\0016\4\f\0009\4\23\4'\6\24\0B\4\2\0012\0\0€K\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE\bcmd <CMD>lua FTermLazyGit()<CR>\14<Leader>g5<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<C-t>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\17FTermLazyGit\0\1\0\2\vborder\vsingle\bcmd\flazygit\1\0\4\vheight\4Í™³æ\fÌ™³ÿ\3\6x\4\0€€€ÿ\3\6y\4\0€€€ÿ\3\nwidth\4Í™³æ\fÌ™³ÿ\3\bnew\19FTerm.terminal\15dimensions\1\0\1\vborder\vsingle\1\0\4\vheight\4Í™³æ\fÌ™³ÿ\3\6x\4\0€€€ÿ\3\6y\4\0€€€ÿ\3\nwidth\4Í™³æ\fÌ™³ÿ\3\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n€\1\0\0\4\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\31\0'\3\3\0B\0\3\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0+\2\2\0B\0\2\1K\0\1\0\14find_file\14nvim-tree\rFileTree\15set_offset\21bufferline.state\frequirek\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequire»\2\1\0\6\0\17\0\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0014\0\0\0003\1\14\0=\1\r\0003\1\16\0=\1\15\0002\0\0€L\0\2\0\0\nclose\0\topen\1\0\2\vsilent\2\fnoremap\2\25<CMD>BufferClose<cr>\n<C-x>\1\0\2\vsilent\2\fnoremap\2\28<CMD>BufferPrevious<cr>\f<S-TAB>\1\0\2\vsilent\2\fnoremap\2\24<CMD>BufferNext<cr>\n<TAB>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["base16-vim"] = {
    config = { "\27LJ\2\nê\2\0\0\3\0\f\0 6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\2\15\0\0\0X\1\20€6\0\0\0009\0\6\0)\1\0\1=\1\a\0006\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\1K\0\1\0&hi Normal guibg=NONE ctermbg=NONE6hi CursorLineNr guibg=none guifg=#98c379 gui=bold\25hi LineNr guibg=none\31source ~/.vimrc_background\21base16colorspace\6g\24~/.vimrc_background\17filereadable\afn$colorscheme base16-default-dark\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n®\5\0\0\5\0\19\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0'\2\14\0B\0\2\0016\0\f\0009\0\r\0'\2\15\0B\0\2\0016\0\f\0009\0\r\0'\2\16\0B\0\2\0016\0\f\0009\0\r\0'\2\17\0B\0\2\0016\0\f\0009\0\r\0'\2\18\0B\0\2\1K\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE,highlight clear SignColumn ctermbg=none4highlight GitSignsDelete guifg=red ctermbg=none7highlight GitSignsChange guifg=yellow ctermbg=none3highlight GitSignsAdd guifg=green ctermbg=none\bcmd\bvim\fkeymaps\1\0\3\16n <leader>b4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\vbuffer\2\fnoremap\2\nsigns\1\0\1\23current_line_blame\2\17changedelete\1\0\4\ahl\19GitSignsChange\ttext\6-\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n¹\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n'\0\0\3\1\1\0\5-\0\0\0009\0\0\0+\2\2\0B\0\2\1K\0\1\0\0À\14find_file\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\nclose\1\0\6\0\6\0\0196\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0006\3\0\0'\5\4\0B\3\2\0029\4\5\3B\4\1\2\15\0\4\0X\5\3€\18\4\2\0B\4\1\1X\4\2€\18\4\1\0B\4\1\0012\0\0€K\0\1\0\rwin_open\19nvim-tree.view\0\0\14nvim-tree\frequire«\1\1\0\b\0\t\0\r3\0\0\0007\0\1\0006\0\2\0009\0\3\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0'<CMD>lua NvimTreeSmartToggle()<CR>\14<Leader>e\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\24NvimTreeSmartToggle\0\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n”\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\tbash\blua\truby\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["overlength.vim"] = {
    config = { "\27LJ\2\nË\1\0\0\5\0\b\0\22)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0016\1\0\0009\1\4\0019\1\5\1'\3\6\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\a\0\18\4\0\0B\1\3\1K\0\1\0\ash\blua\30overlength#set_overlength\afn(overlength#highlight_to_end_of_line\"overlength#default_overlength\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/overlength.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n¼\5\0\0\b\0\24\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\0016\0\t\0009\0\n\0009\0\v\0005\1\f\0\18\2\0\0'\4\r\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\22\0'\6\23\0\18\a\1\0B\2\5\1K\0\1\0:<CMD>lua require('telescope.builtin').live_grep()<CR>\15<Leader>fl<<CMD>lua require('telescope.builtin').grep_string()<CR>\15<Leader>fs:<CMD>lua require('telescope.builtin').git_files()<CR>\15<Leader>fg8<CMD>lua require('telescope.builtin').buffers()<CR>\15<Leader>fb;<CMD>lua require('telescope.builtin').find_files()<CR>\15<Leader>ff\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: base16-vim
time([[Config for base16-vim]], true)
try_loadstring("\27LJ\2\nê\2\0\0\3\0\f\0 6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\2\15\0\0\0X\1\20€6\0\0\0009\0\6\0)\1\0\1=\1\a\0006\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\0016\0\0\0009\0\1\0'\2\n\0B\0\2\0016\0\0\0009\0\1\0'\2\v\0B\0\2\1K\0\1\0&hi Normal guibg=NONE ctermbg=NONE6hi CursorLineNr guibg=none guifg=#98c379 gui=bold\25hi LineNr guibg=none\31source ~/.vimrc_background\21base16colorspace\6g\24~/.vimrc_background\17filereadable\afn$colorscheme base16-default-dark\bcmd\bvim\0", "config", "base16-vim")
time([[Config for base16-vim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n¹\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n”\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\4\0\0\tbash\blua\truby\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\1\4\0\t6\0\0\0009\0\1\0009\0\2\0B\0\1\1-\0\0\0\18\2\0\0009\0\3\0B\0\2\1K\0\1\0\1À\vtoggle\25nvim_get_current_buf\bapi\bvim‘\5\1\0\n\0\25\00026\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\6\0B\0\2\2\18\3\0\0009\1\a\0B\1\2\2\18\4\1\0009\2\2\0015\5\t\0005\6\b\0=\6\5\5B\2\3\0013\2\n\0007\2\v\0006\2\f\0009\2\r\0029\2\14\0025\3\15\0\18\4\2\0'\6\16\0'\a\17\0'\b\18\0\18\t\3\0B\4\5\1\18\4\2\0'\6\19\0'\a\17\0'\b\20\0\18\t\3\0B\4\5\1\18\4\2\0'\6\16\0'\a\21\0'\b\22\0\18\t\3\0B\4\5\0016\4\f\0009\4\23\4'\6\24\0B\4\2\0012\0\0€K\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE\bcmd <CMD>lua FTermLazyGit()<CR>\14<Leader>g5<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<C-t>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\17FTermLazyGit\0\1\0\2\vborder\vsingle\bcmd\flazygit\1\0\4\vheight\4Í™³æ\fÌ™³ÿ\3\6x\4\0€€€ÿ\3\6y\4\0€€€ÿ\3\nwidth\4Í™³æ\fÌ™³ÿ\3\bnew\19FTerm.terminal\15dimensions\1\0\1\vborder\vsingle\1\0\4\vheight\4Í™³æ\fÌ™³ÿ\3\6x\4\0€€€ÿ\3\6y\4\0€€€ÿ\3\nwidth\4Í™³æ\fÌ™³ÿ\3\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n'\0\0\3\1\1\0\5-\0\0\0009\0\0\0+\2\2\0B\0\2\1K\0\1\0\0À\14find_file\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\nclose\1\0\6\0\6\0\0196\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0006\3\0\0'\5\4\0B\3\2\0029\4\5\3B\4\1\2\15\0\4\0X\5\3€\18\4\2\0B\4\1\1X\4\2€\18\4\1\0B\4\1\0012\0\0€K\0\1\0\rwin_open\19nvim-tree.view\0\0\14nvim-tree\frequire«\1\1\0\b\0\t\0\r3\0\0\0007\0\1\0006\0\2\0009\0\3\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0'<CMD>lua NvimTreeSmartToggle()<CR>\14<Leader>e\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\24NvimTreeSmartToggle\0\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: overlength.vim
time([[Config for overlength.vim]], true)
try_loadstring("\27LJ\2\nË\1\0\0\5\0\b\0\22)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0016\1\0\0009\1\4\0019\1\5\1'\3\6\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\a\0\18\4\0\0B\1\3\1K\0\1\0\ash\blua\30overlength#set_overlength\afn(overlength#highlight_to_end_of_line\"overlength#default_overlength\6g\bvim\0", "config", "overlength.vim")
time([[Config for overlength.vim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n®\5\0\0\5\0\19\0#6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0'\2\14\0B\0\2\0016\0\f\0009\0\r\0'\2\15\0B\0\2\0016\0\f\0009\0\r\0'\2\16\0B\0\2\0016\0\f\0009\0\r\0'\2\17\0B\0\2\0016\0\f\0009\0\r\0'\2\18\0B\0\2\1K\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE,highlight clear SignColumn ctermbg=none4highlight GitSignsDelete guifg=red ctermbg=none7highlight GitSignsChange guifg=yellow ctermbg=none3highlight GitSignsAdd guifg=green ctermbg=none\bcmd\bvim\fkeymaps\1\0\3\16n <leader>b4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\vbuffer\2\fnoremap\2\nsigns\1\0\1\23current_line_blame\2\17changedelete\1\0\4\ahl\19GitSignsChange\ttext\6-\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\n€\1\0\0\4\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\31\0'\3\3\0B\0\3\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0+\2\2\0B\0\2\1K\0\1\0\14find_file\14nvim-tree\rFileTree\15set_offset\21bufferline.state\frequirek\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequire»\2\1\0\6\0\17\0\0316\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0014\0\0\0003\1\14\0=\1\r\0003\1\16\0=\1\15\0002\0\0€L\0\2\0\0\nclose\0\topen\1\0\2\vsilent\2\fnoremap\2\25<CMD>BufferClose<cr>\n<C-x>\1\0\2\vsilent\2\fnoremap\2\28<CMD>BufferPrevious<cr>\f<S-TAB>\1\0\2\vsilent\2\fnoremap\2\24<CMD>BufferNext<cr>\n<TAB>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n¼\5\0\0\b\0\24\00036\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\b\0'\2\5\0B\0\2\0016\0\t\0009\0\n\0009\0\v\0005\1\f\0\18\2\0\0'\4\r\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\18\0'\6\19\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1\18\2\0\0'\4\r\0'\5\22\0'\6\23\0\18\a\1\0B\2\5\1K\0\1\0:<CMD>lua require('telescope.builtin').live_grep()<CR>\15<Leader>fl<<CMD>lua require('telescope.builtin').grep_string()<CR>\15<Leader>fs:<CMD>lua require('telescope.builtin').git_files()<CR>\15<Leader>fg8<CMD>lua require('telescope.builtin').buffers()<CR>\15<Leader>fb;<CMD>lua require('telescope.builtin').find_files()<CR>\15<Leader>ff\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\1\0\0\15fzy_native\1\0\0\1\0\2\28override_generic_sorter\1\25override_file_sorter\2\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
