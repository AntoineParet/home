local awful = require("awful")
local vicious = require("vicious")

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
batwidget:set_color({ type = "linear", from = { 0, 0 }, to = { 0, 10 }, stops = { {0, "#AECF96" }, { 0.5, "#88A175" }, { 1, "#FF5656" }} })
vicious.register(batwidget, vicious.widgets.bat, "$2", 61, "BAT0")
-- }}
