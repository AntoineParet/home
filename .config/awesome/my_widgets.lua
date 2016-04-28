local awful = require("awful")
local vicious = require("vicious")
local wibox = require("wibox")

-- {{ My Vicious widgets
-- CPU
cpuwidget = awful.widget.progressbar()
cpuwidget:set_width(8)
cpuwidget:set_height(10)
cpuwidget:set_vertical(true)
cpuwidget:set_background_color("#494B4F")
cpuwidget:set_border_color(nil)
cpuwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 0, 10 }, stops = { {0, "#FF0000" }, { 0.5, "#88A175" }, { 1, "#00FF00" }} })
vicious.cache(vicious.widgets.cpu)
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")
-- Mem usage
memwidget = awful.widget.progressbar()
memwidget:set_width(8)
memwidget:set_height(10)
memwidget:set_vertical(true)
memwidget:set_background_color("#494B4F")
memwidget:set_border_color(nil)
memwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 0, 10 }, stops = { {0, "#FF0000" }, { 0.5, "#88A175" }, { 1, "#00FF00" }} })
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "$1", 10)
-- Battery state
batwidget = awful.widget.progressbar()
batwidget:set_width(8)
batwidget:set_height(10)
batwidget:set_vertical(true)
batwidget:set_background_color("#494B4F")
batwidget:set_border_color(nil)
batwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 0, 10 }, stops = { {0.2, "#99FF99" }, { 0.9, "#FF2256" }} })
vicious.register(batwidget, vicious.widgets.bat, "$2", 61, "BAT0")
-- }}
--
battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")

function update_battery(widget)
    local fd = io.popen("acpi")
    local status = fd:read("*all")
    fd:close()

    local battery = ""
    local percent = tonumber(string.match(status, "(%d?%d?%d)%%"))
    local time = string.match(status, "(%d%d:%d%d):")
    local color = "green"
    if percent < 26 then
        color = "orange"
    end
    if percent < 16 then
        color = "red"
    end

    battery = battery .. "<span color='" .. color .. "'>" .. percent .. "% " .. time .. "</span>"
    widget:set_markup(battery)
end

update_battery(battery_widget)

mytimer = timer({ timeout = 60 })
mytimer:connect_signal("timeout", function () update_battery(battery_widget) end)
mytimer:start()
