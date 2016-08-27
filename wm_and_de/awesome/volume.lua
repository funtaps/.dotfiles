local wibox = require("wibox")
local awful = require("awful")

local volume = {} 

-- volume.widget = widget({ type = "textbox", name = "tb_volume", align = "right" })
volume.widget = wibox.widget.textbox()
volume.widget:set_align("right")

volume.update = function()
    local fd = io.popen("amixer -D pulse sget Master")
    local status = fd:read("*all")
    fd:close()
    local level = string.match(status, "(%d?%d?%d)%%")
    level = string.format("% 3d", level)
    status = string.match(status, "%[(o[^%]]*)%]")
    if string.find(status, "on", 1, true) then
        level = level .. "%"
    else
        level = level .. "M"
    end
    volume.widget:set_markup(level)
end

volume.testAndUpdate = function()
    volume.update()
    awful.util.spawn("paplay /usr/share/sounds/freedesktop/stereo/message.oga")
end

volume.increase = function(q)
    io.popen("amixer -q -D pulse sset Master " .. q .. "%+"):read("*all")
    volume.testAndUpdate()
end

volume.decrease = function(q)
    io.popen("amixer -q -D pulse sset Master " .. q .. "%-"):read("*all")
    volume.testAndUpdate()
end

volume.toggleMute = function()
    io.popen("amixer -D pulse sset Master toggle"):read("*all")
    volume.testAndUpdate()
end

volume.upMin = function() volume.increase(1) end
volume.up = function() volume.increase(5) end
volume.upMax = function() volume.increase(20) end
volume.downMin = function() volume.decrease(1) end
volume.down = function() volume.decrease(5) end
volume.downMax = function() volume.decrease(20) end

volume.widget:buttons(awful.util.table.join(
    awful.button({}, 1, volume.up),
    awful.button({}, 3, volume.down),
    awful.button({"Shift"}, 1, volume.upMin),
    awful.button({"Shift"}, 3, volume.downMin),
    awful.button({"Control"}, 1, volume.upMax),
    awful.button({"Control"}, 3, volume.downMax)
))

return volume
