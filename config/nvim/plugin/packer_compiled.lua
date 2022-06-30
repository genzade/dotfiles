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
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
    config = { "\27LJ\2\nQ\0\0\3\1\4\0\t6\0\0\0009\0\1\0009\0\2\0B\0\1\1-\0\0\0\18\2\0\0009\0\3\0B\0\2\1K\0\1\0\2¿\vtoggle\25nvim_get_current_buf\bapi\bvim’\4\1\0\v\0\24\00015\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0016\1\1\0'\3\6\0B\1\2\2\18\4\1\0009\2\a\1B\2\2\2\18\5\2\0009\3\3\0025\6\b\0=\0\5\6B\3\3\0013\3\t\0007\3\n\0006\3\v\0009\3\f\0039\3\r\0035\4\14\0\18\5\3\0'\a\15\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\3\0'\a\18\0'\b\16\0'\t\19\0\18\n\4\0B\5\5\1\18\5\3\0'\a\15\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\0016\5\v\0009\5\22\5'\a\23\0B\5\2\0012\0\0ÄK\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE\bcmd <CMD>lua FTermLazyGit()<CR>\14<Leader>g5<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<C-t>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\17FTermLazyGit\0\1\0\2\vborder\vsingle\bcmd\flazygit\bnew\19FTerm.terminal\15dimensions\1\0\1\vborder\vsingle\nsetup\nFTerm\frequire\1\0\4\6x\4\0ÄÄÄˇ\3\nwidth\4Õô≥Ê\fÃô≥ˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\6y\4\0ÄÄÄˇ\3\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numtostr/FTerm.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\nÀ\1\0\0\5\0\b\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0019\2\4\0025\4\5\0B\2\2\0016\2\1\0'\4\6\0B\2\2\0029\2\a\2B\2\1\1K\0\1\0\14lazy_load luasnip/loaders/from_vscode\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\nÄ\1\0\0\4\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\31\0'\3\3\0B\0\3\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0+\2\2\0B\0\2\1K\0\1\0\14find_file\14nvim-tree\rFileTree\15set_offset\21bufferline.state\frequirek\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequireã\2\1\0\b\0\15\0\0296\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\0014\2\0\0003\3\f\0=\3\v\0023\3\14\0=\3\r\0022\0\0ÄL\2\2\0\0\nclose\0\topen\25<CMD>BufferClose<CR>\n<A-x>\28<CMD>BufferPrevious<CR>\f<S-TAB>\24<CMD>BufferNext<CR>\n<TAB>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\nƒ\6\0\0\5\0!\0+6\0\0\0009\0\1\0006\1\2\0'\3\3\0B\1\2\0029\1\4\0016\2\6\0009\2\a\2\21\4\1\0B\2\2\0028\2\2\1=\2\5\0005\2\f\0005\3\n\0005\4\t\0=\4\v\3=\3\r\0025\3\15\0005\4\14\0=\4\v\3=\3\16\0025\3\18\0005\4\17\0=\4\v\3=\3\19\0025\3\21\0005\4\20\0=\4\v\3=\3\22\0025\3\24\0005\4\23\0=\4\v\3=\3\25\0025\3\27\0005\4\26\0=\4\v\3=\3\28\2=\2\b\0'\2\30\0=\2\29\0005\2 \0=\2\31\0K\0\1\0\1\2\0\0004'Do one thing, and do it well.' Unix philosophy\28dashboard_custom_footer\14telescope dashboard_default_executive\17zedit_config\1\0\1\fcommand%Telescope fd cwd=$HOME/dotfiles/\1\2\0\0\27Ôê•  Edit config      \18file_explorer\1\0\1\fcommand\17NvimTreeOpen\1\2\0\0\28Ôêî  Open File Explorer\fhistory\1\0\1\fcommand\25DashboardFindHistory\1\2\0\0\28Ôú°  History           \17last_session\1\0\1\fcommand\16SessionLoad\1\2\0\0\28Ôë§  Load Last Session \rfindfile\1\0\1\fcommand\22DashboardFindFile\1\2\0\0\28ÔÖú  Find File         \fnewfile\1\0\0\16description\1\0\1\fcommand\21DashboardNewFile\1\2\0\0\28ÔÖõ  New File          \29dashboard_custom_section\vrandom\tmath\28dashboard_custom_header\fheaders%plugins.config.dashboard.headers\frequire\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fwatch.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/fwatch.nvim",
    url = "https://github.com/rktjmp/fwatch.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\në\5\0\0\a\0\19\0\0256\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\v\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\r\0005\6\14\0=\6\15\0055\6\16\0=\6\17\5=\5\18\4B\2\2\1K\0\1\0\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\3\16n <leader>b=<cmd>lua require\"gitsigns\".blame_line{ full = true }<CR>\fnoremap\2\vbuffer\2\nsigns\1\0\1\23current_line_blame\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6-\ahl\19GitSignsChange\vchange\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\6+\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n˝\1\0\0\6\0\t\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\4B\2\2\1K\0\1\0\21filetype_exclude\1\6\0\0\rNvimTree\14dashboard\thelp\flspinfo\vpacker\20buftype_exclude\1\4\0\0\rterminal\vpacker\vnofile\1\0\2\21show_end_of_line\2\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nπ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nÎ\3\0\0\15\0\24\00106\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0019\2\4\0026\3\5\0'\4\6\0&\3\4\0036\4\1\0'\6\a\0B\4\2\0029\4\b\0049\5\t\0015\a\22\0004\b\4\0009\t\n\0029\t\v\t5\v\14\0005\f\f\0'\r\r\0\18\14\3\0&\r\14\r>\r\2\f=\f\15\vB\t\2\2>\t\1\b9\t\16\0029\t\v\t5\v\18\0005\f\17\0=\f\15\vB\t\2\2>\t\2\b9\t\19\0029\t\v\t5\v\21\0005\f\20\0=\f\15\vB\t\2\0?\t\0\0=\b\23\a=\4\b\aB\5\2\1K\0\1\0\fsources\1\0\0\1\0\0\1\a\0\0\t-i=2\b-bn\b-ci\a-s\b-sr\b-kp\nshfmt\1\0\0\1\3\0\0\27--quote-props preserve\19--parser json5\rprettier\15extra_args\1\0\0\14--config=\1\2\0\0\15--in-place\twith\15lua_format\nsetup\14on_attach plugins.config.lsp.defaults*/dotfiles/lua/luaformatter/config.yml\tHOME\15formatting\rbuiltins\fnull-ls\frequire\npcall\aÄÄ¿ô\4\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n†\2\0\0\r\0\14\0\0316\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\0016\2\0\0006\4\1\0'\5\5\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0006\4\1\0'\6\6\0B\4\2\0029\5\a\3\18\a\5\0009\5\b\5'\b\t\0009\t\n\0045\v\f\0005\f\v\0=\f\r\vB\t\2\0A\5\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\1\0\1\30enable_check_bracket_line\1\nsetup\19nvim-autopairs\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-base16"] = {
    config = { "\27LJ\2\nm\0\3\a\2\4\0\0159\3\0\1\15\0\3\0X\4\tÄ-\3\0\0'\5\1\0-\6\1\0009\6\2\6&\5\6\5B\3\2\1-\3\0\0'\5\3\0B\3\2\1\18\3\2\0B\3\1\1K\0\1\0\4¿\3¿\18PackerCompile\rfilename\fsource \vchangeÈ\4\1\0\f\0\28\0C6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0;Ä6\2\1\0'\4\3\0B\2\2\2\18\5\2\0009\3\4\0025\6\6\0006\a\5\0>\a\1\6B\3\3\0026\4\a\0009\4\b\4\18\a\3\0009\5\t\3B\5\2\2\15\0\5\0X\6\15Ä\18\5\4\0'\a\n\0009\b\v\3&\a\b\aB\5\2\0019\5\f\0019\a\v\0035\b\15\0006\t\a\0009\t\r\t3\v\14\0B\t\2\2=\t\16\bB\5\3\1X\5\3Ä\18\5\4\0'\a\17\0B\5\2\1\18\5\4\0'\a\18\0B\5\2\1\18\5\4\0'\a\19\0B\5\2\1\18\5\4\0'\a\20\0B\5\2\0016\5\0\0006\a\1\0'\b\21\0B\5\3\3\14\0\5\0X\a\2Ä2\0\0ÄK\0\1\0009\a\22\0069\b\23\0065\t\26\0009\n\25\a=\n\27\t=\t\24\b2\0\0ÄK\0\1\0K\0\1\0\nguifg\1\0\1\nguibg\tnone\vbase04\15SignColumn\14highlight\vcolors\23base16-colorscheme&hi Normal guibg=NONE ctermbg=NONE6hi CursorLineNr guibg=none guifg=#98c379 gui=bold\25hi LineNr guibg=none$colorscheme base16_default-dark\ron_event\1\0\0\0\18schedule_wrap\nwatch\rfilename\fsource \vexists\bcmd\bvim\1\3\0\0\0\22.vimrc_background\tHOME\bnew\17plenary.path\vfwatch\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nq\0\1\4\1\4\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\bÄ-\1\0\0009\1\1\0015\3\2\0B\1\2\2\14\0\1\0X\1\5ÄK\0\1\0X\1\3Ä-\1\0\0009\1\3\1B\1\1\1K\0\1\0\3¿\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleÕ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\5¿\0\0\21select_prev_item\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\5¿\tjump\rjumpable\21select_prev_item\fvisibleñ\1\0\2\b\0\4\0\0289\2\0\0009\2\1\2\18\4\2\0009\2\2\2'\5\3\0B\2\3\0039\4\0\0019\4\1\4\18\6\4\0009\4\2\4'\a\3\0B\4\3\3\14\0\3\0X\6\1Ä)\3\0\0\14\0\5\0X\6\1Ä)\5\0\0\1\5\3\0X\6\3Ä+\6\1\0L\6\2\0X\6\4Ä\1\3\5\0X\6\2Ä+\6\2\0L\6\2\0K\0\1\0\b^_+\tfind\nlabel\20completion_item-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\5¿\tbody\15lsp_expandÒ\f\1\0\16\1U\0∏\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0006\2\5\0'\3\6\0B\0\3\3\14\0\0\0X\2\1Ä2\0™Ä9\2\a\1B\2\1\0016\2\4\0006\4\5\0'\5\b\0B\2\3\3\14\0\2\0X\4\1Ä2\0¢Ä6\4\4\0006\6\5\0'\a\t\0B\4\3\3\14\0\4\0X\6\1Ä2\0úÄ9\6\n\0035\b(\0005\t\r\0009\n\v\0039\n\f\n)\f¸ˇB\n\2\2=\n\14\t9\n\v\0039\n\f\n)\f\4\0B\n\2\2=\n\15\t9\n\v\0039\n\16\nB\n\1\2=\n\17\t9\n\v\0039\f\v\0039\f\18\f5\14\21\0009\15\19\0039\15\20\15=\15\22\14B\f\2\0025\r\23\0B\n\3\2=\n\24\t9\n\v\0035\f\26\0009\r\v\0039\r\25\rB\r\1\2=\r\27\f3\r\28\0=\r\29\fB\n\2\2=\n\30\t9\n\v\0039\n\18\n5\f \0009\r\19\0039\r\31\r=\r\22\fB\n\2\2=\n!\t9\n\v\0033\f\"\0005\r#\0B\n\3\2=\n$\t9\n\v\0033\f%\0005\r&\0B\n\3\2=\n'\t=\t\v\b4\t\a\0005\n)\0>\n\1\t5\n*\0>\n\2\t5\n+\0>\n\3\t5\n,\0>\n\4\t5\n-\0>\n\5\t5\n.\0>\n\6\t=\t/\b5\t:\0004\n\t\0009\v0\0039\v1\v9\v2\v>\v\1\n9\v0\0039\v1\v9\v3\v>\v\2\n9\v0\0039\v1\v9\v4\v>\v\3\n3\v5\0>\v\4\n9\v0\0039\v1\v9\v6\v>\v\5\n9\v0\0039\v1\v9\v7\v>\v\6\n9\v0\0039\v1\v9\v8\v>\v\a\n9\v0\0039\v1\v9\v9\v>\v\b\n=\n;\t=\t<\b5\t>\0003\n=\0=\n?\t=\t@\b5\tE\0009\nA\0015\fB\0005\rC\0=\rD\fB\n\2\2=\nF\t=\tG\b5\tH\0=\tI\b5\tJ\0=\tK\bB\6\2\0019\6\n\0039\6L\6'\bM\0005\tP\0009\n0\0039\n/\n4\f\3\0005\rN\0>\r\1\f4\r\3\0005\14O\0>\14\1\rB\n\3\2=\n/\tB\6\3\0019\6\n\0039\6L\6'\bQ\0005\tT\0009\n0\0039\n/\n4\f\3\0005\rR\0>\r\1\f4\r\3\0005\14S\0>\14\1\rB\n\3\2=\n/\tB\6\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0\0¿\1\0\0\1\0\3\19keyword_length\3\1\19max_item_count\3\30\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\6/\fcmdline\18documentation\1\0\2\vborder\frounded\17winhighlight*FloatBorder:FloatBorder,Normal:Normal\17experimental\1\0\2\15ghost_text\2\16native_menu\1\15formatting\vformat\1\0\0\tmenu\1\0\6\fluasnip\v[SNIP]\rnvim_lsp\n[LSP]\rnvim_lua\n[API]\tpath\v[PATH]\nemoji\v[EMOJ]\vbuffer\n[BUF]\1\0\1\14with_text\2\15cmp_format\fsnippet\vexpand\1\0\0\0\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\0\nscore\nexact\voffset\fcompare\vconfig\fsources\1\0\1\tname\nemoji\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\1\0\0\n<A-k>\1\3\0\0\6i\6s\0\n<A-j>\1\3\0\0\6i\6s\0\n<C-q>\1\0\1\vselect\2\fReplace\14<C-space>\6c\0\6i\1\0\0\rcomplete\n<C-y>\1\3\0\0\6i\6c\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\nsetup\fluasnip\bcmp\tinit\flspkind\frequire\npcall#menu,menuone,noselect,noinsert\16completeopt\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nn\0\0\6\0\a\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\4B\2\2\1K\0\1\0\bcss\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\nä\2\0\0\5\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\0019\1\5\0019\1\6\1B\1\1\0026\2\0\0'\4\a\0B\2\2\0029\2\b\2\18\4\1\0B\2\2\2\18\1\2\0005\2\t\0=\1\n\2=\0\2\0025\3\v\0=\3\f\2L\2\2\0\nflags\1\0\1\26debounce_text_changes\3¨\2\17capabilities\1\0\0\24update_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\14on_attach plugins.config.lsp.defaults\frequireÛ\2\0\1\t\0\27\0'6\1\0\0009\1\1\0016\3\2\0009\3\3\3'\4\4\0B\1\3\0026\2\5\0009\2\6\2\18\4\1\0'\5\a\0B\2\3\0016\2\5\0009\2\6\2\18\4\1\0'\5\b\0B\2\3\0015\2\25\0005\3\v\0005\4\n\0=\1\3\4=\4\f\0035\4\14\0005\5\r\0=\5\15\4=\4\16\0035\4\20\0006\5\0\0009\5\17\0059\5\18\5'\a\19\0+\b\2\0B\5\3\2=\5\21\4=\4\22\0035\4\23\0=\4\24\3=\3\26\2=\2\t\0K\0\1\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\rsettings\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvimá\1\0\0\5\3\3\0\25-\0\0\0B\0\1\2-\1\1\0-\2\2\0009\2\0\0028\1\2\1\15\0\1\0X\2\6Ä-\1\1\0-\2\2\0009\2\0\0028\1\2\1\18\3\0\0B\1\2\1-\1\2\0009\1\0\1\a\1\1\0X\1\1ÄK\0\1\0-\1\2\0\18\3\1\0009\1\2\1\18\4\0\0B\1\3\1K\0\1\0\4¿\5¿\f¿\nsetup\15solargraph\tname¯\5\1\0\17\0\"\0S5\0\0\0006\1\1\0\18\3\0\0B\1\2\4H\4\fÄ'\6\2\0\18\a\4\0&\6\a\0066\a\3\0009\a\4\a9\a\5\a\18\t\6\0005\n\6\0=\5\a\n=\6\b\n=\6\t\nB\a\3\1F\4\3\3R\4Ú5\1\n\0006\2\v\0006\4\f\0'\5\r\0B\2\3\3\14\0\2\0X\4\1Ä2\0007Ä9\4\14\0035\6\18\0005\a\16\0005\b\15\0=\b\17\a=\a\19\6B\4\2\0013\4\20\0005\5\22\0003\6\21\0=\6\23\0056\6\1\0\18\b\1\0B\6\2\4H\t\23Ä9\v\24\3\18\r\n\0B\v\2\3\15\0\v\0X\r\17Ä\18\15\f\0009\r\25\f3\16\26\0B\r\3\1\18\15\f\0009\r\27\fB\r\2\2\14\0\r\0X\r\bÄ6\r\28\0'\15\29\0\18\16\n\0&\15\16\15B\r\2\1\18\15\f\0009\r\30\fB\r\2\0012\v\0ÄF\t\3\3R\tÁ6\6\v\0006\b\f\0'\t\31\0B\6\3\3\14\0\6\0X\b\2Ä2\0\0ÄK\0\1\0009\b \a9\b!\b\18\n\4\0B\n\1\0A\b\0\0012\0\0ÄK\0\1\0K\0\1\0\nsetup\15solargraph\14lspconfig\finstall\16Installing \nprint\17is_installed\0\ron_ready\15get_server\16sumneko_lua\1\0\0\0\0\aui\1\0\0\nicons\1\0\0\1\0\3\21server_installed\b‚úì\23server_uninstalled\b‚úó\19server_pending\b‚ûú\rsettings\23nvim-lsp-installer\frequire\npcall\1\v\0\0\vbashls\vclangd\ncssls\rdockerls\thtml\15solargraph\16sumneko_lua\16tailwindcss\rtsserver\vyamlls\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\nError\tÔôô \tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n¨\b\0\0\b\0\29\0,6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\1K\0\1\0)\0022\0007\2\5\0006\2\6\0009\2\a\0029\2\b\2'\4\t\0+\5\1\0B\2\3\0016\2\6\0009\2\a\0029\2\n\2'\4\v\0'\5\f\0'\6\r\0005\a\14\0B\2\5\0016\2\6\0009\2\15\0025\3\17\0005\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\16\0029\2\24\0015\4\25\0005\5\26\0006\6\5\0=\6\27\5=\5\28\4B\2\2\1K\0\1\0\tview\nwidth\1\0\0\1\0\3\18disable_netrw\2\15auto_close\2\17hijack_netrw\2\nsetup\blsp\1\0\4\nerror\bÔÅó\tinfo\bÔÅö\fwarning\bÔÅ±\thint\bÔÅ™\vfolder\1\0\b\17arrow_closed\bÔë†\nempty\bÔÑî\15empty_open\bÔÑï\fsymlink\bÔíÇ\topen\bÓóæ\17symlink_open\bÓóæ\15arrow_open\bÔëº\fdefault\bÓóø\bgit\1\0\a\14untracked\b‚òÖ\runmerged\bÓúß\fdeleted\bÔëò\vstaged\b‚úì\fignored\b‚óå\runstaged\b‚úó\frenamed\b‚ûú\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\20nvim_tree_icons\6g\1\0\2\vsilent\2\fnoremap\2$<cmd>NvimTreeFindFileToggle<CR>\14<Leader>e\6n\20nvim_set_keymapÈ\2                augroup NVIMTREE\n                  autocmd!\n                  autocmd Colorscheme * highlight! NvimTreeNormal guibg=#21252B guifg=#9da5b3\n                  autocmd ColorScheme * highlight! NvimTreeBg guibg=#2B4252\n                  autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg\n                augroup END\n              \14nvim_exec\bapi\bvim\19DEFAULT_OFFSET\21nvim tree not ok\nprint\14nvim-tree\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n©\1\0\0\6\0\b\0\0146\0\0\0'\2\1\0B\0\2\3\14\0\0\0X\2\1ÄK\0\1\0009\2\2\0015\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4B\2\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["overlength.vim"] = {
    config = { "\27LJ\2\nË\1\0\0\5\0\t\0\28)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0016\1\0\0009\1\4\0019\1\5\1'\3\6\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\a\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\b\0\18\4\0\0B\1\3\1K\0\1\0\ash\truby\blua\30overlength#set_overlength\afn(overlength#highlight_to_end_of_line\"overlength#default_overlength\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/overlength.vim",
    url = "https://github.com/tjdevries/overlength.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÑ\1\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0B\1\2\1K\0\1\0\30current_buffer_fuzzy_find\22telescope.builtin\fget_ivy\21telescope.themes\frequire¿\1\0\0\6\0\f\1\0306\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\3\0019\1\6\1'\3\5\0004\4\0\0B\1\3\0016\1\a\0009\1\b\1\18\3\0\0'\4\t\0'\5\n\0B\1\4\2\18\0\1\0006\1\a\0009\1\v\1\18\3\0\0B\1\2\2\t\1\0\0X\1\1Ä+\0\0\0L\0\2\0\blen\5\6\n\tgsub\vstring\vsetreg\6v\vgetreg\afn\22noau normal! \"vy\"\bcmd\bvim\0d\1\0\6\0\6\0\v3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0\18\4\0\0B\4\1\2=\4\5\3B\1\2\1K\0\1\0\vsearch\1\0\0\16grep_string\22telescope.builtin\frequire\0ı\b\1\0\n\0'\0O6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0GÄ9\2\3\0015\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\0045\5\n\0005\6\t\0=\6\v\5=\5\f\4B\2\2\0019\2\r\1'\4\v\0B\2\2\0016\2\14\0009\2\15\0029\2\16\0025\3\17\0003\4\18\0007\4\19\0003\4\20\0007\4\21\0\18\4\2\0'\6\22\0'\a\23\0'\b\24\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a\25\0'\b\26\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a\27\0'\b\28\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a\29\0'\b\30\0\18\t\3\0B\4\5\1\18\4\2\0'\6\31\0'\a\29\0'\b \0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a!\0'\b\"\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a#\0'\b$\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a%\0'\b&\0\18\t\3\0B\4\5\1K\0\1\0K\0\1\0*<CMD>lua CurrentBufferFuzzyFind()<CR>\15<Leader>fc:<CMD>lua require('telescope.builtin').help_tags()<CR>\15<Leader>fh:<CMD>lua require('telescope.builtin').live_grep()<CR>\15<Leader>fl$<CMD>lua GrepStringVisual()<CR>\6x<<CMD>lua require('telescope.builtin').grep_string()<CR>\15<Leader>fs:<CMD>lua require('telescope.builtin').git_files()<CR>\15<Leader>fg8<CMD>lua require('telescope.builtin').buffers()<CR>\15<Leader>fb;<CMD>lua require('telescope.builtin').find_files()<CR>\15<Leader>ff\6n\21GrepStringVisual\0\27CurrentBufferFuzzyFind\0\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\bfzf\1\0\0\1\0\3\25override_file_sorter\2\28override_generic_sorter\1\nfuzzy\2\rdefaults\1\0\0\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\1\0\1\18prompt_prefix\a$ \nsetup\14telescope\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-autoswap"] = {
    config = { "\27LJ\2\nk\0\0\2\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\25autoswap_detect_tmux\16titlestring\aon\ntitle\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-autoswap",
    url = "https://github.com/gioele/vim-autoswap"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-dispatch-neovim",
    url = "https://github.com/radenling/vim-dispatch-neovim"
  },
  ["vim-projectionist"] = {
    config = { "\27LJ\2\n≤\t\0\0\b\0,\0?6\0\0\0009\0\1\0005\1\30\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\14\0005\4\15\0=\4\f\3=\3\16\0025\3\17\0005\4\18\0=\4\f\3=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\2=\2\31\1=\1\2\0006\0\0\0009\0 \0009\0!\0005\1\"\0\18\2\0\0'\4#\0'\5$\0'\6%\0\18\a\1\0B\2\5\1\18\2\0\0'\4#\0'\5&\0'\6'\0\18\a\1\0B\2\5\1\18\2\0\0'\4#\0'\5(\0'\6)\0\18\a\1\0B\2\5\1\18\2\0\0'\4#\0'\5*\0'\6+\0\18\a\1\0B\2\5\1K\0\1\0\f:AT<CR>\15<leader>at\f:AS<CR>\15<leader>as\f:AV<CR>\15<leader>av\v:A<CR>\15<leader>aa\6n\1\0\1\vsilent\2\20nvim_set_keymap\bapi\fGemfile\1\0\0\30spec/lib/tasks/{}_spec.rb\1\0\2\14alternate\22lib/tasks/{}.rake\ttype\ttest\21lib/tasks/*.rake\1\0\2\14alternate\30spec/lib/tasks/{}_spec.rb\ttype\vsource\24spec/lib/{}_spec.rb\1\0\2\14alternate\14lib/{}.rb\ttype\ttest\rlib/*.rb\1\0\2\14alternate\24spec/lib/{}_spec.rb\ttype\vsource\"spec/views/*.html.erb_spec.rb\1\0\2\14alternate\26app/views/{}.html.erb\ttype\ttest\30spec/components/*_spec.rb\1\3\0\0\25app/components/{}.rb\31app/components/{}.html.erb\1\0\1\ttype\14component\30app/components/*.html.erb\1\3\0\0\31spec/components/{}_spec.rb\25app/components/{}.rb\1\0\1\ttype\14component\24app/components/*.rb\14alternate\1\3\0\0\31app/components/{}.html.erb\31spec/components/{}_spec.rb\1\0\1\ttype\14component\25app/views/*.html.erb\1\0\2\14alternate#spec/views/{}.html.erb_spec.rb\ttype\vsource\19spec/*_spec.rb\1\0\2\14alternate\14app/{}.rb\ttype\ttest\rapp/*.rb\1\0\0\1\0\2\14alternate\20spec/{}_spec.rb\ttype\vsource\29projectionist_heuristics\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n˛\2\0\0\b\0\18\0'6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\1K\0\1\0\23<CMD>TestVisit<CR>\15<leader>tv\22<CMD>TestLast<CR>\15<leader>tl\23<CMD>TestSuite<CR>\15<leader>ts\22<CMD>TestFile<CR>\15<leader>tf\25<CMD>TestNearest<CR>\15<leader>tn\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\vneovim\18test#strategy\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-tmux-navigator"] = {
    config = { "\27LJ\2\n›\2\0\0\b\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1K\0\1\0\31<CMD>TmuxNavigateRight<CR>\n<C-l>\28<CMD>TmuxNavigateUp<CR>\n<C-k>\30<CMD>TmuxNavigateDown<CR>\n<C-j>\30<CMD>TmuxNavigateLeft<CR>\n<C-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi'tmux_navigator_disable_when_zoomed\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nπ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nn\0\0\6\0\a\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\4B\2\2\1K\0\1\0\bcss\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\npcall\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n©\1\0\0\6\0\b\0\0146\0\0\0'\2\1\0B\0\2\3\14\0\0\0X\2\1ÄK\0\1\0009\2\2\0015\4\3\0005\5\4\0=\5\5\0045\5\6\0=\5\a\4B\2\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÀ\1\0\0\5\0\b\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0019\2\4\0025\4\5\0B\2\2\0016\2\1\0'\4\6\0B\2\2\0029\2\a\2B\2\1\1K\0\1\0\14lazy_load luasnip/loaders/from_vscode\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\npcall\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\1\4\0\t6\0\0\0009\0\1\0009\0\2\0B\0\1\1-\0\0\0\18\2\0\0009\0\3\0B\0\2\1K\0\1\0\2¿\vtoggle\25nvim_get_current_buf\bapi\bvim’\4\1\0\v\0\24\00015\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0016\1\1\0'\3\6\0B\1\2\2\18\4\1\0009\2\a\1B\2\2\2\18\5\2\0009\3\3\0025\6\b\0=\0\5\6B\3\3\0013\3\t\0007\3\n\0006\3\v\0009\3\f\0039\3\r\0035\4\14\0\18\5\3\0'\a\15\0'\b\16\0'\t\17\0\18\n\4\0B\5\5\1\18\5\3\0'\a\18\0'\b\16\0'\t\19\0\18\n\4\0B\5\5\1\18\5\3\0'\a\15\0'\b\20\0'\t\21\0\18\n\4\0B\5\5\0016\5\v\0009\5\22\5'\a\23\0B\5\2\0012\0\0ÄK\0\1\0000highlight VertSplit guibg=NONE ctermbg=NONE\bcmd <CMD>lua FTermLazyGit()<CR>\14<Leader>g5<C-\\><C-n><CMD>lua require(\"FTerm\").toggle()<CR>\6t+<CMD>lua require(\"FTerm\").toggle()<CR>\n<C-t>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\17FTermLazyGit\0\1\0\2\vborder\vsingle\bcmd\flazygit\bnew\19FTerm.terminal\15dimensions\1\0\1\vborder\vsingle\nsetup\nFTerm\frequire\1\0\4\6x\4\0ÄÄÄˇ\3\nwidth\4Õô≥Ê\fÃô≥ˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\6y\4\0ÄÄÄˇ\3\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nq\0\1\4\1\4\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\bÄ-\1\0\0009\1\1\0015\3\2\0B\1\2\2\14\0\1\0X\1\5ÄK\0\1\0X\1\3Ä-\1\0\0009\1\3\1B\1\1\1K\0\1\0\3¿\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleÕ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\5¿\0\0\21select_prev_item\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\5¿\tjump\rjumpable\21select_prev_item\fvisibleñ\1\0\2\b\0\4\0\0289\2\0\0009\2\1\2\18\4\2\0009\2\2\2'\5\3\0B\2\3\0039\4\0\0019\4\1\4\18\6\4\0009\4\2\4'\a\3\0B\4\3\3\14\0\3\0X\6\1Ä)\3\0\0\14\0\5\0X\6\1Ä)\5\0\0\1\5\3\0X\6\3Ä+\6\1\0L\6\2\0X\6\4Ä\1\3\5\0X\6\2Ä+\6\2\0L\6\2\0K\0\1\0\b^_+\tfind\nlabel\20completion_item-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\5¿\tbody\15lsp_expandÒ\f\1\0\16\1U\0∏\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0006\2\5\0'\3\6\0B\0\3\3\14\0\0\0X\2\1Ä2\0™Ä9\2\a\1B\2\1\0016\2\4\0006\4\5\0'\5\b\0B\2\3\3\14\0\2\0X\4\1Ä2\0¢Ä6\4\4\0006\6\5\0'\a\t\0B\4\3\3\14\0\4\0X\6\1Ä2\0úÄ9\6\n\0035\b(\0005\t\r\0009\n\v\0039\n\f\n)\f¸ˇB\n\2\2=\n\14\t9\n\v\0039\n\f\n)\f\4\0B\n\2\2=\n\15\t9\n\v\0039\n\16\nB\n\1\2=\n\17\t9\n\v\0039\f\v\0039\f\18\f5\14\21\0009\15\19\0039\15\20\15=\15\22\14B\f\2\0025\r\23\0B\n\3\2=\n\24\t9\n\v\0035\f\26\0009\r\v\0039\r\25\rB\r\1\2=\r\27\f3\r\28\0=\r\29\fB\n\2\2=\n\30\t9\n\v\0039\n\18\n5\f \0009\r\19\0039\r\31\r=\r\22\fB\n\2\2=\n!\t9\n\v\0033\f\"\0005\r#\0B\n\3\2=\n$\t9\n\v\0033\f%\0005\r&\0B\n\3\2=\n'\t=\t\v\b4\t\a\0005\n)\0>\n\1\t5\n*\0>\n\2\t5\n+\0>\n\3\t5\n,\0>\n\4\t5\n-\0>\n\5\t5\n.\0>\n\6\t=\t/\b5\t:\0004\n\t\0009\v0\0039\v1\v9\v2\v>\v\1\n9\v0\0039\v1\v9\v3\v>\v\2\n9\v0\0039\v1\v9\v4\v>\v\3\n3\v5\0>\v\4\n9\v0\0039\v1\v9\v6\v>\v\5\n9\v0\0039\v1\v9\v7\v>\v\6\n9\v0\0039\v1\v9\v8\v>\v\a\n9\v0\0039\v1\v9\v9\v>\v\b\n=\n;\t=\t<\b5\t>\0003\n=\0=\n?\t=\t@\b5\tE\0009\nA\0015\fB\0005\rC\0=\rD\fB\n\2\2=\nF\t=\tG\b5\tH\0=\tI\b5\tJ\0=\tK\bB\6\2\0019\6\n\0039\6L\6'\bM\0005\tP\0009\n0\0039\n/\n4\f\3\0005\rN\0>\r\1\f4\r\3\0005\14O\0>\14\1\rB\n\3\2=\n/\tB\6\3\0019\6\n\0039\6L\6'\bQ\0005\tT\0009\n0\0039\n/\n4\f\3\0005\rR\0>\r\1\f4\r\3\0005\14S\0>\14\1\rB\n\3\2=\n/\tB\6\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0\0¿\1\0\0\1\0\3\19keyword_length\3\1\19max_item_count\3\30\tname\fcmdline\1\0\1\tname\tpath\6:\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\6/\fcmdline\18documentation\1\0\2\vborder\frounded\17winhighlight*FloatBorder:FloatBorder,Normal:Normal\17experimental\1\0\2\15ghost_text\2\16native_menu\1\15formatting\vformat\1\0\0\tmenu\1\0\6\fluasnip\v[SNIP]\rnvim_lsp\n[LSP]\rnvim_lua\n[API]\tpath\v[PATH]\nemoji\v[EMOJ]\vbuffer\n[BUF]\1\0\1\14with_text\2\15cmp_format\fsnippet\vexpand\1\0\0\0\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\0\nscore\nexact\voffset\fcompare\vconfig\fsources\1\0\1\tname\nemoji\1\0\2\19keyword_length\3\5\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\1\0\0\n<A-k>\1\3\0\0\6i\6s\0\n<A-j>\1\3\0\0\6i\6s\0\n<C-q>\1\0\1\vselect\2\fReplace\14<C-space>\6c\0\6i\1\0\0\rcomplete\n<C-y>\1\3\0\0\6i\6c\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\nsetup\fluasnip\bcmp\tinit\flspkind\frequire\npcall#menu,menuone,noselect,noinsert\16completeopt\6g\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\4\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\31\0'\3\3\0B\0\3\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0+\2\2\0B\0\2\1K\0\1\0\14find_file\14nvim-tree\rFileTree\15set_offset\21bufferline.state\frequirek\0\0\3\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0B\0\1\1K\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequireã\2\1\0\b\0\15\0\0296\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\0014\2\0\0003\3\f\0=\3\v\0023\3\14\0=\3\r\0022\0\0ÄL\2\2\0\0\nclose\0\topen\25<CMD>BufferClose<CR>\n<A-x>\28<CMD>BufferPrevious<CR>\f<S-TAB>\24<CMD>BufferNext<CR>\n<TAB>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\4\0\5\0\f6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0026\1\0\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0B\1\2\1K\0\1\0\30current_buffer_fuzzy_find\22telescope.builtin\fget_ivy\21telescope.themes\frequire¿\1\0\0\6\0\f\1\0306\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\3\0019\1\6\1'\3\5\0004\4\0\0B\1\3\0016\1\a\0009\1\b\1\18\3\0\0'\4\t\0'\5\n\0B\1\4\2\18\0\1\0006\1\a\0009\1\v\1\18\3\0\0B\1\2\2\t\1\0\0X\1\1Ä+\0\0\0L\0\2\0\blen\5\6\n\tgsub\vstring\vsetreg\6v\vgetreg\afn\22noau normal! \"vy\"\bcmd\bvim\0d\1\0\6\0\6\0\v3\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0\18\4\0\0B\4\1\2=\4\5\3B\1\2\1K\0\1\0\vsearch\1\0\0\16grep_string\22telescope.builtin\frequire\0ı\b\1\0\n\0'\0O6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0GÄ9\2\3\0015\4\a\0005\5\4\0005\6\5\0=\6\6\5=\5\b\0045\5\n\0005\6\t\0=\6\v\5=\5\f\4B\2\2\0019\2\r\1'\4\v\0B\2\2\0016\2\14\0009\2\15\0029\2\16\0025\3\17\0003\4\18\0007\4\19\0003\4\20\0007\4\21\0\18\4\2\0'\6\22\0'\a\23\0'\b\24\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a\25\0'\b\26\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a\27\0'\b\28\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a\29\0'\b\30\0\18\t\3\0B\4\5\1\18\4\2\0'\6\31\0'\a\29\0'\b \0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a!\0'\b\"\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a#\0'\b$\0\18\t\3\0B\4\5\1\18\4\2\0'\6\22\0'\a%\0'\b&\0\18\t\3\0B\4\5\1K\0\1\0K\0\1\0*<CMD>lua CurrentBufferFuzzyFind()<CR>\15<Leader>fc:<CMD>lua require('telescope.builtin').help_tags()<CR>\15<Leader>fh:<CMD>lua require('telescope.builtin').live_grep()<CR>\15<Leader>fl$<CMD>lua GrepStringVisual()<CR>\6x<<CMD>lua require('telescope.builtin').grep_string()<CR>\15<Leader>fs:<CMD>lua require('telescope.builtin').git_files()<CR>\15<Leader>fg8<CMD>lua require('telescope.builtin').buffers()<CR>\15<Leader>fb;<CMD>lua require('telescope.builtin').find_files()<CR>\15<Leader>ff\6n\21GrepStringVisual\0\27CurrentBufferFuzzyFind\0\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\19load_extension\15extensions\bfzf\1\0\0\1\0\3\25override_file_sorter\2\28override_generic_sorter\1\nfuzzy\2\rdefaults\1\0\0\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\1\0\1\18prompt_prefix\a$ \nsetup\14telescope\frequire\npcall\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\në\5\0\0\a\0\19\0\0256\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\v\0005\5\5\0005\6\4\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0=\6\n\5=\5\f\0045\5\r\0005\6\14\0=\6\15\0055\6\16\0=\6\17\5=\5\18\4B\2\2\1K\0\1\0\fkeymaps\tn [c\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]c\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\3\16n <leader>b=<cmd>lua require\"gitsigns\".blame_line{ full = true }<CR>\fnoremap\2\vbuffer\2\nsigns\1\0\1\23current_line_blame\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\6-\ahl\19GitSignsChange\vchange\1\0\4\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ttext\6+\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\npcall\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nÎ\3\0\0\15\0\24\00106\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0019\2\4\0026\3\5\0'\4\6\0&\3\4\0036\4\1\0'\6\a\0B\4\2\0029\4\b\0049\5\t\0015\a\22\0004\b\4\0009\t\n\0029\t\v\t5\v\14\0005\f\f\0'\r\r\0\18\14\3\0&\r\14\r>\r\2\f=\f\15\vB\t\2\2>\t\1\b9\t\16\0029\t\v\t5\v\18\0005\f\17\0=\f\15\vB\t\2\2>\t\2\b9\t\19\0029\t\v\t5\v\21\0005\f\20\0=\f\15\vB\t\2\0?\t\0\0=\b\23\a=\4\b\aB\5\2\1K\0\1\0\fsources\1\0\0\1\0\0\1\a\0\0\t-i=2\b-bn\b-ci\a-s\b-sr\b-kp\nshfmt\1\0\0\1\3\0\0\27--quote-props preserve\19--parser json5\rprettier\15extra_args\1\0\0\14--config=\1\2\0\0\15--in-place\twith\15lua_format\nsetup\14on_attach plugins.config.lsp.defaults*/dotfiles/lua/luaformatter/config.yml\tHOME\15formatting\rbuiltins\fnull-ls\frequire\npcall\aÄÄ¿ô\4\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-base16
time([[Config for nvim-base16]], true)
try_loadstring("\27LJ\2\nm\0\3\a\2\4\0\0159\3\0\1\15\0\3\0X\4\tÄ-\3\0\0'\5\1\0-\6\1\0009\6\2\6&\5\6\5B\3\2\1-\3\0\0'\5\3\0B\3\2\1\18\3\2\0B\3\1\1K\0\1\0\4¿\3¿\18PackerCompile\rfilename\fsource \vchangeÈ\4\1\0\f\0\28\0C6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0;Ä6\2\1\0'\4\3\0B\2\2\2\18\5\2\0009\3\4\0025\6\6\0006\a\5\0>\a\1\6B\3\3\0026\4\a\0009\4\b\4\18\a\3\0009\5\t\3B\5\2\2\15\0\5\0X\6\15Ä\18\5\4\0'\a\n\0009\b\v\3&\a\b\aB\5\2\0019\5\f\0019\a\v\0035\b\15\0006\t\a\0009\t\r\t3\v\14\0B\t\2\2=\t\16\bB\5\3\1X\5\3Ä\18\5\4\0'\a\17\0B\5\2\1\18\5\4\0'\a\18\0B\5\2\1\18\5\4\0'\a\19\0B\5\2\1\18\5\4\0'\a\20\0B\5\2\0016\5\0\0006\a\1\0'\b\21\0B\5\3\3\14\0\5\0X\a\2Ä2\0\0ÄK\0\1\0009\a\22\0069\b\23\0065\t\26\0009\n\25\a=\n\27\t=\t\24\b2\0\0ÄK\0\1\0K\0\1\0\nguifg\1\0\1\nguibg\tnone\vbase04\15SignColumn\14highlight\vcolors\23base16-colorscheme&hi Normal guibg=NONE ctermbg=NONE6hi CursorLineNr guibg=none guifg=#98c379 gui=bold\25hi LineNr guibg=none$colorscheme base16_default-dark\ron_event\1\0\0\0\18schedule_wrap\nwatch\rfilename\fsource \vexists\bcmd\bvim\1\3\0\0\0\22.vimrc_background\tHOME\bnew\17plenary.path\vfwatch\frequire\npcall\0", "config", "nvim-base16")
time([[Config for nvim-base16]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n˛\2\0\0\b\0\18\0'6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0009\0\5\0005\1\6\0\18\2\0\0'\4\a\0'\5\b\0'\6\t\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\n\0'\6\v\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\14\0'\6\15\0\18\a\1\0B\2\5\1\18\2\0\0'\4\a\0'\5\16\0'\6\17\0\18\a\1\0B\2\5\1K\0\1\0\23<CMD>TestVisit<CR>\15<leader>tv\22<CMD>TestLast<CR>\15<leader>tl\23<CMD>TestSuite<CR>\15<leader>ts\22<CMD>TestFile<CR>\15<leader>tf\25<CMD>TestNearest<CR>\15<leader>tn\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\vneovim\18test#strategy\6g\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n˝\1\0\0\6\0\t\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\4B\2\2\1K\0\1\0\21filetype_exclude\1\6\0\0\rNvimTree\14dashboard\thelp\flspinfo\vpacker\20buftype_exclude\1\4\0\0\rterminal\vpacker\vnofile\1\0\2\21show_end_of_line\2\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\npcall\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\n|\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: vim-tmux-navigator
time([[Config for vim-tmux-navigator]], true)
try_loadstring("\27LJ\2\n›\2\0\0\b\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0005\1\5\0\18\2\0\0'\4\6\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1\18\2\0\0'\4\6\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1K\0\1\0\31<CMD>TmuxNavigateRight<CR>\n<C-l>\28<CMD>TmuxNavigateUp<CR>\n<C-k>\30<CMD>TmuxNavigateDown<CR>\n<C-j>\30<CMD>TmuxNavigateLeft<CR>\n<C-h>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi'tmux_navigator_disable_when_zoomed\6g\bvim\0", "config", "vim-tmux-navigator")
time([[Config for vim-tmux-navigator]], false)
-- Config for: vim-projectionist
time([[Config for vim-projectionist]], true)
try_loadstring("\27LJ\2\n≤\t\0\0\b\0,\0?6\0\0\0009\0\1\0005\1\30\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0005\4\v\0=\4\f\3=\3\r\0025\3\14\0005\4\15\0=\4\f\3=\3\16\0025\3\17\0005\4\18\0=\4\f\3=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\2=\2\31\1=\1\2\0006\0\0\0009\0 \0009\0!\0005\1\"\0\18\2\0\0'\4#\0'\5$\0'\6%\0\18\a\1\0B\2\5\1\18\2\0\0'\4#\0'\5&\0'\6'\0\18\a\1\0B\2\5\1\18\2\0\0'\4#\0'\5(\0'\6)\0\18\a\1\0B\2\5\1\18\2\0\0'\4#\0'\5*\0'\6+\0\18\a\1\0B\2\5\1K\0\1\0\f:AT<CR>\15<leader>at\f:AS<CR>\15<leader>as\f:AV<CR>\15<leader>av\v:A<CR>\15<leader>aa\6n\1\0\1\vsilent\2\20nvim_set_keymap\bapi\fGemfile\1\0\0\30spec/lib/tasks/{}_spec.rb\1\0\2\14alternate\22lib/tasks/{}.rake\ttype\ttest\21lib/tasks/*.rake\1\0\2\14alternate\30spec/lib/tasks/{}_spec.rb\ttype\vsource\24spec/lib/{}_spec.rb\1\0\2\14alternate\14lib/{}.rb\ttype\ttest\rlib/*.rb\1\0\2\14alternate\24spec/lib/{}_spec.rb\ttype\vsource\"spec/views/*.html.erb_spec.rb\1\0\2\14alternate\26app/views/{}.html.erb\ttype\ttest\30spec/components/*_spec.rb\1\3\0\0\25app/components/{}.rb\31app/components/{}.html.erb\1\0\1\ttype\14component\30app/components/*.html.erb\1\3\0\0\31spec/components/{}_spec.rb\25app/components/{}.rb\1\0\1\ttype\14component\24app/components/*.rb\14alternate\1\3\0\0\31app/components/{}.html.erb\31spec/components/{}_spec.rb\1\0\1\ttype\14component\25app/views/*.html.erb\1\0\2\14alternate#spec/views/{}.html.erb_spec.rb\ttype\vsource\19spec/*_spec.rb\1\0\2\14alternate\14app/{}.rb\ttype\ttest\rapp/*.rb\1\0\0\1\0\2\14alternate\20spec/{}_spec.rb\ttype\vsource\29projectionist_heuristics\6g\bvim\0", "config", "vim-projectionist")
time([[Config for vim-projectionist]], false)
-- Config for: overlength.vim
time([[Config for overlength.vim]], true)
try_loadstring("\27LJ\2\nË\1\0\0\5\0\t\0\28)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0016\1\0\0009\1\4\0019\1\5\1'\3\6\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\a\0\18\4\0\0B\1\3\0016\1\0\0009\1\4\0019\1\5\1'\3\b\0\18\4\0\0B\1\3\1K\0\1\0\ash\truby\blua\30overlength#set_overlength\afn(overlength#highlight_to_end_of_line\"overlength#default_overlength\6g\bvim\0", "config", "overlength.vim")
time([[Config for overlength.vim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\2\nƒ\6\0\0\5\0!\0+6\0\0\0009\0\1\0006\1\2\0'\3\3\0B\1\2\0029\1\4\0016\2\6\0009\2\a\2\21\4\1\0B\2\2\0028\2\2\1=\2\5\0005\2\f\0005\3\n\0005\4\t\0=\4\v\3=\3\r\0025\3\15\0005\4\14\0=\4\v\3=\3\16\0025\3\18\0005\4\17\0=\4\v\3=\3\19\0025\3\21\0005\4\20\0=\4\v\3=\3\22\0025\3\24\0005\4\23\0=\4\v\3=\3\25\0025\3\27\0005\4\26\0=\4\v\3=\3\28\2=\2\b\0'\2\30\0=\2\29\0005\2 \0=\2\31\0K\0\1\0\1\2\0\0004'Do one thing, and do it well.' Unix philosophy\28dashboard_custom_footer\14telescope dashboard_default_executive\17zedit_config\1\0\1\fcommand%Telescope fd cwd=$HOME/dotfiles/\1\2\0\0\27Ôê•  Edit config      \18file_explorer\1\0\1\fcommand\17NvimTreeOpen\1\2\0\0\28Ôêî  Open File Explorer\fhistory\1\0\1\fcommand\25DashboardFindHistory\1\2\0\0\28Ôú°  History           \17last_session\1\0\1\fcommand\16SessionLoad\1\2\0\0\28Ôë§  Load Last Session \rfindfile\1\0\1\fcommand\22DashboardFindFile\1\2\0\0\28ÔÖú  Find File         \fnewfile\1\0\0\16description\1\0\1\fcommand\21DashboardNewFile\1\2\0\0\28ÔÖõ  New File          \29dashboard_custom_section\vrandom\tmath\28dashboard_custom_header\fheaders%plugins.config.dashboard.headers\frequire\6g\bvim\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n†\2\0\0\r\0\14\0\0316\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\0016\2\0\0006\4\1\0'\5\5\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0006\4\1\0'\6\6\0B\4\2\0029\5\a\3\18\a\5\0009\5\b\5'\b\t\0009\t\n\0045\v\f\0005\f\v\0=\f\r\vB\t\2\0A\5\2\1K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\1\0\1\30enable_check_bracket_line\1\nsetup\19nvim-autopairs\frequire\npcall\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n¨\b\0\0\b\0\29\0,6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\1K\0\1\0)\0022\0007\2\5\0006\2\6\0009\2\a\0029\2\b\2'\4\t\0+\5\1\0B\2\3\0016\2\6\0009\2\a\0029\2\n\2'\4\v\0'\5\f\0'\6\r\0005\a\14\0B\2\5\0016\2\6\0009\2\15\0025\3\17\0005\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\16\0029\2\24\0015\4\25\0005\5\26\0006\6\5\0=\6\27\5=\5\28\4B\2\2\1K\0\1\0\tview\nwidth\1\0\0\1\0\3\18disable_netrw\2\15auto_close\2\17hijack_netrw\2\nsetup\blsp\1\0\4\nerror\bÔÅó\tinfo\bÔÅö\fwarning\bÔÅ±\thint\bÔÅ™\vfolder\1\0\b\17arrow_closed\bÔë†\nempty\bÔÑî\15empty_open\bÔÑï\fsymlink\bÔíÇ\topen\bÓóæ\17symlink_open\bÓóæ\15arrow_open\bÔëº\fdefault\bÓóø\bgit\1\0\a\14untracked\b‚òÖ\runmerged\bÓúß\fdeleted\bÔëò\vstaged\b‚úì\fignored\b‚óå\runstaged\b‚úó\frenamed\b‚ûú\1\0\2\fsymlink\bÔíÅ\fdefault\bÓòí\20nvim_tree_icons\6g\1\0\2\vsilent\2\fnoremap\2$<cmd>NvimTreeFindFileToggle<CR>\14<Leader>e\6n\20nvim_set_keymapÈ\2                augroup NVIMTREE\n                  autocmd!\n                  autocmd Colorscheme * highlight! NvimTreeNormal guibg=#21252B guifg=#9da5b3\n                  autocmd ColorScheme * highlight! NvimTreeBg guibg=#2B4252\n                  autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg\n                augroup END\n              \14nvim_exec\bapi\bvim\19DEFAULT_OFFSET\21nvim tree not ok\nprint\14nvim-tree\frequire\npcall\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: vim-autoswap
time([[Config for vim-autoswap]], true)
try_loadstring("\27LJ\2\nk\0\0\2\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\25autoswap_detect_tmux\16titlestring\aon\ntitle\6g\bvim\0", "config", "vim-autoswap")
time([[Config for vim-autoswap]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-lspconfig ]]
vim.cmd [[ packadd nvim-lsp-installer ]]

-- Config for: nvim-lsp-installer
try_loadstring("\27LJ\2\nä\2\0\0\5\0\r\0\0226\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0009\1\4\0019\1\5\0019\1\6\1B\1\1\0026\2\0\0'\4\a\0B\2\2\0029\2\b\2\18\4\1\0B\2\2\2\18\1\2\0005\2\t\0=\1\n\2=\0\2\0025\3\v\0=\3\f\2L\2\2\0\nflags\1\0\1\26debounce_text_changes\3¨\2\17capabilities\1\0\0\24update_capabilities\17cmp_nvim_lsp\29make_client_capabilities\rprotocol\blsp\bvim\14on_attach plugins.config.lsp.defaults\frequireÛ\2\0\1\t\0\27\0'6\1\0\0009\1\1\0016\3\2\0009\3\3\3'\4\4\0B\1\3\0026\2\5\0009\2\6\2\18\4\1\0'\5\a\0B\2\3\0016\2\5\0009\2\6\2\18\4\1\0'\5\b\0B\2\3\0015\2\25\0005\3\v\0005\4\n\0=\1\3\4=\4\f\0035\4\14\0005\5\r\0=\5\15\4=\4\16\0035\4\20\0006\5\0\0009\5\17\0059\5\18\5'\a\19\0+\b\2\0B\5\3\2=\5\21\4=\4\22\0035\4\23\0=\4\24\3=\3\26\2=\2\t\0K\0\1\0\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\rsettings\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\bvimá\1\0\0\5\3\3\0\25-\0\0\0B\0\1\2-\1\1\0-\2\2\0009\2\0\0028\1\2\1\15\0\1\0X\2\6Ä-\1\1\0-\2\2\0009\2\0\0028\1\2\1\18\3\0\0B\1\2\1-\1\2\0009\1\0\1\a\1\1\0X\1\1ÄK\0\1\0-\1\2\0\18\3\1\0009\1\2\1\18\4\0\0B\1\3\1K\0\1\0\4¿\5¿\f¿\nsetup\15solargraph\tname¯\5\1\0\17\0\"\0S5\0\0\0006\1\1\0\18\3\0\0B\1\2\4H\4\fÄ'\6\2\0\18\a\4\0&\6\a\0066\a\3\0009\a\4\a9\a\5\a\18\t\6\0005\n\6\0=\5\a\n=\6\b\n=\6\t\nB\a\3\1F\4\3\3R\4Ú5\1\n\0006\2\v\0006\4\f\0'\5\r\0B\2\3\3\14\0\2\0X\4\1Ä2\0007Ä9\4\14\0035\6\18\0005\a\16\0005\b\15\0=\b\17\a=\a\19\6B\4\2\0013\4\20\0005\5\22\0003\6\21\0=\6\23\0056\6\1\0\18\b\1\0B\6\2\4H\t\23Ä9\v\24\3\18\r\n\0B\v\2\3\15\0\v\0X\r\17Ä\18\15\f\0009\r\25\f3\16\26\0B\r\3\1\18\15\f\0009\r\27\fB\r\2\2\14\0\r\0X\r\bÄ6\r\28\0'\15\29\0\18\16\n\0&\15\16\15B\r\2\1\18\15\f\0009\r\30\fB\r\2\0012\v\0ÄF\t\3\3R\tÁ6\6\v\0006\b\f\0'\t\31\0B\6\3\3\14\0\6\0X\b\2Ä2\0\0ÄK\0\1\0009\b \a9\b!\b\18\n\4\0B\n\1\0A\b\0\0012\0\0ÄK\0\1\0K\0\1\0\nsetup\15solargraph\14lspconfig\finstall\16Installing \nprint\17is_installed\0\ron_ready\15get_server\16sumneko_lua\1\0\0\0\0\aui\1\0\0\nicons\1\0\0\1\0\3\21server_installed\b‚úì\23server_uninstalled\b‚úó\19server_pending\b‚ûú\rsettings\23nvim-lsp-installer\frequire\npcall\1\v\0\0\vbashls\vclangd\ncssls\rdockerls\thtml\15solargraph\16sumneko_lua\16tailwindcss\rtsserver\vyamlls\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\nError\tÔôô \tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \0", "config", "nvim-lsp-installer")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
