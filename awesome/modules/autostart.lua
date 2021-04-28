-- autostart.lua
-- Handles autostart
local awful = require('awful')

awful.spawn.with_shell('~/.config/awesome/autostart.sh')
