local vim = vim
local api = vim.api
local plugman = require('func/packadder')

plugman.packadd({
   'colorbuddy.vim'
})

local groovy = require('colorbuddy')

groovy.colorscheme('gruvbox')
