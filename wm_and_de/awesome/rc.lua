local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")

require("errorhandling")

terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "editor"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

globalkeys = require("globalkeys")

require("mytheme")
require("mylayout")
require("windowsrules")

root.keys(globalkeys)
