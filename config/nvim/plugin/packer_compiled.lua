-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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
    config = { "\27LJ\2\nQ\0\0\3\1\4\0\t6\0\0\0009\0\1\0009\0\2\0B\0\1\1-\0\0\0\18\2\0\0009\0\3\0B\0\2\1K\0\1\0\2¿\vtoggle\25nvim_get_current_buf\bapi\bvim’\4\1\0\v\0\24\00015\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0016\1\1\0'\3\6\0B\1\2\2\18\4\1\0009\2\a\1B\2\2\2\18\5\2\0009\3\3\0025\6\b\0=\0\5\6B\3\3\0013\3\t\0007\3\n\0006\3\v\0009\3\f\0039\3\r\0035\4\14\0\18\5\3\0'\a\15\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\3\0'\a\18\0'\b\16\0'\t\19\0\18\n\4\0B\5\5\1\18\5\3\0'\a\15\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\0016\5\v\0009\5\22\5'\a\23\0B\5\2\0012\0\0ÄK\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE\bcmd <CMD>lua FTermLazyGit()<CR>\14<Leader>g5<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<C-t>\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\17FTermLazyGit\0\1\0\2\bcmd\flazygit\vborder\vsingle\bnew\19FTerm.terminal\15dimensions\1\0\1\vborder\vsingle\nsetup\nFTerm\frequire\1\0\4\nwidth\4Õô≥Ê\fÃô≥ˇ\3\6x\4\0ÄÄÄˇ\3\6y\4\0ÄÄÄˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\nÄ\1\0\0\4\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\31\0'\3\3\0B\0\3\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0+\2\2\0B\0\2\1K\0\1\0\14find_file\14nvim-tree\rFileTree\15set_offset\21bufferline.state\frequirek\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequireã\2\1\0\b\0\15\0\0296\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\0014\2\0\0003\3\f\0=\3\v\0023\3\14\0=\3\r\0022\0\0ÄL\2\2\0\0\nclose\0\topen\25<CMD>BufferClose<CR>\n<C-x>\28<CMD>BufferPrevious<CR>\f<S-TAB>\24<CMD>BufferNext<CR>\n<TAB>\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["base16-vim"] = {
    config = { "\27LJ\2\nÓ\2\0\0\3\0\f\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\21Ä6\0\0\0009\0\4\0)\1\0\1=\1\5\0006\0\0\0009\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\6\0'\2\b\0B\0\2\0016\0\0\0009\0\6\0'\2\t\0B\0\2\0016\0\0\0009\0\6\0'\2\n\0B\0\2\1X\0\4Ä6\0\0\0009\0\6\0'\2\v\0B\0\2\1K\0\1\0$colorscheme base16-default-dark&hi Normal guibg=NONE ctermbg=NONE6hi CursorLineNr guibg=none guifg=#98c379 gui=bold\25hi LineNr guibg=none\31source ~/.vimrc_background\bcmd\21base16colorspace\6g\24~/.vimrc_background\17filereadable\afn\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/base16-vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n‘\6\0\0\5\0\23\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0'\2\18\0B\0\2\0016\0\16\0009\0\17\0'\2\19\0B\0\2\0016\0\16\0009\0\17\0'\2\20\0B\0\2\0016\0\16\0009\0\17\0'\2\21\0B\0\2\0016\0\16\0009\0\17\0'\2\22\0B\0\2\1K\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE,highlight clear SignColumn ctermbg=none4highlight GitSignsDelete guifg=red ctermbg=none7highlight GitSignsChange guifg=yellow ctermbg=none3highlight GitSignsAdd guifg=green ctermbg=none\bcmd\bvim\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\3\16n <leader>b4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\vbuffer\2\fnoremap\2\nsigns\1\0\1\23current_line_blame\2\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6-\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\6+\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nπ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n˙\5\0\0\b\0\22\0!6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\0016\2\0\0009\2\1\0029\2\a\2'\4\b\0+\5\1\0B\2\3\0016\2\0\0009\2\t\0025\3\v\0005\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\n\0026\2\18\0'\4\19\0B\2\2\0029\2\20\0025\4\21\0B\2\2\1K\0\1\0\1\0\2\17hijack_netrw\2\18disable_netrw\2\nsetup\14nvim-tree\frequire\blsp\1\0\4\tinfo\bÔÅö\thint\bÔÅ™\fwarning\bÔÅ±\nerror\bÔÅó\vfolder\1\0\b\15arrow_open\bÔëº\topen\bÓóæ\nempty\bÔÑî\15empty_open\bÔÑï\17symlink_open\bÓóæ\fdefault\bÓóø\17arrow_closed\bÔë†\fsymlink\bÔíÇ\bgit\1\0\a\fdeleted\bÔëò\frenamed\b‚ûú\fignored\b‚óå\runmerged\bÓúß\vstaged\b‚úì\runstaged\b‚úó\14untracked\b‚òÖ\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\6g¶\1          augroup NVIMTREE\n          autocmd!\n          autocmd Colorscheme * highlight NvimTreeNormal guibg=#21252B guifg=#9da5b3\n          augroup END\n        \14nvim_exec'<CMD>lua NvimTreeSmartToggle()<CR>\14<Leader>e\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÖ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["overlength.vim"] = {
    config = { "\27LJ\2\nË\1\0\0\5\0\t\0\28)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0016\1\0\0009\1\4\0019\1\5\1'\3\6\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\a\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\b\0\18\4\0\0B\1\3\1K\0\1\0\ash\truby\blua\30overlength#set_overlength\afn(overlength#highlight_to_end_of_line\"overlength#default_overlength\6g\bvim\0" },
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
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÑ\1\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0B\1\2\1K\0\1\0\30current_buffer_fuzzy_find\22telescope.builtin\fget_ivy\21telescope.themes\frequire∫\a\1\0\b\0 \0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\f\0'\2\n\0B\0\2\0016\0\r\0009\0\14\0009\0\15\0005\1\16\0003\2\17\0007\2\18\0\18\2\0\0'\4\19\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\22\0'\6\23\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\24\0'\6\25\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\26\0'\6\27\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\28\0'\6\29\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\30\0'\6\31\0\18\a\1\0B\2\5\1K\0\1\0*<CMD>lua CurrentBufferFuzzyFind()<CR>\15<Leader>fc:<CMD>lua require('telescope.builtin').live_grep()<CR>\15<Leader>fl<<CMD>lua require('telescope.builtin').grep_string()<CR>\15<Leader>fs:<CMD>lua require('telescope.builtin').git_files()<CR>\15<Leader>fg8<CMD>lua require('telescope.builtin').buffers()<CR>\15<Leader>fb;<CMD>lua require('telescope.builtin').find_files()<CR>\15<Leader>ff\6n\27CurrentBufferFuzzyFind\0\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\bfzf\1\0\0\1\0\3\nfuzzy\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\1\0\1\18prompt_prefix\a$ \nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-autoswap"] = {
    config = { "\27LJ\2\nk\0\0\2\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\25autoswap_detect_tmux\16titlestring\aon\ntitle\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-autoswap"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim"
  },
  ["vim-projectionist"] = {
    config = { "\27LJ\2\nÄ\4\0\0\b\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0016\0\0\0009\0\1\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1K\0\1\0\f:AS<cr>\15<leader>as\f:AV<cr>\15<leader>av\v:A<cr>\15<leader>aa\6n\1\0\1\vsilent\2\20nvim_set_keymap°\2    augroup PROJECTIONIST\n    autocmd!\n    let args = {}\n    let args[\"app/*.rb\"]       = { \"alternate\": \"spec/{}_spec.rb\" }\n    let args[\"spec/*_spec.rb\"] = { \"alternate\": \"app/{}.rb\" }\n    autocmd User ProjectionistDetect call projectionist#append(getcwd(), args)\n    augroup END\n  \14nvim_exec\bapi\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n˛\2\0\0\b\0\18\0'6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\1K\0\1\0\23<CMD>TestVisit<CR>\15<leader>tv\22<CMD>TestLast<CR>\15<leader>tl\23<CMD>TestSuite<CR>\15<leader>ts\22<CMD>TestFile<CR>\15<leader>tf\25<CMD>TestNearest<CR>\15<leader>tn\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\vneovim\18test#strategy\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-tmux-navigator"] = {
    config = { "\27LJ\2\n›\2\0\0\b\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1K\0\1\0\31<CMD>TmuxNavigateRight<CR>\n<C-l>\28<CMD>TmuxNavigateUp<CR>\n<C-k>\30<CMD>TmuxNavigateDown<CR>\n<C-j>\30<CMD>TmuxNavigateLeft<CR>\n<C-h>\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi'tmux_navigator_disable_when_zoomed\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: vim-projectionist
time([[Config for vim-projectionist]], true)
try_loadstring("\27LJ\2\nÄ\4\0\0\b\0\r\0\0296\0\0\0009\0\1\0009\0\2\0'\2\3\0+\3\1\0B\0\3\0016\0\0\0009\0\1\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1K\0\1\0\f:AS<cr>\15<leader>as\f:AV<cr>\15<leader>av\v:A<cr>\15<leader>aa\6n\1\0\1\vsilent\2\20nvim_set_keymap°\2    augroup PROJECTIONIST\n    autocmd!\n    let args = {}\n    let args[\"app/*.rb\"]       = { \"alternate\": \"spec/{}_spec.rb\" }\n    let args[\"spec/*_spec.rb\"] = { \"alternate\": \"app/{}.rb\" }\n    autocmd User ProjectionistDetect call projectionist#append(getcwd(), args)\n    augroup END\n  \14nvim_exec\bapi\bvim\0", "config", "vim-projectionist")
time([[Config for vim-projectionist]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nπ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\1\4\0\t6\0\0\0009\0\1\0009\0\2\0B\0\1\1-\0\0\0\18\2\0\0009\0\3\0B\0\2\1K\0\1\0\2¿\vtoggle\25nvim_get_current_buf\bapi\bvim’\4\1\0\v\0\24\00015\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0016\1\1\0'\3\6\0B\1\2\2\18\4\1\0009\2\a\1B\2\2\2\18\5\2\0009\3\3\0025\6\b\0=\0\5\6B\3\3\0013\3\t\0007\3\n\0006\3\v\0009\3\f\0039\3\r\0035\4\14\0\18\5\3\0'\a\15\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\3\0'\a\18\0'\b\16\0'\t\19\0\18\n\4\0B\5\5\1\18\5\3\0'\a\15\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\0016\5\v\0009\5\22\5'\a\23\0B\5\2\0012\0\0ÄK\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE\bcmd <CMD>lua FTermLazyGit()<CR>\14<Leader>g5<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<C-t>\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\17FTermLazyGit\0\1\0\2\bcmd\flazygit\vborder\vsingle\bnew\19FTerm.terminal\15dimensions\1\0\1\vborder\vsingle\nsetup\nFTerm\frequire\1\0\4\nwidth\4Õô≥Ê\fÃô≥ˇ\3\6x\4\0ÄÄÄˇ\3\6y\4\0ÄÄÄˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n˛\2\0\0\b\0\18\0'6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\1K\0\1\0\23<CMD>TestVisit<CR>\15<leader>tv\22<CMD>TestLast<CR>\15<leader>tl\23<CMD>TestSuite<CR>\15<leader>ts\22<CMD>TestFile<CR>\15<leader>tf\25<CMD>TestNearest<CR>\15<leader>tn\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\vneovim\18test#strategy\6g\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n˙\5\0\0\b\0\22\0!6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\0016\2\0\0009\2\1\0029\2\a\2'\4\b\0+\5\1\0B\2\3\0016\2\0\0009\2\t\0025\3\v\0005\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\3=\3\n\0026\2\18\0'\4\19\0B\2\2\0029\2\20\0025\4\21\0B\2\2\1K\0\1\0\1\0\2\17hijack_netrw\2\18disable_netrw\2\nsetup\14nvim-tree\frequire\blsp\1\0\4\tinfo\bÔÅö\thint\bÔÅ™\fwarning\bÔÅ±\nerror\bÔÅó\vfolder\1\0\b\15arrow_open\bÔëº\topen\bÓóæ\nempty\bÔÑî\15empty_open\bÔÑï\17symlink_open\bÓóæ\fdefault\bÓóø\17arrow_closed\bÔë†\fsymlink\bÔíÇ\bgit\1\0\a\fdeleted\bÔëò\frenamed\b‚ûú\fignored\b‚óå\runmerged\bÓúß\vstaged\b‚úì\runstaged\b‚úó\14untracked\b‚òÖ\1\0\2\fdefault\bÓòí\fsymlink\bÔíÅ\20nvim_tree_icons\6g¶\1          augroup NVIMTREE\n          autocmd!\n          autocmd Colorscheme * highlight NvimTreeNormal guibg=#21252B guifg=#9da5b3\n          augroup END\n        \14nvim_exec'<CMD>lua NvimTreeSmartToggle()<CR>\14<Leader>e\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\4\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\31\0'\3\3\0B\0\3\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0+\2\2\0B\0\2\1K\0\1\0\14find_file\14nvim-tree\rFileTree\15set_offset\21bufferline.state\frequirek\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequireã\2\1\0\b\0\15\0\0296\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\0014\2\0\0003\3\f\0=\3\v\0023\3\14\0=\3\r\0022\0\0ÄL\2\2\0\0\nclose\0\topen\25<CMD>BufferClose<CR>\n<C-x>\28<CMD>BufferPrevious<CR>\f<S-TAB>\24<CMD>BufferNext<CR>\n<TAB>\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: vim-tmux-navigator
time([[Config for vim-tmux-navigator]], true)
try_loadstring("\27LJ\2\n›\2\0\0\b\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1K\0\1\0\31<CMD>TmuxNavigateRight<CR>\n<C-l>\28<CMD>TmuxNavigateUp<CR>\n<C-k>\30<CMD>TmuxNavigateDown<CR>\n<C-j>\30<CMD>TmuxNavigateLeft<CR>\n<C-h>\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi'tmux_navigator_disable_when_zoomed\6g\bvim\0", "config", "vim-tmux-navigator")
time([[Config for vim-tmux-navigator]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÖ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: base16-vim
time([[Config for base16-vim]], true)
try_loadstring("\27LJ\2\nÓ\2\0\0\3\0\f\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\15\0\0\0X\1\21Ä6\0\0\0009\0\4\0)\1\0\1=\1\5\0006\0\0\0009\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\6\0'\2\b\0B\0\2\0016\0\0\0009\0\6\0'\2\t\0B\0\2\0016\0\0\0009\0\6\0'\2\n\0B\0\2\1X\0\4Ä6\0\0\0009\0\6\0'\2\v\0B\0\2\1K\0\1\0$colorscheme base16-default-dark&hi Normal guibg=NONE ctermbg=NONE6hi CursorLineNr guibg=none guifg=#98c379 gui=bold\25hi LineNr guibg=none\31source ~/.vimrc_background\bcmd\21base16colorspace\6g\24~/.vimrc_background\17filereadable\afn\bvim\0", "config", "base16-vim")
time([[Config for base16-vim]], false)
-- Config for: vim-autoswap
time([[Config for vim-autoswap]], true)
try_loadstring("\27LJ\2\nk\0\0\2\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\25autoswap_detect_tmux\16titlestring\aon\ntitle\6g\bvim\0", "config", "vim-autoswap")
time([[Config for vim-autoswap]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0B\1\2\1K\0\1\0\30current_buffer_fuzzy_find\22telescope.builtin\fget_ivy\21telescope.themes\frequire∫\a\1\0\b\0 \0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\f\0'\2\n\0B\0\2\0016\0\r\0009\0\14\0009\0\15\0005\1\16\0003\2\17\0007\2\18\0\18\2\0\0'\4\19\0'\5\20\0'\6\21\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\22\0'\6\23\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\24\0'\6\25\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\26\0'\6\27\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\28\0'\6\29\0\18\a\1\0B\2\5\1\18\2\0\0'\4\19\0'\5\30\0'\6\31\0\18\a\1\0B\2\5\1K\0\1\0*<CMD>lua CurrentBufferFuzzyFind()<CR>\15<Leader>fc:<CMD>lua require('telescope.builtin').live_grep()<CR>\15<Leader>fl<<CMD>lua require('telescope.builtin').grep_string()<CR>\15<Leader>fs:<CMD>lua require('telescope.builtin').git_files()<CR>\15<Leader>fg8<CMD>lua require('telescope.builtin').buffers()<CR>\15<Leader>fb;<CMD>lua require('telescope.builtin').find_files()<CR>\15<Leader>ff\6n\27CurrentBufferFuzzyFind\0\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\bfzf\1\0\0\1\0\3\nfuzzy\2\25override_file_sorter\2\28override_generic_sorter\1\rdefaults\1\0\0\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\1\0\1\18prompt_prefix\a$ \nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n‘\6\0\0\5\0\23\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\n\0005\4\v\0=\4\f\0035\4\r\0=\4\14\3=\3\15\2B\0\2\0016\0\16\0009\0\17\0'\2\18\0B\0\2\0016\0\16\0009\0\17\0'\2\19\0B\0\2\0016\0\16\0009\0\17\0'\2\20\0B\0\2\0016\0\16\0009\0\17\0'\2\21\0B\0\2\0016\0\16\0009\0\17\0'\2\22\0B\0\2\1K\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE,highlight clear SignColumn ctermbg=none4highlight GitSignsDelete guifg=red ctermbg=none7highlight GitSignsChange guifg=yellow ctermbg=none3highlight GitSignsAdd guifg=green ctermbg=none\bcmd\bvim\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\3\16n <leader>b4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\vbuffer\2\fnoremap\2\nsigns\1\0\1\23current_line_blame\2\17changedelete\1\0\4\ahl\19GitSignsChange\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6-\badd\1\0\0\1\0\4\ahl\16GitSignsAdd\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\6+\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: overlength.vim
time([[Config for overlength.vim]], true)
try_loadstring("\27LJ\2\nË\1\0\0\5\0\t\0\28)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0016\1\0\0009\1\4\0019\1\5\1'\3\6\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\a\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\b\0\18\4\0\0B\1\3\1K\0\1\0\ash\truby\blua\30overlength#set_overlength\afn(overlength#highlight_to_end_of_line\"overlength#default_overlength\6g\bvim\0", "config", "overlength.vim")
time([[Config for overlength.vim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
