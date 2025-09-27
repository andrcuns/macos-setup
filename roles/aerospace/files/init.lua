hs.ipc = require("hs.ipc")

function placeTerminal(id)
    local win = hs.window.get(id)
    if not win then
        hs.alert.show("Window with id " .. tostring(id) .. " not found")
        return
    end

    local screen = win:screen():frame()

    -- Desired proportions
    local ww = math.floor(screen.w * 0.99)
    local wh = math.floor(screen.h * 0.70)
    local x  = math.floor(screen.x + (screen.w - ww) / 2) -- center horizontally
    local y  = math.floor(screen.y + (screen.h * 0.009))

    win:setFrame({x = x, y = y, w = ww, h = wh})
    win:focus()
end
