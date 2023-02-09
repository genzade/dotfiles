-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

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
    config = { "\27LJ\2\n∆\1\0\0\6\1\n\0\0206\0\0\0'\2\1\0B\0\2\2\18\3\0\0009\1\2\0B\1\2\2\18\3\1\0009\1\3\0015\4\4\0-\5\0\0=\5\5\4B\1\3\0026\2\6\0009\2\a\0029\2\b\2B\2\1\1\18\4\1\0009\2\t\1B\2\2\1K\0\1\0\0¿\vtoggle\25nvim_get_current_buf\bapi\bvim\15dimensions\1\0\2\bcmd\flazygit\vborder\vsingle\nsetup\bnew\19FTerm.terminal\frequire˚\4\1\0\n\0\30\00075\0\0\0006\1\1\0006\3\2\0'\4\3\0B\1\3\3\14\0\1\0X\3\4Ä6\3\4\0'\5\5\0B\3\2\0012\0*Ä9\3\6\0025\5\a\0=\0\b\5B\3\2\0016\3\1\0006\5\2\0'\6\t\0B\3\3\3\14\0\3\0X\5\1Ä2\0 Ä9\5\n\0045\a\r\0005\b\f\0009\t\v\2>\t\1\b=\b\14\a5\b\15\0B\5\3\0016\5\16\0003\6\18\0=\6\17\0059\5\n\0045\a\20\0005\b\19\0009\t\v\2>\t\1\b=\b\14\a5\b\22\0005\t\21\0=\t\23\b=\b\24\aB\5\2\0016\5\25\0009\5\26\0059\5\27\5)\a\0\0'\b\28\0005\t\29\0B\5\4\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\1\0\1\abg\tNONE\14VertSplit\16nvim_set_hl\bapi\bvim\r<Leader>\6g\1\0\0\1\3\0\0%<CMD>lua _G.lazygit_toggle()<CR>\26Open Lazygit terminal\1\0\0\1\3\0\0\0\29Toggle built in terminal\0\19lazygit_toggle\a_G\1\0\1\tmode\6t\n<C-t>\1\0\0\1\3\0\0\0\29Toggle built in terminal\vtoggle\rregister\14which-key\15dimensions\1\0\1\vborder\vsingle\nsetup7fterm not ok .....................................\nprint\nFTerm\frequire\npcall\1\0\4\nwidth\4Õô≥Ê\fÃô≥ˇ\3\6y\4\0ÄÄÄˇ\3\6x\4\0ÄÄÄˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\0" },
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
    config = { "\27LJ\2\nq\0\0\4\1\a\0\v6\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\5Ä-\0\0\0009\0\4\0006\2\5\0'\3\6\0B\0\3\1K\0\1\0\3¿\rFileTree\19FILETREE_WIDTH\15set_offset\rNvimTree\rfiletype\abo\bvimy\0\0\4\1\a\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\18\2\0\0009\0\4\0'\3\5\0B\0\3\2\15\0\0\0X\1\4Ä-\0\0\0009\0\6\0)\2\0\0B\0\2\1K\0\1\0\3¿\15set_offset\rNvimTree\nmatch\f<afile>\vexpand\afn\bvim´\4\1\0\t\0\25\0/6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0&Ä9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0B\2\3\0016\2\0\0006\4\1\0'\5\f\0B\2\3\3\14\0\2\0X\4\4Ä6\4\r\0'\6\14\0B\4\2\0012\0\19Ä6\4\15\0009\4\16\0049\4\17\4'\6\18\0005\a\19\0003\b\20\0=\b\21\aB\4\3\0016\4\15\0009\4\16\0049\4\17\4'\6\22\0005\a\23\0003\b\24\0=\b\21\aB\4\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\0\1\0\1\fpattern\6*\16BufWinLeave\rcallback\0\1\0\1\fpattern\6*\16BufWinEnter\24nvim_create_autocmd\bapi\bvim6bufferline_api not ok ...........................\nprint\19bufferline.api\1\0\1\tmode\6n\f<S-TAB>\1\3\0\0\28<CMD>BufferPrevious<CR>\26Go to previous buffer\n<TAB>\1\3\0\0\24<CMD>BufferNext<CR>\22Go to next buffer\n<A-x>\1\0\0\1\3\0\0\25<CMD>BufferClose<CR>\21Close the buffer\rregister\14which-key\frequire\npcall\0" },
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
  ["cmp-nvim-lsp-document-symbol"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
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
  ["cmp-rg"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    config = { "\27LJ\2\nl\0\0\6\0\6\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1'\4\4\0005\5\5\0B\2\3\1K\0\1\0\1\2\0\0\nrails\truby\20filetype_extend\fluasnip\frequire\npcall\0" },
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
    config = { "\27LJ\2\n#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2Ä'\0\3\0002\0\aÄ6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0ÄL\0\2\0L\0\2\0\1¿\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1¿\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\1¿\6~\rdiffthis’\t\1\1\v\0J\0{6\1\0\0009\1\1\0019\1\2\0016\2\3\0006\4\4\0'\5\5\0B\2\3\3\14\0\2\0X\4\1Ä2\0pÄ9\4\6\0035\6\v\0005\a\a\0005\b\t\0003\t\b\0>\t\1\b=\b\n\a=\a\f\0065\a\r\0=\0\14\aB\4\3\0019\4\6\0035\6\18\0005\a\15\0005\b\17\0003\t\16\0>\t\1\b=\b\n\a=\a\19\0065\a\20\0=\0\14\aB\4\3\0019\4\6\0035\6\30\0005\a\28\0005\b\21\0005\t\23\0009\n\22\1>\n\1\t=\t\24\b5\t\26\0009\n\25\1>\n\1\t=\t\27\b=\b\29\a=\a\31\0065\a \0=\0\14\aB\4\3\0019\4\6\0035\6@\0005\a<\0005\b!\0005\t\"\0009\n\22\1>\n\1\t=\t\24\b5\t#\0009\n\25\1>\n\1\t=\t\27\b5\t%\0009\n$\1>\n\1\t=\t&\b5\t(\0009\n'\1>\n\1\t=\t)\b5\t+\0009\n*\1>\n\1\t=\t,\b5\t.\0009\n-\1>\n\1\t=\t/\b5\t1\0003\n0\0>\n\1\t=\t2\b5\t4\0009\n3\1>\n\1\t=\t5\b5\t7\0009\n6\1>\n\1\t=\t8\b5\t:\0003\n9\0>\n\1\t=\t;\b=\b\29\a5\b>\0009\t=\1>\t\1\b=\b?\a=\a\31\0065\aA\0=\0\14\aB\4\3\0019\4\6\0035\6D\0005\aC\0009\bB\1>\b\1\a=\aE\0065\aF\0=\0\14\aB\4\3\0019\4\6\0035\6H\0005\aG\0009\bB\1>\b\1\a=\aE\0065\aI\0=\0\14\aB\4\3\0012\0\0ÄK\0\1\0K\0\1\0\1\0\1\tmode\6x\1\0\0\1\3\0\0\0\22Select inner hunk\1\0\1\tmode\6o\aih\1\0\0\1\3\0\0\0\22Select inner hunk\16select_hunk\1\0\1\tmode\6n\1\0\0\6l\1\3\0\0\0\19Toggle deleted\19toggle_deleted\1\0\0\6D\1\3\0\0\0\15Git diff ~\0\6d\1\3\0\0\0\rGit diff\rdiffthis\6B\1\3\0\0\0\21Git blame toggle\30toggle_current_line_blame\6b\1\3\0\0\0\14Git blame\0\6S\1\3\0\0\0\17Stage buffer\17stage_buffer\6p\1\3\0\0\0\17Preview hunk\17preview_hunk\6R\1\3\0\0\0\17Reset buffer\17reset_buffer\6u\1\3\0\0\0\21Undo staged hunk\20undo_stage_hunk\1\3\0\0\0\15Reset hunk\1\3\0\0\0\15Stage hunk\1\0\1\tname\rgitsigns\1\0\1\tmode\6v\r<Leader>\1\0\0\6h\1\0\0\6r\1\3\0\0\0\24Reset hunk (visual)\15reset_hunk\6s\1\3\0\0\0\24Stage hunk (visual)\15stage_hunk\1\0\1\tname\rgitsigns\1\0\1\tmode\6n\6[\1\0\0\1\3\0\0\0\24Go to previous hunk\0\1\0\1\tname\rgitsigns\vbuffer\1\0\1\tmode\6n\6]\1\0\0\6c\1\3\0\0\0\20Go to next hunk\0\1\0\1\tname\rgitsigns\rregister\14which-key\frequire\npcall\rgitsigns\vloaded\fpackageΩ\5\1\0\b\0\28\00026\0\0\0009\0\1\0009\0\2\0006\1\3\0006\3\4\0'\4\5\0B\1\3\3\14\0\1\0X\3\1Ä2\0'Ä\18\3\0\0)\5\0\0'\6\6\0005\a\a\0B\3\4\1\18\3\0\0)\5\0\0'\6\b\0005\a\t\0B\3\4\1\18\3\0\0)\5\0\0'\6\n\0005\a\v\0B\3\4\1\18\3\0\0)\5\0\0'\6\f\0005\a\r\0B\3\4\1\18\3\0\0)\5\0\0'\6\14\0005\a\15\0B\3\4\0019\3\16\0025\5\24\0005\6\18\0005\a\17\0=\a\19\0065\a\20\0=\a\21\0065\a\22\0=\a\23\6=\6\25\0053\6\26\0=\6\27\5B\3\2\1K\0\1\0K\0\1\0\14on_attach\0\nsigns\1\0\1\23current_line_blame\2\17changedelete\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\6-\vchange\1\0\4\vlinehl\21GitSignsChangeLn\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\ttext\b‚îÇ\badd\1\0\0\1\0\4\vlinehl\18GitSignsAddLn\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\ttext\6+\nsetup\1\0\2\afg\tNONE\abg\tNONE\14VertSplit\1\0\2\afg\bRed\abg\tNONE\19GitSignsDelete\1\0\2\afg\vYellow\abg\tNONE\19GitSignsChange\1\0\2\afg\nGreen\abg\tNONE\16GitSignsAdd\1\0\2\afg\tNONE\abg\tNONE\15SignColumn\rgitsigns\frequire\npcall\16nvim_set_hl\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n∆\a\0\0\n\0$\0B6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\0016\2\0\0006\4\1\0'\5\5\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0009\4\6\0035\6\17\0005\a\16\0005\b\a\0005\t\b\0=\t\t\b5\t\n\0=\t\v\b5\t\f\0=\t\r\b5\t\14\0=\t\15\b=\b\r\a=\a\18\0065\a\19\0B\4\3\0019\4\6\0035\6\26\0005\a\25\0005\b\20\0005\t\21\0=\t\t\b5\t\22\0=\t\v\b5\t\23\0=\t\r\b5\t\24\0=\t\15\b=\b\r\a=\a\18\0065\a\27\0B\4\3\0019\4\6\0035\6\"\0005\a!\0005\b\28\0005\t\29\0=\t\t\b5\t\30\0=\t\v\b5\t\31\0=\t\r\b5\t \0=\t\15\b=\b\r\a=\a\18\0065\a#\0B\4\3\1K\0\1\0\1\0\1\tmode\6o\1\0\0\1\0\0\1\3\0\0\25<CMD>HopAnywhere<CR>\24Hop anywhere window\1\3\0\0\21<CMD>HopWord<CR>\15Hop window\1\3\0\0$<CMD>HopAnywhereCurrentLine<CR>\22Hop anywhere line\1\3\0\0 <CMD>HopWordCurrentLine<CR>\rHop line\1\0\1\tname\t+Hop\1\0\1\tmode\6v\1\0\0\1\0\0\1\3\0\0\25<CMD>HopAnywhere<CR>\24Hop anywhere window\1\3\0\0\21<CMD>HopWord<CR>\15Hop window\1\3\0\0$<CMD>HopAnywhereCurrentLine<CR>\22Hop anywhere line\1\3\0\0 <CMD>HopWordCurrentLine<CR>\rHop line\1\0\1\tname\t+Hop\1\0\1\tmode\6n\r<Leader>\1\0\0\1\0\0\6S\1\3\0\0\25<CMD>HopAnywhere<CR>\24Hop anywhere window\6s\1\3\0\0\21<CMD>HopWord<CR>\15Hop window\6L\1\3\0\0$<CMD>HopAnywhereCurrentLine<CR>\22Hop anywhere line\6l\1\3\0\0 <CMD>HopWordCurrentLine<CR>\rHop line\1\0\1\tname\t+Hop\rregister\14which-key\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\ní\2\0\0\6\0\t\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\4B\2\2\1K\0\1\0\21filetype_exclude\1\t\0\0\rNvimTree\14dashboard\fstartup\thelp\flspinfo\rmarkdown\vpacker\btxt\20buftype_exclude\1\4\0\0\rterminal\vpacker\vnofile\1\0\2\21show_end_of_line\2\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    config = { "\27LJ\2\nÛ\1\0\0\a\0\f\0\0216\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1'\4\4\0005\5\5\0B\2\3\0019\2\6\1B\2\1\0016\2\a\0009\2\b\0029\2\t\2)\4\0\0'\5\n\0005\6\v\0B\2\4\1K\0\1\0\1\0\1\vitalic\2\fComment\16nvim_set_hl\bapi\bvim\26use_extended_mappings\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\npcall\0" },
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
    config = { "\27LJ\2\nå\3\0\0\a\0\23\0\0306\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\1K\0\1\0009\2\5\0015\4\a\0005\5\6\0=\5\b\0045\5\n\0005\6\t\0=\6\v\0055\6\f\0=\6\r\0055\6\14\0=\6\15\0055\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\4B\2\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup/lualine not ok ...........................\nprint\flualine\frequire\npcall\0" },
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
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-null-ls.nvim"] = {
    config = { "\27LJ\2\nÅ\1\0\0\5\0\5\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\1K\0\1\0\1\0\2\27automatic_installation\2\20automatic_setup\2\nsetup\18mason-null-ls\frequire\npcall\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/mason-null-ls.nvim",
    url = "https://github.com/jayp0521/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    after = { "mason-null-ls.nvim" },
    config = { "\27LJ\2\nù\b\0\0\20\0002\2s6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\3\0'\3\4\0&\2\3\0029\3\5\0019\3\6\0039\4\5\0019\4\a\0049\5\5\0019\5\b\0059\6\5\0019\6\t\0066\a\1\0'\t\n\0B\a\2\0026\b\1\0'\n\v\0B\b\2\0029\b\f\b9\t\r\0015\v0\0004\f\15\0009\r\14\3>\r\1\f9\r\15\0049\r\16\r5\15\18\0005\16\17\0=\16\19\15B\r\2\2>\r\2\f9\r\20\0059\r\16\r5\15\22\0005\16\21\0=\16\19\15B\r\2\2>\r\3\f9\r\23\5>\r\4\f9\r\24\5>\r\5\f9\r\25\5>\r\6\f9\r\26\0059\r\16\r5\15\27\0006\16\28\0009\16\29\0165\18\30\0009\19\5\0019\19\b\0199\19\26\0199\19\31\0199\19 \19B\16\3\2=\16 \15B\r\2\2>\r\a\f9\r!\5>\r\b\f9\r\14\5>\r\t\f9\r\"\0069\r\16\r5\15&\0005\16#\0006\17\28\0009\17$\0179\17%\17\18\19\2\0B\17\2\0?\17\0\0=\16'\15B\r\2\2>\r\n\f9\r(\0069\r\16\r5\15*\0005\16)\0=\16'\0159\16+\aB\16\1\2=\16,\15B\r\2\2>\r\v\f9\r-\6>\r\f\f9\r\25\6>\r\r\f9\r\26\0069\r\16\r5\15.\0006\16\28\0009\16\29\0165\18/\0009\19\5\0019\19\t\0199\19\26\0199\19\31\0199\19 \19B\16\3\2=\16 \15B\r\2\0?\r\1\0=\f1\v=\b\f\vB\t\2\1K\0\1\0\fsources\1\0\0\1\3\0\0\texec\frubocop\1\0\1\fcommand\vbundle\16shellharden\20dynamic_command\22from_node_modules\1\0\0\1\3\0\0\27--quote-props preserve\19--parser json5\rprettier\15extra_args\1\0\0\vexpand\afn\1\2\0\0\18--config-path\vstylua\ryamllint\targs\n_opts\1\3\0\0\texec\frubocop\16list_extend\bvim\1\0\1\fcommand\vbundle\frubocop\rerb_lint\rhadolint\17markdownlint\1\0\0\1\3\0\0\rmarkdown\btxt\14codespell\14filetypes\1\0\0\1\3\0\0\rmarkdown\btxt\twith\nspell\15shellcheck\nsetup\14on_attach'genzade.plugins.lspconfig.defaults%null-ls.helpers.command_resolver\15formatting\16diagnostics\15completion\17code_actions\rbuiltins\17/stylua.toml\16CONFIG_PATH\fnull-ls\frequire\npcall\5ÄÄ¿ô\4\29ÄÄ¿ô\4\0" },
    loaded = true,
    only_config = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nÄ\2\0\0\v\0\v\0\0286\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\0016\2\0\0006\4\1\0'\5\5\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0006\4\1\0'\6\6\0B\4\2\0029\5\a\3\18\a\5\0009\5\b\5'\b\t\0009\t\n\4B\t\1\0A\5\2\1K\0\1\0\20on_confirm_done\17confirm_done\aon\nevent\"nvim-autopairs.completion.cmp\bcmp\1\0\1\30enable_check_bracket_line\1\nsetup\19nvim-autopairs\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-base16"] = {
    config = { "\27LJ\2\nè\1\0\3\b\2\5\0\0199\3\0\1\15\0\3\0X\4\rÄ-\3\0\0005\5\1\0004\6\3\0-\a\1\0009\a\2\a>\a\1\6=\6\3\0054\6\0\0B\3\3\1-\3\0\0005\5\4\0004\6\0\0B\3\3\1\18\3\2\0B\3\1\1K\0\1\0\4¿\3¿\1\0\1\bcmd\18PackerCompile\targs\rfilename\1\0\1\bcmd\vsource\vchange¡\5\1\0\r\0#\0S6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0KÄ6\2\1\0'\4\3\0B\2\2\2\18\5\2\0009\3\4\0025\6\6\0006\a\5\0>\a\1\6B\3\3\0026\4\a\0009\4\b\0049\4\t\0046\5\a\0009\5\b\0059\5\n\5\18\b\3\0009\6\v\3B\6\2\2\15\0\6\0X\a\18Ä\18\6\4\0005\b\f\0004\t\3\0009\n\r\3>\n\1\t=\t\14\b4\t\0\0B\6\3\0019\6\15\0019\b\r\0035\t\18\0006\n\a\0009\n\16\n3\f\17\0B\n\2\2=\n\19\tB\6\3\1X\6\6Ä\18\6\4\0005\b\20\0005\t\21\0=\t\14\b4\t\0\0B\6\3\1\18\6\5\0)\b\0\0'\t\22\0005\n\23\0B\6\4\1\18\6\5\0)\b\0\0'\t\24\0005\n\25\0B\6\4\1\18\6\5\0)\b\0\0'\t\26\0005\n\27\0B\6\4\0016\6\0\0006\b\1\0'\t\28\0B\6\3\3\14\0\6\0X\b\2Ä2\0\0ÄK\0\1\0009\b\29\a9\t\30\a5\n!\0009\v \b=\v\"\n=\n\31\t2\0\0ÄK\0\1\0K\0\1\0\nguifg\1\0\1\nguibg\tNONE\vbase04\15SignColumn\14highlight\vcolors\23base16-colorscheme\1\0\2\fctermbg\tNONE\abg\tNONE\vNormal\1\0\3\tbold\2\abg\tNONE\afg\f#98c379\17CursorLineNr\1\0\1\abg\tNONE\vLineNr\1\2\0\0\20base16-ayu-dark\1\0\1\bcmd\16colorscheme\ron_event\1\0\0\0\18schedule_wrap\nwatch\targs\rfilename\1\0\1\bcmd\vsource\vexists\16nvim_set_hl\rnvim_cmd\bapi\bvim\1\3\0\0\0\22.vimrc_background\tHOME\bnew\17plenary.path\vfwatch\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nq\0\1\4\1\4\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\bÄ-\1\0\0009\1\1\0015\3\2\0B\1\2\2\14\0\1\0X\1\5ÄK\0\1\0X\1\3Ä-\1\0\0009\1\3\1B\1\1\1K\0\1\0\1¿\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleÕ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\0\0\21select_prev_item\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\tjump\rjumpable\21select_prev_item\fvisibleñ\1\0\2\b\0\4\0\0289\2\0\0009\2\1\2\18\4\2\0009\2\2\2'\5\3\0B\2\3\0039\4\0\0019\4\1\4\18\6\4\0009\4\2\4'\a\3\0B\4\3\3\14\0\3\0X\6\1Ä)\3\0\0\14\0\5\0X\6\1Ä)\5\0\0\1\5\3\0X\6\3Ä+\6\1\0L\6\2\0X\6\4Ä\1\3\5\0X\6\2Ä+\6\2\0L\6\2\0K\0\1\0\b^_+\tfind\nlabel\20completion_item-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expand \15\1\0\16\1d\0ﬂ\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0006\2\5\0'\3\6\0B\0\3\3\14\0\0\0X\2\1Ä2\0—Ä6\2\4\0006\4\5\0'\5\a\0B\2\3\3\14\0\2\0X\4\1Ä2\0ÀÄ6\4\4\0006\6\5\0'\a\b\0B\4\3\3\14\0\4\0X\6\1Ä2\0≈Ä9\6\t\5B\6\1\0019\6\n\0015\b2\0005\t\r\0009\n\v\0019\n\f\n=\n\14\t9\n\15\0019\n\16\n5\f\19\0009\r\17\0019\r\18\r=\r\20\fB\n\2\2=\n\21\t9\n\15\0019\n\22\n5\f\23\0009\r\17\0019\r\18\r=\r\20\fB\n\2\2=\n\24\t9\n\15\0019\n\25\n)\f¸ˇB\n\2\2=\n\26\t9\n\15\0019\n\25\n)\f\4\0B\n\2\2=\n\27\t9\n\15\0019\n\28\nB\n\1\2=\n\29\t9\n\15\0019\f\15\0019\f\30\f5\14 \0009\15\31\0019\15\18\15=\15\20\14B\f\2\0025\r!\0B\n\3\2=\n\"\t9\n\15\0015\f$\0009\r\15\0019\r#\rB\r\1\2=\r%\f3\r&\0=\r'\fB\n\2\2=\n(\t9\n\15\0019\n\30\n5\f*\0009\r\31\0019\r)\r=\r\20\fB\n\2\2=\n+\t9\n\15\0013\f,\0005\r-\0B\n\3\2=\n.\t9\n\15\0013\f/\0005\r0\0B\n\3\2=\n1\t=\t\15\b4\t\t\0005\n3\0>\n\1\t5\n4\0>\n\2\t5\n5\0>\n\3\t5\n6\0>\n\4\t5\n7\0>\n\5\t5\n8\0>\n\6\t5\n9\0>\n\a\t5\n:\0>\n\b\t=\t;\b5\tE\0004\n\t\0009\v\v\0019\v<\v9\v=\v>\v\1\n9\v\v\0019\v<\v9\v>\v>\v\2\n9\v\v\0019\v<\v9\v?\v>\v\3\n3\v@\0>\v\4\n9\v\v\0019\v<\v9\vA\v>\v\5\n9\v\v\0019\v<\v9\vB\v>\v\6\n9\v\v\0019\v<\v9\vC\v>\v\a\n9\v\v\0019\v<\v9\vD\v>\v\b\n=\nF\t=\tG\b5\tI\0003\nH\0=\nJ\t=\tK\b5\tP\0009\nL\0055\fM\0005\rN\0=\rO\fB\n\2\2=\nQ\t=\tR\b5\tS\0=\tT\b5\tX\0009\n\v\0019\nU\n9\nV\n5\fW\0B\n\2\2=\nY\t=\tU\bB\6\2\0019\6\n\0019\6Z\6'\b[\0005\t]\0009\n\15\0019\n\\\n9\nZ\nB\n\1\2=\n\15\t9\n\v\0019\n;\n4\f\3\0005\r^\0>\r\1\f4\r\3\0005\14_\0>\14\1\rB\n\3\2=\n;\tB\6\3\0019\6\n\0019\6Z\6'\b`\0005\ta\0009\n\15\0019\n\\\n9\nZ\nB\n\1\2=\n\15\t9\n\v\0019\n;\n4\f\3\0005\rb\0>\r\1\f4\r\3\0005\14c\0>\14\1\rB\n\3\2=\n;\tB\6\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0\0¿\1\0\3\19keyword_length\3\1\19max_item_count\3\30\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\1\0\0\vpreset\6/\fcmdline\18documentation\1\0\0\1\0\1\17winhighlightONormal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSelection,Search:None\rbordered\vwindow\17experimental\1\0\2\16native_menu\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\6\fluasnip\v[SNIP]\rnvim_lsp\n[LSP]\rnvim_lua\n[API]\vbuffer\n[BUF]\tpath\v[PATH]\nemoji\v[EMOJ]\1\0\1\14with_text\2\15cmp_format\fsnippet\vexpand\1\0\0\0\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\0\nscore\nexact\voffset\fcompare\fsources\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\tname\arg\19keyword_length\3\3\1\0\1\tname\nemoji\1\0\2\tname\vbuffer\19keyword_length\3\4\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\1\0\0\n<A-k>\1\3\0\0\6i\6s\0\n<A-j>\1\3\0\0\6i\6s\0\n<C-q>\1\0\1\vselect\2\fReplace\14<C-space>\6c\0\6i\1\0\0\rcomplete\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\2\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-f>\n<C-d>\16scroll_docs\n<C-p>\1\0\0\21select_prev_item\n<C-n>\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\fmapping\n<tab>\1\0\0\fdisable\vconfig\nsetup\tinit\flspkind\fluasnip\bcmp\frequire\npcall#menu,menuone,noselect,noinsert\16completeopt\6g\bvim\0" },
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
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nU\0\1\5\3\4\0\n-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3-\4\2\0=\4\3\3B\1\2\1K\0\1\0\6¿\t¿\bÄ\17capabilities\14on_attach\1\0\0\nsetup®\2\0\0\n\3\22\0\29-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\2-\3\2\0=\3\4\0025\3\19\0005\4\b\0005\5\6\0005\6\5\0=\6\a\5=\5\t\0045\5\14\0006\6\n\0009\6\v\0069\6\f\6'\b\r\0+\t\2\0B\6\3\2=\6\15\5=\5\16\0045\5\17\0=\5\18\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\6¿\t¿\bÄ\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\17capabilities\14on_attach\1\0\0\nsetup\16sumneko_luaΩ\a\1\0\16\0(\0Z5\0\0\0006\1\1\0\18\3\0\0B\1\2\4H\4\fÄ'\6\2\0\18\a\4\0&\6\a\0066\a\3\0009\a\4\a9\a\5\a\18\t\6\0005\n\6\0=\5\a\n=\6\b\n=\6\t\nB\a\3\1F\4\3\3R\4Ú\1276\1\n\0006\3\v\0'\4\f\0B\1\3\3\14\0\1\0X\3\1Ä2\0<Ä9\3\r\0025\5\17\0005\6\15\0005\a\14\0=\a\16\6=\6\18\5B\3\2\0016\3\n\0006\5\v\0'\6\19\0B\3\3\3\14\0\3\0X\5\1Ä2\0/Ä6\5\n\0006\a\v\0'\b\20\0B\5\3\3\14\0\5\0X\a\1Ä2\0)Ä5\a\21\0009\b\r\0045\n\22\0=\a\23\nB\b\2\0016\b\3\0009\b\24\b9\b\25\b9\b\26\bB\b\1\0029\t\27\b9\t\28\t9\t\29\t+\n\2\0=\n\30\t6\t\v\0'\v\31\0B\t\2\0029\t \t6\n\n\0006\f\v\0'\r!\0B\n\3\3\14\0\n\0X\f\1Ä2\0\16Ä9\f\"\v\18\14\b\0B\f\2\2\18\b\f\0009\f#\0045\14&\0003\15$\0>\15\1\0143\15%\0=\15'\14B\f\2\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0\16sumneko_lua\1\0\0\0\0\19setup_handlers\25default_capabilities\17cmp_nvim_lsp\14on_attach'genzade.plugins.lspconfig.defaults\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\21ensure_installed\1\0\1\22automatic_install\2\1\r\0\0\vbashls\vclangd\ncssls\rdockerls\thtml\15solargraph\16sumneko_lua\16tailwindcss\ntaplo\16terraformls\rtsserver\vyamlls\14lspconfig\20mason-lspconfig\aui\1\0\0\nicons\1\0\0\1\0\3\24package_uninstalled\b‚úó\20package_pending\b‚ûú\22package_installed\b‚úì\nsetup\nmason\frequire\npcall\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \nError\tÔôô \0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\nO\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\fneoclip\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\nK\0\4\t\1\3\0\a5\4\0\0-\5\0\0009\a\1\0019\b\2\0028\b\b\4B\5\3\1K\0\1\0\1¿\ttype\fmessage\1\5\0\0\nerror\twarn\tinfo\tinfo€\1\1\0\5\0\n\0\0216\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä2\0\rÄX\2\2Ä6\2\3\0=\1\2\0029\2\4\0015\4\5\0B\2\2\0016\2\3\0009\2\6\0029\2\a\0023\3\t\0=\3\b\0022\0\0ÄK\0\1\0K\0\1\0\0\23window/showMessage\rhandlers\blsp\1\0\4\ftimeout\3∏\23\vstages\vstatic\bfps\3<\22background_colour\16FloatShadow\nsetup\bvim\vnotify\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\nU\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\18nvim-surround\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tmux-navigation"] = {
    config = { "\27LJ\2\n∂\3\0\0\t\0\21\0&6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\0016\2\0\0006\4\1\0'\5\5\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0009\4\6\0035\6\t\0005\a\b\0009\b\a\1>\b\1\a=\a\n\0065\a\f\0009\b\v\1>\b\1\a=\a\r\0065\a\15\0009\b\14\1>\b\1\a=\a\16\0065\a\18\0009\b\17\1>\b\1\a=\a\19\0065\a\20\0B\4\3\1K\0\1\0\1\0\1\tmode\6n\n<C-l>\1\3\0\0\0\19Navigate Right\26NvimTmuxNavigateRight\n<C-k>\1\3\0\0\0\16Navigate Up\23NvimTmuxNavigateUp\n<C-j>\1\3\0\0\0\18Navigate Down\25NvimTmuxNavigateDown\n<C-h>\1\0\0\1\3\0\0\0\18Navigate Left\25NvimTmuxNavigateLeft\rregister\14which-key\1\0\1\24disable_when_zoomed\2\nsetup\25nvim-tmux-navigation\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-tmux-navigation",
    url = "https://github.com/alexghergh/nvim-tmux-navigation"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    config = { "\27LJ\2\nv\0\0\5\1\4\0\v-\0\0\0)\2\0\0'\3\0\0005\4\1\0B\0\4\1-\0\0\0)\2\0\0'\3\2\0005\4\3\0B\0\4\1K\0\1\0\4¿\1\0\1\abg\f#2B4252\15NvimTreeBg\1\0\2\afg\f#9da5b3\abg\f#21252B\19NvimTreeNormalb\0\0\5\0\5\0\b6\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0'\4\4\0B\0\4\1K\0\1\0\22Normal:NvimTreeBg\17winhighlight\24nvim_win_set_option\bapi\bvimµ\6\1\0\15\0(\0I6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\0012\0>Ä6\2\5\0009\2\6\0029\2\a\0026\3\5\0009\3\6\0039\3\b\0036\4\5\0009\4\6\0049\4\t\4\18\5\2\0'\a\n\0005\b\v\0B\5\3\2\18\6\3\0'\b\f\0005\t\r\0=\5\14\t3\n\15\0=\n\16\tB\6\3\1\18\6\3\0'\b\17\0005\t\18\0=\5\14\t3\n\19\0=\n\16\tB\6\3\0016\6\0\0006\b\1\0'\t\20\0B\6\3\3\14\0\6\0X\b\2Ä2\0\0ÄK\0\1\0009\b\21\a5\n\25\0005\v\22\0005\f\23\0=\f\24\v=\v\26\n5\v\27\0B\b\3\0019\b\28\0015\n\29\0005\v\30\0006\f\31\0=\f \v5\f!\0004\r\4\0005\14\"\0>\14\1\r5\14#\0>\14\2\r5\14$\0>\14\3\r=\r%\f=\f&\v=\v'\nB\b\2\0012\0\0ÄK\0\1\0K\0\1\0\tview\rmappings\tlist\1\0\2\vaction\vdir_up\bkey\6u\1\0\2\vaction\frefresh\bkey\6R\1\0\2\vaction\acd\bkey\6C\1\0\1\16custom_only\1\nwidth\19FILETREE_WIDTH\1\0\1 preserve_window_proportions\2\1\0\1\18disable_netrw\2\nsetup\1\0\1\tmode\6n\r<Leader>\1\0\0\6e\1\3\0\0$<CMD>NvimTreeFindFileToggle<CR>\20NvimTree toggle\1\0\1\tname\rNvimTree\rregister\14which-key\0\1\0\1\fpattern\rNvimTree\rFileType\rcallback\0\ngroup\1\0\1\fpattern\6*\16Colorscheme\1\0\1\nclear\1\rNVIMTREE\16nvim_set_hl\24nvim_create_autocmd\24nvim_create_augroup\bapi\bvim8nvim tree not ok ..................................\nprint\14nvim-tree\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treehopper"] = {
    config = { "\27LJ\2\n\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nnodes\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nnodes\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nnodesæ\2\1\0\b\0\20\0%6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\29Ä9\2\3\0015\3\5\0=\3\4\0026\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0003\6\v\0005\a\f\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\r\0'\5\14\0003\6\15\0005\a\16\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\17\0'\5\r\0003\6\18\0005\a\19\0B\2\5\0012\0\0ÄK\0\1\0K\0\1\0\1\0\1\tdesc\19Select ts node\0\6o\1\0\1\tdesc\19Select ts node\0\14<leader>m\6n\1\0\1\tdesc\19Select ts node\0\6m\6x\bset\vkeymap\bvim\1\n\0\0\6h\6j\6f\6d\6n\6v\6s\6l\6a\14hint_keys\vconfig\ttsht\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-treehopper",
    url = "https://github.com/mfussenegger/nvim-treehopper"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\nº\a\0\0\t\0)\0/6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\16\0005\6\t\0005\a\v\0005\b\n\0=\b\f\a5\b\r\0=\b\14\a=\a\15\6=\6\17\0055\6\18\0005\a\20\0005\b\19\0=\b\21\a5\b\22\0=\b\23\a5\b\24\0=\b\25\a5\b\26\0=\b\27\a=\a\28\6=\6\29\0055\6\30\0005\a \0005\b\31\0=\b!\a=\a\"\0065\a$\0005\b#\0=\b%\a=\a&\6=\6'\5=\5(\4B\2\2\1K\0\1\0\16textobjects\tswap\18swap_previous\14<leader>A\1\0\0\1\0\2\tdesc!Swap with previous parameter\nquery\21@parameter.inner\14swap_next\14<leader>a\1\0\0\1\0\2\tdesc\29Swap with next parameter\nquery\21@parameter.inner\1\0\1\venable\2\vselect\fkeymaps\aic\1\0\2\tdesc(Select inner part of a class region\nquery\17@class.inner\aac\1\0\2\tdesc\27Select around function\nquery\17@class.outer\aif\1\0\2\tdesc\26Select inner function\nquery\20@function.inner\aaf\1\0\0\1\0\2\tdesc\27Select around function\nquery\20@function.outer\1\0\1\venable\2\16lsp_interop\1\0\0\25peek_definition_code\15<leader>dF\1\0\2\tdesc\15Peek class\nquery\17@class.outer\15<leader>df\1\0\0\1\0\2\tdesc\18Peek function\nquery\20@function.outer\1\0\2\venable\2\vborder\tnone\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\npcall\0" },
    loaded = true,
    only_config = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["overlength.vim"] = {
    config = { '\27LJ\2\nÅ\2\0\0\v\0\b\0\23)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0015\1\4\0006\2\5\0\18\4\1\0B\2\2\4X\5\6Ä6\a\0\0009\a\6\a9\a\a\a\18\t\6\0\18\n\0\0B\a\3\1E\5\3\3R\5¯\127K\0\1\0\30overlength#set_overlength\afn\vipairs\1\t\0\0\bcss\thtml\15javascript\blua\rmarkdown\truby\tscss\ash(overlength#highlight_to_end_of_line"overlength#default_overlength\6g\bvim\0' },
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
  ["startup.nvim"] = {
    config = { "\27LJ\2\nÄ\1\0\0\5\1\6\1\0206\0\0\0009\0\1\0006\2\2\0009\2\3\2B\2\1\0A\0\0\0016\0\0\0009\0\4\0B\0\1\2-\1\0\0\21\1\1\0\"\0\1\0-\1\0\0006\2\0\0009\2\5\2\18\4\0\0B\2\2\2\22\2\0\0028\1\2\1L\1\2\0\2¿\nfloor\vrandom\nclock\aos\15randomseed\tmath\2v\0\0\6\0\a\0\19'\0\0\0006\1\1\0009\1\2\1'\3\3\0B\1\2\2&\0\1\0'\1\4\0006\2\1\0009\2\2\2'\4\5\0B\2\2\2&\1\2\0014\2\3\0\18\3\0\0'\4\6\0\18\5\1\0&\3\5\3>\3\1\2L\2\2\0\6 \r%d-%m-%y\tÔâ¥ \n%H:%M\tdate\aos\tÔê∫ Œ\v\1\0\n\0$\0;6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0003Ä6\2\1\0'\4\3\0B\2\2\0029\2\4\0029\3\5\0015\5\t\0005\6\6\0003\a\a\0=\a\b\6=\6\n\0055\6\v\0004\a\a\0005\b\f\0>\b\1\a5\b\r\0>\b\2\a5\b\14\0>\b\3\a5\b\15\0>\b\4\a5\b\16\0>\b\5\a5\b\17\0>\b\6\a=\a\b\6=\6\18\0055\6\19\0006\a\1\0'\t\20\0B\a\2\0029\a\21\aB\a\1\2=\a\b\6=\6\22\0055\6\23\0003\a\24\0=\a\b\6=\6\25\0055\6\26\0005\a\27\0=\a\28\6=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\0055\6\"\0=\6#\5B\3\2\0012\0\0ÄK\0\1\0K\0\1\0\nparts\1\5\0\0\vheader\tbody\ffooter1\ffooter2\vcolors\1\0\2\15background\f#1f2227\19folded_section\f#56b6c2\rmappings\1\0\5\17open_section\n<TAB>\20open_file_split\n<c-o>\14open_file\6o\20execute_command\t<CR>\14open_help\6?\foptions\rpaddings\1\5\0\0\3\1\3\3\3\3\3\1\1\0\4\24disable_statuslines\2!empty_lines_between_mappings\2\18cursor_column\4\0ÄÄÄˇ\3\17mapping_keys\2\ffooter2\0\1\0\t\ntitle\5\20oldfiles_amount\3\n\18default_color\f#FFFFFF\ttype\ttext\vmargin\3\5\17fold_section\1\14highlight\rTSString\nalign\vcenter\23oldfiles_directory\1\ffooter1\nquote\22startup.functions\1\0\t\ntitle\vFooter\20oldfiles_amount\3\0\18default_color\5\ttype\ttext\vmargin\3\5\17fold_section\1\14highlight\vNumber\nalign\vcenter\23oldfiles_directory\1\tbody\1\4\0\0\19Ôôô  Quit NVIM\aqa\6q\1\4\0\0\18ÔÖõ  New File&lua require('startup').new_file()\6N\1\4\0\0\22Óà´  Colorschemes\26Telescope colorscheme\acs\1\4\0\0\22Ôë§  Recent Files\23Telescope oldfiles\aof\1\4\0\0\19Ô°à  Find Word\24Telescope live_grep\afl\1\4\0\0\19ÔÖú  Find File\25Telescope find_files\aff\1\0\t\ntitle\19Basic Commands\20oldfiles_amount\3\0\18default_color\5\ttype\fmapping\vmargin\3\5\17fold_section\1\14highlight\vString\nalign\vcenter\23oldfiles_directory\1\vheader\1\0\0\fcontent\0\1\0\t\ntitle\vHeader\20oldfiles_amount\3\0\18default_color\5\ttype\ttext\vmargin\3\5\17fold_section\1\14highlight\14Statement\nalign\vcenter\23oldfiles_directory\1\nsetup\fheaders)genzade.plugins.startup.content_bank\fstartup\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/startup.nvim",
    url = "https://github.com/startup-nvim/startup.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n~\0\0\6\1\5\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0-\2\0\0009\2\3\0029\4\4\1B\4\1\0A\2\0\1K\0\1\0\3¿\fget_ivy\30current_buffer_fuzzy_find\21telescope.themes\frequire\npcall3\0\0\2\1\2\0\6-\0\0\0009\0\0\0009\0\1\0009\0\1\0B\0\1\1K\0\1\0\1¿\vnotify\15extensions¿\1\0\0\6\0\f\1\0306\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0009\0\4\0'\2\5\0B\0\2\0026\1\0\0009\1\3\0019\1\6\1'\3\5\0004\4\0\0B\1\3\0016\1\a\0009\1\b\1\18\3\0\0'\4\t\0'\5\n\0B\1\4\2\18\0\1\0006\1\a\0009\1\v\1\18\3\0\0B\1\2\2\t\1\0\0X\1\1Ä+\0\0\0L\0\2\0\blen\5\6\n\tgsub\vstring\vsetreg\6v\vgetreg\afn\22noau normal! \"vy\"\bcmd\bvim\0D\1\0\6\1\4\0\t3\0\0\0-\1\0\0009\1\1\0015\3\2\0\18\4\0\0B\4\1\2=\4\3\3B\1\2\1K\0\1\0\3¿\vsearch\1\0\0\16grep_string\0“\v\1\0\r\0G\0|6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\0012\0oÄ9\2\5\0015\4\t\0005\5\6\0005\6\a\0=\6\b\5=\5\n\0045\5\f\0005\6\v\0=\6\r\5=\5\14\4B\2\2\0019\2\15\1'\4\r\0B\2\2\0019\2\15\1'\4\16\0B\2\2\0019\2\15\1'\4\17\0B\2\2\0016\2\0\0006\4\1\0'\5\18\0B\2\3\3\14\0\2\0X\4\4Ä6\4\3\0'\6\19\0B\4\2\0012\0RÄ6\4\0\0006\6\1\0'\a\20\0B\4\3\3\14\0\4\0X\6\1Ä2\0LÄ9\6\21\0055\b>\0005\t=\0005\n\22\0005\v\24\0009\f\23\3>\f\1\v=\v\25\n5\v\27\0003\f\26\0>\f\1\v=\v\28\n5\v\30\0009\f\29\3>\f\1\v=\v\31\n5\v!\0009\f \3>\f\1\v=\v\"\n5\v$\0009\f#\3>\f\1\v=\v%\n5\v'\0009\f&\3>\f\1\v=\v(\n5\v*\0009\f)\3>\f\1\v=\v+\n5\v-\0009\f,\3>\f\1\v=\v.\n5\v0\0009\f/\3>\f\1\v=\v1\n5\v3\0009\f2\3>\f\1\v=\v4\n5\v6\0009\f5\3>\f\1\v=\v7\n5\v8\0009\f\17\3>\f\1\v=\v9\n5\v;\0003\f:\0>\f\1\v=\v<\n=\n%\t=\t?\b5\t@\0B\6\3\0019\6\21\0055\bE\0005\tD\0005\nA\0005\vC\0003\fB\0>\f\1\v=\v7\n=\n%\t=\t?\b5\tF\0B\6\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0\1\0\1\tmode\6x\1\0\0\1\0\0\1\3\0\0\0\"Find visually selected word/s\0\1\0\1\tname\19+Telescope (x)\1\0\1\tmode\6n\r<Leader>\1\0\0\1\0\0\6n\1\3\0\0\0\24Search notification\0\6p\1\3\0\0\0\26Search yank registers\6s\1\3\0\0\0\27Find word under cursor\16grep_string\6r\1\3\0\0\0\21Search registers\14registers\6l\1\3\0\0\0\18Search string\14live_grep\6h\1\3\0\0\0\21Search help docs\14help_tags\6G\1\3\0\0\0\23Search git commits\16git_commits\6g\1\3\0\0\0\19Find git files\14git_files\6f\1\3\0\0\0\14Find File\15find_files\6c\1\3\0\0\0\30Search available commands\rcommands\6C\1\3\0\0\0\27Search command history\20command_history\6b\1\3\0\0\0\26Search current buffer\0\6B\1\3\0\0\0\24Find opened buffers\fbuffers\1\0\1\tname\15+Telescope\rregister\14which-key9telescope builtin not ok ...........................\22telescope.builtin\fneoclip\vnotify\19load_extension\15extensions\bfzf\1\0\0\1\0\3\25override_file_sorter\2\28override_generic_sorter\1\nfuzzy\2\rdefaults\1\0\0\22vimgrep_arguments\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\1\0\1\18prompt_prefix\a$ \nsetup8telescope not ok ..................................\nprint\14telescope\frequire\npcall\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-autoswap"] = {
    config = { "\27LJ\2\nk\0\0\2\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\25autoswap_detect_tmux\16titlestring\aon\ntitle\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-autoswap",
    url = "https://github.com/gioele/vim-autoswap"
  },
  ["vim-projectionist"] = {
    config = { "\27LJ\2\n‡\4\0\0\t\0\26\0#6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0015\2\6\0009\3\5\0=\3\a\0029\3\b\0=\3\t\2=\2\4\0016\1\n\0006\3\0\0'\4\v\0B\1\3\3\14\0\1\0X\3\1ÄK\0\1\0009\3\f\0025\5\23\0005\6\22\0005\a\r\0005\b\14\0=\b\15\a5\b\16\0=\b\17\a5\b\18\0=\b\19\a5\b\20\0=\b\21\a=\a\15\6=\6\24\0055\6\25\0B\3\3\1K\0\1\0\1\0\1\tmode\6n\r<Leader>\1\0\0\1\0\0\6t\1\3\0\0\16<CMD>AT<CR>\"Open alternate file (new tab)\6s\1\3\0\0\16<CMD>AS<CR>$Open alternate file (split hor)\6v\1\3\0\0\16<CMD>AV<CR>%Open alternate file (split vert)\6a\1\3\0\0\15<CMD>A<CR>\24Open alternate file\1\0\1\tname\19+Projectionist\rregister\14which-key\npcall2Gemfile&!config/boot.rb&!spec/rails_helper.rb\17ruby_generic1Gemfile&config/boot.rb&config/application.rb\1\0\0\18ruby_on_rails\29projectionist_heuristics\6g\bvim.genzade.plugins.projectionist.projections\frequire\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n≤\3\0\0\b\0\24\0\0306\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0006\2\5\0'\3\6\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\a\0015\4\21\0005\5\19\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\r\0=\a\14\0065\a\15\0=\a\16\0065\a\17\0=\a\18\6=\6\20\5=\5\22\0045\5\23\0B\2\3\1K\0\1\0\1\0\1\tmode\6n\r<Leader>\1\0\0\6t\1\0\0\6v\1\3\0\0\23<CMD>TestVisit<CR>\19Run test visit\6l\1\3\0\0\22<CMD>TestLast<CR>\18Run last test\6s\1\3\0\0\23<CMD>TestSuite<CR>\19Run test suite\6f\1\3\0\0\22<CMD>TestFile<CR>\18Run test file\6n\1\3\0\0\25<CMD>TestNearest<CR>\21Run nearest test\1\0\1\tname\16+TestRunner\rregister\14which-key\frequire\npcall\vneovim\18test#strategy\6g\bvim\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nM\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\14which-key\frequire\npcall\0" },
    loaded = true,
    path = "/Users/genzade/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: nvim-base16
time([[Config for nvim-base16]], true)
try_loadstring("\27LJ\2\nè\1\0\3\b\2\5\0\0199\3\0\1\15\0\3\0X\4\rÄ-\3\0\0005\5\1\0004\6\3\0-\a\1\0009\a\2\a>\a\1\6=\6\3\0054\6\0\0B\3\3\1-\3\0\0005\5\4\0004\6\0\0B\3\3\1\18\3\2\0B\3\1\1K\0\1\0\4¿\3¿\1\0\1\bcmd\18PackerCompile\targs\rfilename\1\0\1\bcmd\vsource\vchange¡\5\1\0\r\0#\0S6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0KÄ6\2\1\0'\4\3\0B\2\2\2\18\5\2\0009\3\4\0025\6\6\0006\a\5\0>\a\1\6B\3\3\0026\4\a\0009\4\b\0049\4\t\0046\5\a\0009\5\b\0059\5\n\5\18\b\3\0009\6\v\3B\6\2\2\15\0\6\0X\a\18Ä\18\6\4\0005\b\f\0004\t\3\0009\n\r\3>\n\1\t=\t\14\b4\t\0\0B\6\3\0019\6\15\0019\b\r\0035\t\18\0006\n\a\0009\n\16\n3\f\17\0B\n\2\2=\n\19\tB\6\3\1X\6\6Ä\18\6\4\0005\b\20\0005\t\21\0=\t\14\b4\t\0\0B\6\3\1\18\6\5\0)\b\0\0'\t\22\0005\n\23\0B\6\4\1\18\6\5\0)\b\0\0'\t\24\0005\n\25\0B\6\4\1\18\6\5\0)\b\0\0'\t\26\0005\n\27\0B\6\4\0016\6\0\0006\b\1\0'\t\28\0B\6\3\3\14\0\6\0X\b\2Ä2\0\0ÄK\0\1\0009\b\29\a9\t\30\a5\n!\0009\v \b=\v\"\n=\n\31\t2\0\0ÄK\0\1\0K\0\1\0\nguifg\1\0\1\nguibg\tNONE\vbase04\15SignColumn\14highlight\vcolors\23base16-colorscheme\1\0\2\fctermbg\tNONE\abg\tNONE\vNormal\1\0\3\tbold\2\abg\tNONE\afg\f#98c379\17CursorLineNr\1\0\1\abg\tNONE\vLineNr\1\2\0\0\20base16-ayu-dark\1\0\1\bcmd\16colorscheme\ron_event\1\0\0\0\18schedule_wrap\nwatch\targs\rfilename\1\0\1\bcmd\vsource\vexists\16nvim_set_hl\rnvim_cmd\bapi\bvim\1\3\0\0\0\22.vimrc_background\tHOME\bnew\17plenary.path\vfwatch\frequire\npcall\0", "config", "nvim-base16")
time([[Config for nvim-base16]], false)
-- Config for: nvim-treehopper
time([[Config for nvim-treehopper]], true)
try_loadstring("\27LJ\2\n\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nnodes\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nnodes\31\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\1¿\nnodesæ\2\1\0\b\0\20\0%6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\29Ä9\2\3\0015\3\5\0=\3\4\0026\2\6\0009\2\a\0029\2\b\2'\4\t\0'\5\n\0003\6\v\0005\a\f\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\r\0'\5\14\0003\6\15\0005\a\16\0B\2\5\0016\2\6\0009\2\a\0029\2\b\2'\4\17\0'\5\r\0003\6\18\0005\a\19\0B\2\5\0012\0\0ÄK\0\1\0K\0\1\0\1\0\1\tdesc\19Select ts node\0\6o\1\0\1\tdesc\19Select ts node\0\14<leader>m\6n\1\0\1\tdesc\19Select ts node\0\6m\6x\bset\vkeymap\bvim\1\n\0\0\6h\6j\6f\6d\6n\6v\6s\6l\6a\14hint_keys\vconfig\ttsht\frequire\npcall\0", "config", "nvim-treehopper")
time([[Config for nvim-treehopper]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nq\0\1\4\1\4\0\17-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\bÄ-\1\0\0009\1\1\0015\3\2\0B\1\2\2\14\0\1\0X\1\5ÄK\0\1\0X\1\3Ä-\1\0\0009\1\3\1B\1\1\1K\0\1\0\1¿\rcomplete\1\0\1\vselect\2\fconfirm\fvisibleÕ\1\0\1\3\3\5\0\29-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\19Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\nÄ-\1\2\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\4\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\0\0\21select_prev_item\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\tjump\rjumpable\21select_prev_item\fvisibleñ\1\0\2\b\0\4\0\0289\2\0\0009\2\1\2\18\4\2\0009\2\2\2'\5\3\0B\2\3\0039\4\0\0019\4\1\4\18\6\4\0009\4\2\4'\a\3\0B\4\3\3\14\0\3\0X\6\1Ä)\3\0\0\14\0\5\0X\6\1Ä)\5\0\0\1\5\3\0X\6\3Ä+\6\1\0L\6\2\0X\6\4Ä\1\3\5\0X\6\2Ä+\6\2\0L\6\2\0K\0\1\0\b^_+\tfind\nlabel\20completion_item-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expand \15\1\0\16\1d\0ﬂ\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0006\2\5\0'\3\6\0B\0\3\3\14\0\0\0X\2\1Ä2\0—Ä6\2\4\0006\4\5\0'\5\a\0B\2\3\3\14\0\2\0X\4\1Ä2\0ÀÄ6\4\4\0006\6\5\0'\a\b\0B\4\3\3\14\0\4\0X\6\1Ä2\0≈Ä9\6\t\5B\6\1\0019\6\n\0015\b2\0005\t\r\0009\n\v\0019\n\f\n=\n\14\t9\n\15\0019\n\16\n5\f\19\0009\r\17\0019\r\18\r=\r\20\fB\n\2\2=\n\21\t9\n\15\0019\n\22\n5\f\23\0009\r\17\0019\r\18\r=\r\20\fB\n\2\2=\n\24\t9\n\15\0019\n\25\n)\f¸ˇB\n\2\2=\n\26\t9\n\15\0019\n\25\n)\f\4\0B\n\2\2=\n\27\t9\n\15\0019\n\28\nB\n\1\2=\n\29\t9\n\15\0019\f\15\0019\f\30\f5\14 \0009\15\31\0019\15\18\15=\15\20\14B\f\2\0025\r!\0B\n\3\2=\n\"\t9\n\15\0015\f$\0009\r\15\0019\r#\rB\r\1\2=\r%\f3\r&\0=\r'\fB\n\2\2=\n(\t9\n\15\0019\n\30\n5\f*\0009\r\31\0019\r)\r=\r\20\fB\n\2\2=\n+\t9\n\15\0013\f,\0005\r-\0B\n\3\2=\n.\t9\n\15\0013\f/\0005\r0\0B\n\3\2=\n1\t=\t\15\b4\t\t\0005\n3\0>\n\1\t5\n4\0>\n\2\t5\n5\0>\n\3\t5\n6\0>\n\4\t5\n7\0>\n\5\t5\n8\0>\n\6\t5\n9\0>\n\a\t5\n:\0>\n\b\t=\t;\b5\tE\0004\n\t\0009\v\v\0019\v<\v9\v=\v>\v\1\n9\v\v\0019\v<\v9\v>\v>\v\2\n9\v\v\0019\v<\v9\v?\v>\v\3\n3\v@\0>\v\4\n9\v\v\0019\v<\v9\vA\v>\v\5\n9\v\v\0019\v<\v9\vB\v>\v\6\n9\v\v\0019\v<\v9\vC\v>\v\a\n9\v\v\0019\v<\v9\vD\v>\v\b\n=\nF\t=\tG\b5\tI\0003\nH\0=\nJ\t=\tK\b5\tP\0009\nL\0055\fM\0005\rN\0=\rO\fB\n\2\2=\nQ\t=\tR\b5\tS\0=\tT\b5\tX\0009\n\v\0019\nU\n9\nV\n5\fW\0B\n\2\2=\nY\t=\tU\bB\6\2\0019\6\n\0019\6Z\6'\b[\0005\t]\0009\n\15\0019\n\\\n9\nZ\nB\n\1\2=\n\15\t9\n\v\0019\n;\n4\f\3\0005\r^\0>\r\1\f4\r\3\0005\14_\0>\14\1\rB\n\3\2=\n;\tB\6\3\0019\6\n\0019\6Z\6'\b`\0005\ta\0009\n\15\0019\n\\\n9\nZ\nB\n\1\2=\n\15\t9\n\v\0019\n;\n4\f\3\0005\rb\0>\r\1\f4\r\3\0005\14c\0>\14\1\rB\n\3\2=\n;\tB\6\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0\0¿\1\0\3\19keyword_length\3\1\19max_item_count\3\30\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\1\tname\29nvim_lsp_document_symbol\1\0\0\vpreset\6/\fcmdline\18documentation\1\0\0\1\0\1\17winhighlightONormal:CmpNormal,FloatBorder:CmpBorder,CursorLine:CmpSelection,Search:None\rbordered\vwindow\17experimental\1\0\2\16native_menu\1\15ghost_text\2\15formatting\vformat\1\0\0\tmenu\1\0\6\fluasnip\v[SNIP]\rnvim_lsp\n[LSP]\rnvim_lua\n[API]\vbuffer\n[BUF]\tpath\v[PATH]\nemoji\v[EMOJ]\1\0\1\14with_text\2\15cmp_format\fsnippet\vexpand\1\0\0\0\fsorting\16comparators\1\0\0\norder\vlength\14sort_text\tkind\0\nscore\nexact\voffset\fcompare\fsources\1\0\1\tname\28nvim_lsp_signature_help\1\0\2\tname\arg\19keyword_length\3\3\1\0\1\tname\nemoji\1\0\2\tname\vbuffer\19keyword_length\3\4\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\rnvim_lua\1\0\0\n<A-k>\1\3\0\0\6i\6s\0\n<A-j>\1\3\0\0\6i\6s\0\n<C-q>\1\0\1\vselect\2\fReplace\14<C-space>\6c\0\6i\1\0\0\rcomplete\n<C-y>\1\3\0\0\6i\6c\1\0\1\vselect\2\20ConfirmBehavior\fconfirm\n<C-e>\nclose\n<C-f>\n<C-d>\16scroll_docs\n<C-p>\1\0\0\21select_prev_item\n<C-n>\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\fmapping\n<tab>\1\0\0\fdisable\vconfig\nsetup\tinit\flspkind\fluasnip\bcmp\frequire\npcall#menu,menuone,noselect,noinsert\16completeopt\6g\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: vim-autoswap
time([[Config for vim-autoswap]], true)
try_loadstring("\27LJ\2\nk\0\0\2\0\6\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\3\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0K\0\1\0\25autoswap_detect_tmux\16titlestring\aon\ntitle\6g\bvim\0", "config", "vim-autoswap")
time([[Config for vim-autoswap]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nn\0\0\6\0\a\0\r6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\4B\2\2\1K\0\1\0\bcss\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\npcall\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: vim-projectionist
time([[Config for vim-projectionist]], true)
try_loadstring("\27LJ\2\n‡\4\0\0\t\0\26\0#6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0015\2\6\0009\3\5\0=\3\a\0029\3\b\0=\3\t\2=\2\4\0016\1\n\0006\3\0\0'\4\v\0B\1\3\3\14\0\1\0X\3\1ÄK\0\1\0009\3\f\0025\5\23\0005\6\22\0005\a\r\0005\b\14\0=\b\15\a5\b\16\0=\b\17\a5\b\18\0=\b\19\a5\b\20\0=\b\21\a=\a\15\6=\6\24\0055\6\25\0B\3\3\1K\0\1\0\1\0\1\tmode\6n\r<Leader>\1\0\0\1\0\0\6t\1\3\0\0\16<CMD>AT<CR>\"Open alternate file (new tab)\6s\1\3\0\0\16<CMD>AS<CR>$Open alternate file (split hor)\6v\1\3\0\0\16<CMD>AV<CR>%Open alternate file (split vert)\6a\1\3\0\0\15<CMD>A<CR>\24Open alternate file\1\0\1\tname\19+Projectionist\rregister\14which-key\npcall2Gemfile&!config/boot.rb&!spec/rails_helper.rb\17ruby_generic1Gemfile&config/boot.rb&config/application.rb\1\0\0\18ruby_on_rails\29projectionist_heuristics\6g\bvim.genzade.plugins.projectionist.projections\frequire\0", "config", "vim-projectionist")
time([[Config for vim-projectionist]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n∆\a\0\0\n\0$\0B6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\0016\2\0\0006\4\1\0'\5\5\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0009\4\6\0035\6\17\0005\a\16\0005\b\a\0005\t\b\0=\t\t\b5\t\n\0=\t\v\b5\t\f\0=\t\r\b5\t\14\0=\t\15\b=\b\r\a=\a\18\0065\a\19\0B\4\3\0019\4\6\0035\6\26\0005\a\25\0005\b\20\0005\t\21\0=\t\t\b5\t\22\0=\t\v\b5\t\23\0=\t\r\b5\t\24\0=\t\15\b=\b\r\a=\a\18\0065\a\27\0B\4\3\0019\4\6\0035\6\"\0005\a!\0005\b\28\0005\t\29\0=\t\t\b5\t\30\0=\t\v\b5\t\31\0=\t\r\b5\t \0=\t\15\b=\b\r\a=\a\18\0065\a#\0B\4\3\1K\0\1\0\1\0\1\tmode\6o\1\0\0\1\0\0\1\3\0\0\25<CMD>HopAnywhere<CR>\24Hop anywhere window\1\3\0\0\21<CMD>HopWord<CR>\15Hop window\1\3\0\0$<CMD>HopAnywhereCurrentLine<CR>\22Hop anywhere line\1\3\0\0 <CMD>HopWordCurrentLine<CR>\rHop line\1\0\1\tname\t+Hop\1\0\1\tmode\6v\1\0\0\1\0\0\1\3\0\0\25<CMD>HopAnywhere<CR>\24Hop anywhere window\1\3\0\0\21<CMD>HopWord<CR>\15Hop window\1\3\0\0$<CMD>HopAnywhereCurrentLine<CR>\22Hop anywhere line\1\3\0\0 <CMD>HopWordCurrentLine<CR>\rHop line\1\0\1\tname\t+Hop\1\0\1\tmode\6n\r<Leader>\1\0\0\1\0\0\6S\1\3\0\0\25<CMD>HopAnywhere<CR>\24Hop anywhere window\6s\1\3\0\0\21<CMD>HopWord<CR>\15Hop window\6L\1\3\0\0$<CMD>HopAnywhereCurrentLine<CR>\22Hop anywhere line\6l\1\3\0\0 <CMD>HopWordCurrentLine<CR>\rHop line\1\0\1\tname\t+Hop\rregister\14which-key\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\npcall\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nU\0\1\5\3\4\0\n-\1\0\0008\1\0\0019\1\0\0015\3\1\0-\4\1\0=\4\2\3-\4\2\0=\4\3\3B\1\2\1K\0\1\0\6¿\t¿\bÄ\17capabilities\14on_attach\1\0\0\nsetup®\2\0\0\n\3\22\0\29-\0\0\0009\0\0\0009\0\1\0005\2\2\0-\3\1\0=\3\3\2-\3\2\0=\3\4\0025\3\19\0005\4\b\0005\5\6\0005\6\5\0=\6\a\5=\5\t\0045\5\14\0006\6\n\0009\6\v\0069\6\f\6'\b\r\0+\t\2\0B\6\3\2=\6\15\5=\5\16\0045\5\17\0=\5\18\4=\4\20\3=\3\21\2B\0\2\1K\0\1\0\6¿\t¿\bÄ\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\bvim\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\17capabilities\14on_attach\1\0\0\nsetup\16sumneko_luaΩ\a\1\0\16\0(\0Z5\0\0\0006\1\1\0\18\3\0\0B\1\2\4H\4\fÄ'\6\2\0\18\a\4\0&\6\a\0066\a\3\0009\a\4\a9\a\5\a\18\t\6\0005\n\6\0=\5\a\n=\6\b\n=\6\t\nB\a\3\1F\4\3\3R\4Ú\1276\1\n\0006\3\v\0'\4\f\0B\1\3\3\14\0\1\0X\3\1Ä2\0<Ä9\3\r\0025\5\17\0005\6\15\0005\a\14\0=\a\16\6=\6\18\5B\3\2\0016\3\n\0006\5\v\0'\6\19\0B\3\3\3\14\0\3\0X\5\1Ä2\0/Ä6\5\n\0006\a\v\0'\b\20\0B\5\3\3\14\0\5\0X\a\1Ä2\0)Ä5\a\21\0009\b\r\0045\n\22\0=\a\23\nB\b\2\0016\b\3\0009\b\24\b9\b\25\b9\b\26\bB\b\1\0029\t\27\b9\t\28\t9\t\29\t+\n\2\0=\n\30\t6\t\v\0'\v\31\0B\t\2\0029\t \t6\n\n\0006\f\v\0'\r!\0B\n\3\3\14\0\n\0X\f\1Ä2\0\16Ä9\f\"\v\18\14\b\0B\f\2\2\18\b\f\0009\f#\0045\14&\0003\15$\0>\15\1\0143\15%\0=\15'\14B\f\2\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0K\0\1\0K\0\1\0\16sumneko_lua\1\0\0\0\0\19setup_handlers\25default_capabilities\17cmp_nvim_lsp\14on_attach'genzade.plugins.lspconfig.defaults\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\21ensure_installed\1\0\1\22automatic_install\2\1\r\0\0\vbashls\vclangd\ncssls\rdockerls\thtml\15solargraph\16sumneko_lua\16tailwindcss\ntaplo\16terraformls\rtsserver\vyamlls\14lspconfig\20mason-lspconfig\aui\1\0\0\nicons\1\0\0\1\0\3\24package_uninstalled\b‚úó\20package_pending\b‚ûú\22package_installed\b‚úì\nsetup\nmason\frequire\npcall\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\bvim\19DiagnosticSign\npairs\1\0\4\tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \nError\tÔôô \0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\n≤\3\0\0\b\0\24\0\0306\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0006\2\5\0'\3\6\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\a\0015\4\21\0005\5\19\0005\6\b\0005\a\t\0=\a\n\0065\a\v\0=\a\f\0065\a\r\0=\a\14\0065\a\15\0=\a\16\0065\a\17\0=\a\18\6=\6\20\5=\5\22\0045\5\23\0B\2\3\1K\0\1\0\1\0\1\tmode\6n\r<Leader>\1\0\0\6t\1\0\0\6v\1\3\0\0\23<CMD>TestVisit<CR>\19Run test visit\6l\1\3\0\0\22<CMD>TestLast<CR>\18Run last test\6s\1\3\0\0\23<CMD>TestSuite<CR>\19Run test suite\6f\1\3\0\0\22<CMD>TestFile<CR>\18Run test file\6n\1\3\0\0\25<CMD>TestNearest<CR>\21Run nearest test\1\0\1\tname\16+TestRunner\rregister\14which-key\frequire\npcall\vneovim\18test#strategy\6g\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\ní\2\0\0\6\0\t\0\0156\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\4B\2\2\1K\0\1\0\21filetype_exclude\1\t\0\0\rNvimTree\14dashboard\fstartup\thelp\flspinfo\rmarkdown\vpacker\btxt\20buftype_exclude\1\4\0\0\rterminal\vpacker\vnofile\1\0\2\21show_end_of_line\2\28show_first_indent_level\1\nsetup\21indent_blankline\frequire\npcall\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: overlength.vim
time([[Config for overlength.vim]], true)
try_loadstring('\27LJ\2\nÅ\2\0\0\v\0\b\0\23)\0d\0006\1\0\0009\1\1\1)\2\0\0=\2\2\0016\1\0\0009\1\1\1+\2\1\0=\2\3\0015\1\4\0006\2\5\0\18\4\1\0B\2\2\4X\5\6Ä6\a\0\0009\a\6\a9\a\a\a\18\t\6\0\18\n\0\0B\a\3\1E\5\3\3R\5¯\127K\0\1\0\30overlength#set_overlength\afn\vipairs\1\t\0\0\bcss\thtml\15javascript\blua\rmarkdown\truby\tscss\ash(overlength#highlight_to_end_of_line"overlength#default_overlength\6g\bvim\0', "config", "overlength.vim")
time([[Config for overlength.vim]], false)
-- Config for: nvim-neoclip.lua
time([[Config for nvim-neoclip.lua]], true)
try_loadstring("\27LJ\2\nO\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\fneoclip\frequire\npcall\0", "config", "nvim-neoclip.lua")
time([[Config for nvim-neoclip.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\4\0\4\0\n6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1B\2\1\1K\0\1\0\nsetup\14which-key\frequire\npcall\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n∆\1\0\0\6\1\n\0\0206\0\0\0'\2\1\0B\0\2\2\18\3\0\0009\1\2\0B\1\2\2\18\3\1\0009\1\3\0015\4\4\0-\5\0\0=\5\5\4B\1\3\0026\2\6\0009\2\a\0029\2\b\2B\2\1\1\18\4\1\0009\2\t\1B\2\2\1K\0\1\0\0¿\vtoggle\25nvim_get_current_buf\bapi\bvim\15dimensions\1\0\2\bcmd\flazygit\vborder\vsingle\nsetup\bnew\19FTerm.terminal\frequire˚\4\1\0\n\0\30\00075\0\0\0006\1\1\0006\3\2\0'\4\3\0B\1\3\3\14\0\1\0X\3\4Ä6\3\4\0'\5\5\0B\3\2\0012\0*Ä9\3\6\0025\5\a\0=\0\b\5B\3\2\0016\3\1\0006\5\2\0'\6\t\0B\3\3\3\14\0\3\0X\5\1Ä2\0 Ä9\5\n\0045\a\r\0005\b\f\0009\t\v\2>\t\1\b=\b\14\a5\b\15\0B\5\3\0016\5\16\0003\6\18\0=\6\17\0059\5\n\0045\a\20\0005\b\19\0009\t\v\2>\t\1\b=\b\14\a5\b\22\0005\t\21\0=\t\23\b=\b\24\aB\5\2\0016\5\25\0009\5\26\0059\5\27\5)\a\0\0'\b\28\0005\t\29\0B\5\4\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\1\0\1\abg\tNONE\14VertSplit\16nvim_set_hl\bapi\bvim\r<Leader>\6g\1\0\0\1\3\0\0%<CMD>lua _G.lazygit_toggle()<CR>\26Open Lazygit terminal\1\0\0\1\3\0\0\0\29Toggle built in terminal\0\19lazygit_toggle\a_G\1\0\1\tmode\6t\n<C-t>\1\0\0\1\3\0\0\0\29Toggle built in terminal\vtoggle\rregister\14which-key\15dimensions\1\0\1\vborder\vsingle\nsetup7fterm not ok .....................................\nprint\nFTerm\frequire\npcall\1\0\4\nwidth\4Õô≥Ê\fÃô≥ˇ\3\6y\4\0ÄÄÄˇ\3\6x\4\0ÄÄÄˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\nK\0\4\t\1\3\0\a5\4\0\0-\5\0\0009\a\1\0019\b\2\0028\b\b\4B\5\3\1K\0\1\0\1¿\ttype\fmessage\1\5\0\0\nerror\twarn\tinfo\tinfo€\1\1\0\5\0\n\0\0216\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\2Ä2\0\rÄX\2\2Ä6\2\3\0=\1\2\0029\2\4\0015\4\5\0B\2\2\0016\2\3\0009\2\6\0029\2\a\0023\3\t\0=\3\b\0022\0\0ÄK\0\1\0K\0\1\0\0\23window/showMessage\rhandlers\blsp\1\0\4\ftimeout\3∏\23\vstages\vstatic\bfps\3<\22background_colour\16FloatShadow\nsetup\bvim\vnotify\frequire\npcall\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: kommentary
time([[Config for kommentary]], true)
try_loadstring("\27LJ\2\nÛ\1\0\0\a\0\f\0\0216\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1'\4\4\0005\5\5\0B\2\3\0019\2\6\1B\2\1\0016\2\a\0009\2\b\0029\2\t\2)\4\0\0'\5\n\0005\6\v\0B\2\4\1K\0\1\0\1\0\1\vitalic\2\fComment\16nvim_set_hl\bapi\bvim\26use_extended_mappings\1\0\1 prefer_single_line_comments\2\fdefault\23configure_language\22kommentary.config\frequire\npcall\0", "config", "kommentary")
time([[Config for kommentary]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\nU\0\0\5\0\4\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0014\4\0\0B\2\2\1K\0\1\0\nsetup\18nvim-surround\frequire\npcall\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÀ\1\0\0\5\0\b\0\0176\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0019\2\4\0025\4\5\0B\2\2\0016\2\1\0'\4\6\0B\2\2\0029\2\a\2B\2\1\1K\0\1\0\14lazy_load luasnip/loaders/from_vscode\1\0\2\17updateevents\29TextChanged,TextChangedI\fhistory\2\15set_config\vconfig\fluasnip\frequire\npcall\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nå\3\0\0\a\0\23\0\0306\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\4Ä6\2\3\0'\4\4\0B\2\2\1K\0\1\0009\2\5\0015\4\a\0005\5\6\0=\5\b\0045\5\n\0005\6\t\0=\6\v\0055\6\f\0=\6\r\0055\6\14\0=\6\15\0055\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\4B\2\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\rencoding\15fileformat\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\1\ntheme\fonedark\nsetup/lualine not ok ...........................\nprint\flualine\frequire\npcall\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nù\b\0\0\20\0002\2s6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\3\0'\3\4\0&\2\3\0029\3\5\0019\3\6\0039\4\5\0019\4\a\0049\5\5\0019\5\b\0059\6\5\0019\6\t\0066\a\1\0'\t\n\0B\a\2\0026\b\1\0'\n\v\0B\b\2\0029\b\f\b9\t\r\0015\v0\0004\f\15\0009\r\14\3>\r\1\f9\r\15\0049\r\16\r5\15\18\0005\16\17\0=\16\19\15B\r\2\2>\r\2\f9\r\20\0059\r\16\r5\15\22\0005\16\21\0=\16\19\15B\r\2\2>\r\3\f9\r\23\5>\r\4\f9\r\24\5>\r\5\f9\r\25\5>\r\6\f9\r\26\0059\r\16\r5\15\27\0006\16\28\0009\16\29\0165\18\30\0009\19\5\0019\19\b\0199\19\26\0199\19\31\0199\19 \19B\16\3\2=\16 \15B\r\2\2>\r\a\f9\r!\5>\r\b\f9\r\14\5>\r\t\f9\r\"\0069\r\16\r5\15&\0005\16#\0006\17\28\0009\17$\0179\17%\17\18\19\2\0B\17\2\0?\17\0\0=\16'\15B\r\2\2>\r\n\f9\r(\0069\r\16\r5\15*\0005\16)\0=\16'\0159\16+\aB\16\1\2=\16,\15B\r\2\2>\r\v\f9\r-\6>\r\f\f9\r\25\6>\r\r\f9\r\26\0069\r\16\r5\15.\0006\16\28\0009\16\29\0165\18/\0009\19\5\0019\19\t\0199\19\26\0199\19\31\0199\19 \19B\16\3\2=\16 \15B\r\2\0?\r\1\0=\f1\v=\b\f\vB\t\2\1K\0\1\0\fsources\1\0\0\1\3\0\0\texec\frubocop\1\0\1\fcommand\vbundle\16shellharden\20dynamic_command\22from_node_modules\1\0\0\1\3\0\0\27--quote-props preserve\19--parser json5\rprettier\15extra_args\1\0\0\vexpand\afn\1\2\0\0\18--config-path\vstylua\ryamllint\targs\n_opts\1\3\0\0\texec\frubocop\16list_extend\bvim\1\0\1\fcommand\vbundle\frubocop\rerb_lint\rhadolint\17markdownlint\1\0\0\1\3\0\0\rmarkdown\btxt\14codespell\14filetypes\1\0\0\1\3\0\0\rmarkdown\btxt\twith\nspell\15shellcheck\nsetup\14on_attach'genzade.plugins.lspconfig.defaults%null-ls.helpers.command_resolver\15formatting\16diagnostics\15completion\17code_actions\rbuiltins\17/stylua.toml\16CONFIG_PATH\fnull-ls\frequire\npcall\5ÄÄ¿ô\4\29ÄÄ¿ô\4\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: startup.nvim
time([[Config for startup.nvim]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\5\1\6\1\0206\0\0\0009\0\1\0006\2\2\0009\2\3\2B\2\1\0A\0\0\0016\0\0\0009\0\4\0B\0\1\2-\1\0\0\21\1\1\0\"\0\1\0-\1\0\0006\2\0\0009\2\5\2\18\4\0\0B\2\2\2\22\2\0\0028\1\2\1L\1\2\0\2¿\nfloor\vrandom\nclock\aos\15randomseed\tmath\2v\0\0\6\0\a\0\19'\0\0\0006\1\1\0009\1\2\1'\3\3\0B\1\2\2&\0\1\0'\1\4\0006\2\1\0009\2\2\2'\4\5\0B\2\2\2&\1\2\0014\2\3\0\18\3\0\0'\4\6\0\18\5\1\0&\3\5\3>\3\1\2L\2\2\0\6 \r%d-%m-%y\tÔâ¥ \n%H:%M\tdate\aos\tÔê∫ Œ\v\1\0\n\0$\0;6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0003Ä6\2\1\0'\4\3\0B\2\2\0029\2\4\0029\3\5\0015\5\t\0005\6\6\0003\a\a\0=\a\b\6=\6\n\0055\6\v\0004\a\a\0005\b\f\0>\b\1\a5\b\r\0>\b\2\a5\b\14\0>\b\3\a5\b\15\0>\b\4\a5\b\16\0>\b\5\a5\b\17\0>\b\6\a=\a\b\6=\6\18\0055\6\19\0006\a\1\0'\t\20\0B\a\2\0029\a\21\aB\a\1\2=\a\b\6=\6\22\0055\6\23\0003\a\24\0=\a\b\6=\6\25\0055\6\26\0005\a\27\0=\a\28\6=\6\29\0055\6\30\0=\6\31\0055\6 \0=\6!\0055\6\"\0=\6#\5B\3\2\0012\0\0ÄK\0\1\0K\0\1\0\nparts\1\5\0\0\vheader\tbody\ffooter1\ffooter2\vcolors\1\0\2\15background\f#1f2227\19folded_section\f#56b6c2\rmappings\1\0\5\17open_section\n<TAB>\20open_file_split\n<c-o>\14open_file\6o\20execute_command\t<CR>\14open_help\6?\foptions\rpaddings\1\5\0\0\3\1\3\3\3\3\3\1\1\0\4\24disable_statuslines\2!empty_lines_between_mappings\2\18cursor_column\4\0ÄÄÄˇ\3\17mapping_keys\2\ffooter2\0\1\0\t\ntitle\5\20oldfiles_amount\3\n\18default_color\f#FFFFFF\ttype\ttext\vmargin\3\5\17fold_section\1\14highlight\rTSString\nalign\vcenter\23oldfiles_directory\1\ffooter1\nquote\22startup.functions\1\0\t\ntitle\vFooter\20oldfiles_amount\3\0\18default_color\5\ttype\ttext\vmargin\3\5\17fold_section\1\14highlight\vNumber\nalign\vcenter\23oldfiles_directory\1\tbody\1\4\0\0\19Ôôô  Quit NVIM\aqa\6q\1\4\0\0\18ÔÖõ  New File&lua require('startup').new_file()\6N\1\4\0\0\22Óà´  Colorschemes\26Telescope colorscheme\acs\1\4\0\0\22Ôë§  Recent Files\23Telescope oldfiles\aof\1\4\0\0\19Ô°à  Find Word\24Telescope live_grep\afl\1\4\0\0\19ÔÖú  Find File\25Telescope find_files\aff\1\0\t\ntitle\19Basic Commands\20oldfiles_amount\3\0\18default_color\5\ttype\fmapping\vmargin\3\5\17fold_section\1\14highlight\vString\nalign\vcenter\23oldfiles_directory\1\vheader\1\0\0\fcontent\0\1\0\t\ntitle\vHeader\20oldfiles_amount\3\0\18default_color\5\ttype\ttext\vmargin\3\5\17fold_section\1\14highlight\14Statement\nalign\vcenter\23oldfiles_directory\1\nsetup\fheaders)genzade.plugins.startup.content_bank\fstartup\frequire\npcall\0", "config", "startup.nvim")
time([[Config for startup.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nq\0\0\4\1\a\0\v6\0\0\0009\0\1\0009\0\2\0\a\0\3\0X\0\5Ä-\0\0\0009\0\4\0006\2\5\0'\3\6\0B\0\3\1K\0\1\0\3¿\rFileTree\19FILETREE_WIDTH\15set_offset\rNvimTree\rfiletype\abo\bvimy\0\0\4\1\a\0\0166\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\18\2\0\0009\0\4\0'\3\5\0B\0\3\2\15\0\0\0X\1\4Ä-\0\0\0009\0\6\0)\2\0\0B\0\2\1K\0\1\0\3¿\15set_offset\rNvimTree\nmatch\f<afile>\vexpand\afn\bvim´\4\1\0\t\0\25\0/6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0&Ä9\2\3\0015\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\0045\5\t\0=\5\n\0045\5\v\0B\2\3\0016\2\0\0006\4\1\0'\5\f\0B\2\3\3\14\0\2\0X\4\4Ä6\4\r\0'\6\14\0B\4\2\0012\0\19Ä6\4\15\0009\4\16\0049\4\17\4'\6\18\0005\a\19\0003\b\20\0=\b\21\aB\4\3\0016\4\15\0009\4\16\0049\4\17\4'\6\22\0005\a\23\0003\b\24\0=\b\21\aB\4\3\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\0\1\0\1\fpattern\6*\16BufWinLeave\rcallback\0\1\0\1\fpattern\6*\16BufWinEnter\24nvim_create_autocmd\bapi\bvim6bufferline_api not ok ...........................\nprint\19bufferline.api\1\0\1\tmode\6n\f<S-TAB>\1\3\0\0\28<CMD>BufferPrevious<CR>\26Go to previous buffer\n<TAB>\1\3\0\0\24<CMD>BufferNext<CR>\22Go to next buffer\n<A-x>\1\0\0\1\3\0\0\25<CMD>BufferClose<CR>\21Close the buffer\rregister\14which-key\frequire\npcall\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nº\a\0\0\t\0)\0/6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0005\5\5\0=\5\6\0045\5\a\0=\5\b\0045\5\16\0005\6\t\0005\a\v\0005\b\n\0=\b\f\a5\b\r\0=\b\14\a=\a\15\6=\6\17\0055\6\18\0005\a\20\0005\b\19\0=\b\21\a5\b\22\0=\b\23\a5\b\24\0=\b\25\a5\b\26\0=\b\27\a=\a\28\6=\6\29\0055\6\30\0005\a \0005\b\31\0=\b!\a=\a\"\0065\a$\0005\b#\0=\b%\a=\a&\6=\6'\5=\5(\4B\2\2\1K\0\1\0\16textobjects\tswap\18swap_previous\14<leader>A\1\0\0\1\0\2\tdesc!Swap with previous parameter\nquery\21@parameter.inner\14swap_next\14<leader>a\1\0\0\1\0\2\tdesc\29Swap with next parameter\nquery\21@parameter.inner\1\0\1\venable\2\vselect\fkeymaps\aic\1\0\2\tdesc(Select inner part of a class region\nquery\17@class.inner\aac\1\0\2\tdesc\27Select around function\nquery\17@class.outer\aif\1\0\2\tdesc\26Select inner function\nquery\20@function.inner\aaf\1\0\0\1\0\2\tdesc\27Select around function\nquery\20@function.outer\1\0\1\venable\2\16lsp_interop\1\0\0\25peek_definition_code\15<leader>dF\1\0\2\tdesc\15Peek class\nquery\17@class.outer\15<leader>df\1\0\0\1\0\2\tdesc\18Peek function\nquery\20@function.outer\1\0\2\venable\2\vborder\tnone\vindent\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\npcall\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: friendly-snippets
time([[Config for friendly-snippets]], true)
try_loadstring("\27LJ\2\nl\0\0\6\0\6\0\f6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\1'\4\4\0005\5\5\0B\2\3\1K\0\1\0\1\2\0\0\nrails\truby\20filetype_extend\fluasnip\frequire\npcall\0", "config", "friendly-snippets")
time([[Config for friendly-snippets]], false)
-- Config for: nvim-tmux-navigation
time([[Config for nvim-tmux-navigation]], true)
try_loadstring("\27LJ\2\n∂\3\0\0\t\0\21\0&6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\0016\2\0\0006\4\1\0'\5\5\0B\2\3\3\14\0\2\0X\4\1ÄK\0\1\0009\4\6\0035\6\t\0005\a\b\0009\b\a\1>\b\1\a=\a\n\0065\a\f\0009\b\v\1>\b\1\a=\a\r\0065\a\15\0009\b\14\1>\b\1\a=\a\16\0065\a\18\0009\b\17\1>\b\1\a=\a\19\0065\a\20\0B\4\3\1K\0\1\0\1\0\1\tmode\6n\n<C-l>\1\3\0\0\0\19Navigate Right\26NvimTmuxNavigateRight\n<C-k>\1\3\0\0\0\16Navigate Up\23NvimTmuxNavigateUp\n<C-j>\1\3\0\0\0\18Navigate Down\25NvimTmuxNavigateDown\n<C-h>\1\0\0\1\3\0\0\0\18Navigate Left\25NvimTmuxNavigateLeft\rregister\14which-key\1\0\1\24disable_when_zoomed\2\nsetup\25nvim-tmux-navigation\frequire\npcall\0", "config", "nvim-tmux-navigation")
time([[Config for nvim-tmux-navigation]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd mason.nvim ]]
vim.cmd [[ packadd mason-null-ls.nvim ]]

-- Config for: mason-null-ls.nvim
try_loadstring("\27LJ\2\nÅ\1\0\0\5\0\5\0\v6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0009\2\3\0015\4\4\0B\2\2\1K\0\1\0\1\0\2\27automatic_installation\2\20automatic_setup\2\nsetup\18mason-null-ls\frequire\npcall\0", "config", "mason-null-ls.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'MarkdownPreview', function(cmdargs)
          require('packer.load')({'markdown-preview.nvim'}, { cmd = 'MarkdownPreview', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'markdown-preview.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MarkdownPreview ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeFocus', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeFocus', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeFocus ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'NvimTreeFindFileToggle', function(cmdargs)
          require('packer.load')({'nvim-tree.lua'}, { cmd = 'NvimTreeFindFileToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-tree.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('NvimTreeFindFileToggle ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'telescope.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'nvim-tree.lua'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
