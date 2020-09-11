local vim = vim
local api = vim.api
local binder = require('func/binder')


--{{{ File Hotkeys
binder('n', '<leader>fs', '<cmd>Denite grep<CR>',nil)
binder('n', '<leader>ff', '<cmd>Neoformat<CR>',nil)
binder('n', '<leader>fm', '<cmd>make<CR>',nil)
binder('n', '<leader>fts', '<cmd>Denite tag<CR>',nil)
binder('n', '<leader>ftg', '<cmd>!ctags %<CR>',nil)
--}}}

--{{{Buffer hotkeys
binder('n', '<leader>bf', '<cmd>Denite file/rec<CR>')
binder('n', '<leader>bd', '<cmd>Defx -buffer-name=bar<CR>')
binder('n', '<leader>bb', '<cmd>Denite buffer<CR>')
binder('n', '<leader>bso', 'zo')
binder('n', '<leader>bsc', 'zc')
binder('n', '<leader>bst', 'za')
binder('n', '<leader>bsC', 'zM')
binder('n', '<leader>bsO', 'zR')
binder('n', '<leader>bps', '<cmd>mksession!<CR>')
binder('n', '<leader>bso', '<cmd>source Session.vim<CR>')
--}}}

--{{{Application hotkeys
binder('n', '<leader>aw', '<cmd>Defx -buffer-name=defxplore ~/vimwiki<CR>')
binder('n', '<leader>am', '<cmd>Denite menu<CR>')
binder('n', '<leader>ao', '<cmd>Defx -buffer-name=defxplore ~/org<CR>')
binder('n', '<leader>ad', '<cmd>Defx -buffer-name=defxplore<CR>')
--}}}

--{{{Git hotkeys
binder('n', '<leader>gc', '<cmd>Git commit<CR>', nil)
binder('n', '<leader>gg', '<cmd>G<CR>',nil)
binder('n', '<leader>gps', '<cmd>split | term git push<CR>',nil)
binder('n', '<leader>gpl', '<cmd>Git pull<CR>',nil)
binder('n', '<leader>gf', '<cmd>Git fetch<CR>',nil)
--{{{

-- Debug
binder('n', '<leader>pl', '<cmd>lua require"git".load()<CR>',nil)
