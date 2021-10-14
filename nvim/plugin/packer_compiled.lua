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
local package_path_str = "/home/troyd/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/troyd/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/troyd/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/troyd/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/troyd/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
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
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["lir.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/lir.nvim"
  },
  ["lsp_extensions.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neogit = {
    after = { "plenary.nvim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["nvim-autopairs"] = {
    config = { "require'plugins.autopairs'" },
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "require'plugins.bqf'" },
    loaded = false,
    needs_bufread = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-compe"] = {
    after_files = { "/home/troyd/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "require'plugins.completion'" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    after = { "lspsaga.nvim", "lsp_extensions.nvim", "nvim-treesitter", "nvim-compe" },
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\1\2o\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\21org_agenda_files\1\0\0\1\2\0\0\26~/org/global_agenda/*\nsetup\forgmode\frequire\0" },
    keys = { { "", "n" }, { "", "<leader>o" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    load_after = {
      neogit = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["telescope.nvim"] = {
    after = { "popup.nvim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-glsl"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/vim-glsl"
  },
  ["vim-qml"] = {
    loaded = true,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/start/vim-qml"
  },
  ["which-key.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/troyd/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>o <cmd>lua require("packer.load")({'orgmode.nvim'}, { keys = "<lt>leader>o", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'orgmode.nvim'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
vim.cmd [[au FileType lol ++once lua require("packer.load")({'nvim-bqf'}, { ft = "lol" }, _G.packer_plugins)]]
vim.cmd [[au FileType glsl ++once lua require("packer.load")({'vim-glsl'}, { ft = "glsl" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'orgmode.nvim'}, { ft = "org" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/troyd/.local/share/nvim/site/pack/packer/opt/vim-glsl/ftdetect/glsl.vim]], true)
vim.cmd [[source /home/troyd/.local/share/nvim/site/pack/packer/opt/vim-glsl/ftdetect/glsl.vim]]
time([[Sourcing ftdetect script at: /home/troyd/.local/share/nvim/site/pack/packer/opt/vim-glsl/ftdetect/glsl.vim]], false)
time([[Sourcing ftdetect script at: /home/troyd/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], true)
vim.cmd [[source /home/troyd/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]]
time([[Sourcing ftdetect script at: /home/troyd/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], false)
time([[Sourcing ftdetect script at: /home/troyd/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], true)
vim.cmd [[source /home/troyd/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]]
time([[Sourcing ftdetect script at: /home/troyd/.local/share/nvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
