-- Error handling
-- THIS SHOULD GO FIRST!

local naught = require("naughty")

if awesome.startup_errors then
   naught.notifty({
         preset = naught.config.presets.critical;
         title = "CONFIG ERROR";
         text = awesome.startup_errors
   })
end


do
   local in_error = false
   awesome.connect_signal("debug::error", function (err)
                             if in_error then return end
                             in_error = true
                             naught.notify({
                                   preset = naught.config.presets.critical;
                                   title = "ERROR X3";
                                   text = tostring(err)
                             })
                             in_error = false
   end)
end
