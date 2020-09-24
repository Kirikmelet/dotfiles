local vim = vim
local api = vim.api
local plugman = require('func/packadder')

plugman.packadd({'vim-orgmode'})

vim.g.org_todo_keywords = {'TODO', 'CURRENT', 'HOLD', 'POSTPONED', '|', 'FINISHED', 'CANCELLED', 'FAIL'}
