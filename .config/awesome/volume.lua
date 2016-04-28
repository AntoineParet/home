local wibox = require("wibox")
local awful = require("awful")

volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")

function update_volume(widget)
   local fd = io.popen("amixer sget Master")
   local status = fd:read("*all")
   fd:close()

   -- local volume = tonumber(string.match(status, "(%d?%d?%d)%%")) / 100
   local volume = string.match(status, "(%d?%d?%d)%%")
   -- volume = string.format("%3d", volume)

   status = string.match(status, "%[(o[^%]]*)%]")

   if string.find(status, "on", 1, true) then
       -- For the volume numbers
       volume = volume .. "%"
   else
       -- For the mute button
       volume = "<span color='red'>" .. volume .. "M</span>"

   end
   widget:set_markup(volume)
end

update_volume(volume_widget)

mytimer = timer({ timeout = 2 })
mytimer:connect_signal("timeout", function () update_volume(volume_widget) end)
mytimer:start()

-- Sound function
cardid  = 0
channel = "Master"
function set_volume (mode)
	if mode == "up" then
		io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 1%+"):read("*all")
	elseif mode == "down" then
		io.popen("amixer -q -c " .. cardid .. " sset " .. channel .. " 1%-"):read("*all")
	else
        io.popen("pactl set-sink-mute " .. cardid .. " toggle"):read("*all")
	end
end
