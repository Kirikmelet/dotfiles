local vim = vim
local api = vim.api
local plugman = require('func/packadder')
local M = {}
local aug = require('func/augrouper')

plugman.packadd({'nvim-tree.lua'})

vim.g.lua_tree_side = 'left'
vim.g.lua_tree_width = 30
vim.g.lua_tree_ignore = {'.git', 'node_modules', '.clangd', '.cache'}
vim.g.lua_tree_auto_open = 0
vim.g.lua_tree_auto_close = 1
vim.g.lua_tree_follow = 1
vim.g.lua_tree_indent_markers = 1
vim.g.lua_hide_dotfiles = 1
vim.g.lua_tree_git_hl = 1
vim.g.lua_tree_root_folder_modifiler = 'R!'
vim.g.lua_tree_tab_open = 1
vim.g.lua_tree_show_icons = {git = 1, folders = 1, files = 1}
vim.g.lua_tree_bindings = {
   edit = {'<CR>', 'o'};
   edit_vsplit = 't';
   edit_split = 's';
   edit_tab = 'T';
   toggle_ignored = 'I';
   toggle_dotfiles = '.';
   refresh = 'r';
   preview = 'p';
   cd = 'g';
   create = 'n';
   remove = 'd';
   rename = 'R';
   cut = 'x';
   copy = 'c';
   paste = 'P';
   prev_git_item = '[c';
   next_git_item = ']c';
}

