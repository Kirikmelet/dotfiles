local vim = vim
local api = vim.api
local binder = require('func/binder')



--{{{ File Hotkeys
local appkeys = {
   {'n', '<leader>fs', '<cmd>Denite grep<CR>',nil,nil};
   {'n', '<leader>ff', '<cmd>Neoformat<CR>',nil,nil};
   {'n', '<leader>fm', '<cmd>make<CR>',nil,nil};
   {'n', '<leader>fts', '<cmd>Denite tag<CR>',nil,nil};
   {'n', '<leader>ftg', '<cmd>!ctags %<CR>',nil,nil};
}
--}}}
binder(appkeys)

--{{{Buffer hotkeys
local bufkeys = {
   {'n', '<leader>bf', '<cmd>Denite file/rec<CR>',nil,nil};
   {'n', '<leader>bd', '<cmd>Defx -buffer-name=bar<CR>',nil,nil};
   {'n', '<leader>bb', '<cmd>Denite buffer<CR>',nil,nil};
   {'n', '<leader>bso', 'zo',nil,nil};
   {'n', '<leader>bsc', 'zc',nil,nil};
   {'n', '<leader>bst', 'za',nil,nil};
   {'n', '<leader>bsC', 'zM',nil,nil};
   {'n', '<leader>bsO', 'zR',nil,nil};
   {'n', '<leader>bps', '<cmd>mksession!<CR>',nil,nil};
   {'n', '<leader>bso', '<cmd>source Session.vim<CR>',nil,nil};
}
--}}}
binder(bufkeys)

--{{{Application hotkeys
local apphotkeys = {
   {'n', '<leader>aw', '<cmd>Defx -buffer-name=defxplore ~/vimwiki<CR>',nil,nil};
   {'n', '<leader>am', '<cmd>Denite menu<CR>',nil,nil};
   {'n', '<leader>ao', '<cmd>Defx -buffer-name=defxplore ~/org<CR>',nil,nil};
   {'n', '<leader>ad', '<cmd>Defx -buffer-name=defxplore<CR>',nil,nil};
}
--}}}
binder(apphotkeys)

--{{{Git hotkeys
local gitkeys = {
   {'n', '<leader>gc', '<cmd>Git commit<CR>',nil};
   {'n', '<leader>gg', '<cmd>G<CR>',nil};
   {'n', '<leader>gps', '<cmd>split | term git push<CR>',nil};
   {'n', '<leader>gpl', '<cmd>Git pull<CR>',nil,nil};
   {'n', '<leader>gf', '<cmd>Git fetch<CR>',nil,nil};
}
--}}}
binder(gitkeys)

-- Debug
local debugkeys = {
      {'n', '<leader>pl', '<cmd>lua require"git".load()<CR>',nil,nil}
}
binder(debugkeys)
