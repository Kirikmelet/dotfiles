local vim = vim
local api = vim.api

vim.cmd[[packadd! vim-polyglot]]


vim.g.polyglot_disabled = {
  'c',
  'lua',
  'rust',
  'bash',
  'javascript',
  'python',
  'html',
  'cpp',
}
