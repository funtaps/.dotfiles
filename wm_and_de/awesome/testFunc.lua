local naughty = require("naughty")
local awful = require("awful")

function anyDump(value, stopCounter, iterCounter)
    if not stopCounter then stopCounter = 0 end
    if not iterCounter then iterCounter = 0 end
    local text = ""
    if type(value) == "function" then
        text = text .. "[function]"
    elseif type(value) == "string" then
        text = text .. '"' .. value .. '"'
    elseif type(value) == "number" then
        text = text .. value
    elseif type(value) == "table" then
        if stopCounter > 0 then
            if iterCounter > 0 then
                text = text .. "{\n"
            end
            local ns = stopCounter - 1
            local ni = iterCounter + 1
            for nk, nv in pairs(value) do
                for i = 1, iterCounter do
                    text = text .. "  "
                end
                text = text .. nk .. ": "
                text = text .. anyDump(nv, ns, ni)
            end
            if iterCounter > 0 then
                for i = 2, iterCounter do
                    text = text .. "  "
                end
                text = text .. "}"
            end
        else
            text = text .. "{}"
        end
    else
        text = text .. "[?" .. type(value) .. "]"
    end
    text = text .. "\n"
    return text
end


function dbg(table, depth, title)
    naughty.notify({title = title, text = anyDump(table, depth), timeout = 15 })
end

local f = function ()

    -- local tags = awful.tag.gettags(2)
    -- if table.getn(tags) == 8 then
        -- awful.tag.delete(awful.tag.gettags(2)[8])
    -- else
        -- awful.tag.add("a")
    -- end

-- local nt = awful.tag.add("term", {})
-- awful.tag.viewonly(nt)
-- awful.tag.delete(nt)
dbg(table.getn(awful.tag.gettags(1)), 2)
-- awful.tag.viewonly(nt)
--- awful.util.spawn(terminal) 

end


return f
