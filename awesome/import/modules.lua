local naughty = require('naughty')

-- Because of issues
-- {{{ Error handling
require('import/errors')
-- }}}


--{{{ Bar
require('import/bar')
--}}}

-- {{{ Mouse bindings
local mouser = require('import/mouse')
root.buttons(mouser.mousebuttons)
-- }}}

-- {{{ Key bindings
local keyer = require('import/keybind')
root.keys(keyer.globalkeys)
-- }}}

-- {{{ Rules
require('import/rules')
-- }}}

-- {{{ Signals
require('import/signals')
-- }}}
