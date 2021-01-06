-- Main library
require('vis')

-- FTPlugin
local ft = require('plugins.ftconf')


-- Terminal name
require('plugins.vis-title')


local initSet = {
   'set change-256colors off',
	'set theme default-256',
	'set expandtab true',
	'set tw 4',
}

local ftConf = {
   lua = {'set tw 3'},
   javascript = {'set tw 2'},
   ansi_c = {'set tw 8'},
   html = {'set tw 2'}
}

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
   ft:setup(ftConf, win)
end)

vis.events.subscribe(vis.events.INIT, function(win)
	for _,i in pairs(initSet) do
		vis:command(i)
	end
end)