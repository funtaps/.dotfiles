local beautiful = require("beautiful")
local gears = require("gears")


local theme = "default"
-- beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/" .. theme .. "/theme.lua")
beautiful.init("/usr/share/awesome/themes/" .. theme .. "/theme.lua")
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
