local awful = require("awful")
local naughty = require("naughty")
local volume = require("volume")

function goToTag(tagIdx, andMoveWindow)
    local screen = mouse.screen
    local currentScreenTags = awful.tag.gettags(screen)
    if tagIdx > 0 and tagIdx <= table.getn(currentScreenTags) then
        local tag = currentScreenTags[tagIdx]
        if andMoveWindow then
            awful.client.movetotag(tag)
        end
        awful.tag.viewonly(tag)
    end
end

local f = {
    goToPrevTag = function() goToTag(awful.tag.getidx() - 1) end,
    goToNextTag = function() goToTag(awful.tag.getidx() + 1) end,
    moveToPrevTag = function() goToTag(awful.tag.getidx() - 1, true) end,
    moveToNextTag = function() goToTag(awful.tag.getidx() + 1, true) end,
    cycleWindows = function ()
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end,
    goToNextScreen = function () awful.screen.focus_relative(1) end,
    moveToNextScreen = awful.client.movetoscreen,
    increaseMain = function () awful.tag.incmwfact(0.05) end,
    decreaseMain = function () awful.tag.incmwfact(-0.05) end,
    lock = function () awful.util.spawn("gnome-screensaver-command -l") end,
    openTerminal = function () awful.util.spawn(terminal) end,
    autostart = function ()
            awful.util.spawn("nm-applet")
            awful.util.spawn("gksudo xfce4-power-manager-settings")
        end,
    splitScreens = function ()
            if screen.count() == 1 then
                awful.util.spawn("xrandr --output DP1 --auto --right-of eDP1")
            else
                awful.util.spawn("xrandr --output DP1 --off")
            end
        end
}


local globalkeys = awful.util.table.join(
    awful.key({modkey}, "h", f.goToPrevTag),
    awful.key({modkey}, "l", f.goToNextTag),
    awful.key({modkey, "Control"}, "h", f.moveToPrevTag),
    awful.key({modkey, "Control"}, "l", f.moveToNextTag),

    awful.key({}, "XF86AudioRaiseVolume", volume.up),
    awful.key({}, "XF86AudioLowerVolume", volume.down),
    awful.key({"Shift"}, "XF86AudioRaiseVolume", volume.upMin),
    awful.key({"Shift"}, "XF86AudioLowerVolume", volume.downMin),
    awful.key({"Control"}, "XF86AudioRaiseVolume", volume.upMax),
    awful.key({"Control"}, "XF86AudioLowerVolume", volume.downMax),

    awful.key({modkey}, "j", f.cycleWindows),

    awful.key({modkey}, "k", f.goToNextScreen),
    awful.key({modkey, "Control"}, "k", f.moveToNextScreen),

    awful.key({modkey, "Shift"}, "l", f.increaseMain),
    awful.key({modkey, "Shift"}, "h", f.decreaseMain),

    awful.key({modkey, "Control"}, "d", f.splitScreens),

    awful.key({}, "XF86Favorites", f.lock),

    awful.key({modkey}, "t", function ()
        local testFunc = dofile("/home/kfuntov/.config/awesome/testFunc.lua")
        testFunc()
    end),

    awful.key({modkey}, "Return", f.openTerminal),
    awful.key({modkey, "Control"}, "s", f.autostart),
    awful.key({modkey, "Control"}, "r", awesome.restart),
    awful.key({modkey, "Control"}, "q", awesome.quit)
)




for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({modkey}, "#" .. i + 9,
            function() goToTag(i) end),
        awful.key({modkey, "Control"}, "#" .. i + 9,
            function() goToTag(i, true) end)
    )
end

return globalkeys
