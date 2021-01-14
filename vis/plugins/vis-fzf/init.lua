require('vis')
local fzf={}

fzfSettings = {
   exec = 'fd -t f -t l | sk-tmux'; -- I use skim
   args = '';
}


function fzf:command(input,output)
   local ninput = ''
   if type(input) == 'function' then
      local ninput = input()
   elseif type(input) == 'string' then
      local ninput = input
   else
      local ninput = ''
   end
   local readpipe = io.popen(string.format('%s %s %s', fzfSettings.exec, fzfSettings.args, ninput))
   local noutput = readpipe:read()
   local status,msg,code = readpipe:close()
   if not status then
      vis:message(string.format('%s %i', msg, code))
   elseif not noutput then return end
   if type(output) ~= 'function' then return
   elseif type(output) == 'nil' then return
   else output(noutput) end
end


vis:command_register('Files', function(argv)
   if os.getenv('TMUX') == nil then
      vis:info('TMUX not detected')
      return
   end
   fzf:command(argv[0], function(out)
      vis:feedkeys(string.format(':e %s<Enter>', out))
      vis:feedkeys('<vis-redraw>')
      end)
   end
)
