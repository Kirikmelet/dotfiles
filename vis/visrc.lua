require('vis')
local ft = require('plugins.ftconf')


local initSet = {
	"set theme default-16",
	"set expandtab true",
	"set tw 4",
}

local ftConf = {
   lua = {"set tw 3"},
   javascript = function(win) vis:command('set tw 2') end,  
   ansi_c = {"set tw 8"},
}

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	ft:setup(ftConf, win)
end)

vis.events.subscribe(vis.events.INIT, function(win)
	for _,i in pairs(initSet) do
		vis:command(i)
	end
end)
