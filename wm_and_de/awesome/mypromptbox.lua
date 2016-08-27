local awful = require("awful")
local mypromptbox = {}
for s = 1, screen.count() do
    mypromptbox[s] = awful.widget.prompt()
end

globalkeys = awful.util.table.join(globalkeys,
    awful.key({modkey}, "r",
        function () mypromptbox[mouse.screen]:run() end),


    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

return mypromptbox

