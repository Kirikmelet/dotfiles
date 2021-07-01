local vim = vim
local api = vim.api
local binder = require('func.binder')


--{{{Autopair
--local autopair = {
--      {'i', '(', '()<Esc>hli',nil,nil};
--      {'i', '[', '[]<Esc>hli',nil,nil};
--      {'i', '{', '{}<Esc>hli',nil,nil};
--}
--}}}
--binder(autopair)

--{{{Tabs
local tabs = {
      {'n', '<leader>tn', '<cmd>tabnew<CR>', {silent = false, noremap = false},nil};
      {'n', '<leader>tc', '<cmd>tabclose', {silent = false, noremap = false},nil};
}
--}}}
--binder(tabs)

--{{{Completion-nvim /Diagnostic-nvimm
api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {expr = true, noremap = true})
api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {expr = true, noremap = true})
api.nvim_set_keymap('i', '<c-space>', [[<Plug>(completion_trigger)]], {expr = false, silent = true, noremap = false})
--}}}

--{{{Terminal
local termkeys = {
      {'t', '<C-x><C-c>', '<C-\\><C-n>',nil,nil};
}
--}}}
--binder(termkeys)

--{{{ File Hotkeys
local filekeys = {
   --{'n', '<leader>fs', ':execute "grep ".input("Search Text: ")." %"<CR>', nil, nil};
--   {'n', '<leader>fs', '<cmd>lua require("telescope.builtin").live_grep()<CR>', nil, nil};
   {'n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting()<CR>',nil,nil};
  -- {'n', '<leader>ff', '<cmd>Format<CR>',nil,nil};
   {'n', '<leader>fm', '<cmd>make<CR>',nil,nil};
   {'n', '<leader>ftg', '<cmd>!ctags %<CR>',nil,nil};
}
--}}}
--binder(filekeys)

--{{{Buffer hotkeys
local bufkeys = {
--   {'n', '<leader>bb', '<cmd>lua require("telescope.builtin").buffers()<cr>', nil,nil};
--   {'n', '<leader>bf', '<cmd>lua require("telescope.builtin").find_files()<cr>', nil,nil};
--   {'n', '<leader>bw', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>', nil,nil};
   {'n', '<leader>bso', 'zo',nil,nil};
   {'n', '<leader>bsc', 'zc',nil,nil};
   {'n', '<leader>bst', 'za',nil,nil};
   {'n', '<leader>bsC', 'zM',nil,nil};
   {'n', '<leader>bsO', 'zR',nil,nil};
   {'n', '<leader>bss', '<cmd>mksession!<CR>',nil,nil};
   {'n', '<leader>bso', '<cmd>source Session.vim<CR>',nil,nil};
   {'n', '<leader>b<leader>', '<cmd>copen<CR>',nil, nil};
}
--}}}
--binder(bufkeys)

--{{{Application hotkeys
local apphotkeys = {
   {'n', '<leader>ao', '<cmd>Explore ~/org<CR>',nil,nil};
   {'n', '<leader>ad', '<cmd>Explore<CR>',nil,nil};
   {'n', '<leader>at', '<cmd>term<CR>',nil,nil};
}
--}}}
--binder(apphotkeys)

--{{{Git hotkeys
local gitkeys = {
   --{'n', '<leader>gc', '<cmd>Git commit<CR>',nil};
   --{'n', '<leader>gg', '<cmd>G<CR>',nil};
   --{'n', '<leader>gps', '<cmd>Git push<CR>',nil};
   --{'n', '<leader>gpl', '<cmd>Git pull<CR>',nil,nil};
   --{'n', '<leader>gf', '<cmd>Git fetch<CR>',nil,nil};
   {'n', '<leader>gc', 'neogit.open({ "commit"})',nil};
   {'n', '<leader>gg', 'neogit.open()',nil};
   {'n', '<leader>gps', 'neogit.open({"push"})',nil};
   {'n', '<leader>gpl', 'neogit.open({"pull"})',nil,nil};
   --{'n', '<leader>gf', '<cmd>Git fetch<CR>',nil,nil};
}
--}}}
--binder(gitkeys)

--{{{ LSP
local lspkeys = {
   {'n', '<leader>la', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>',nil,nil};
   {'n', '<leader>lf', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>',nil,nil};
   {'n', '<leader>lge', '<cmd>lua vim.lsp.buf.declaration()<CR>',nil,nil};
   {'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>',nil,nil};
   {'n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>',nil,nil};
   {'n', '<leader>lgD', '<cmd>lua vim.lsp.buf.implementation()<CR>',nil,nil};
   {'n', '<leader>ltd', '<cmd>lua vim.lsp.buf.type_definition()<CR>',nil,nil};
   {'n', '<leader>lgr', '<cmd>lua vim.lsp.buf.references()<CR>',nil,nil};
   {'n', '<leader>lp', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>',nil,nil};
}
--}}}
--binder(lspkeys)
