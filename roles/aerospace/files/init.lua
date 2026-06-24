hs.ipc = require("hs.ipc")

function placeTerminal(id, monitorName)
    local win = hs.window.get(id)
    if not win then
        hs.alert.show("Window with id " .. tostring(id) .. " not found")
        return
    end

    local escapedName = monitorName:gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
    local targetScreen = hs.screen.find(escapedName)
    if not targetScreen then
        targetScreen = win:screen()
    end

    if win:screen():id() ~= targetScreen:id() then
        win:moveToScreen(targetScreen, false, false, 0)
    end

    local screen = targetScreen:frame()

    local padding = 5
    local ww = math.floor(screen.w - (padding * 2))
    local wh = math.floor(screen.h * 0.70)
    local x  = math.floor(screen.x + padding)
    local y  = math.floor(screen.y + padding)

    win:setFrame({x = x, y = y, w = ww, h = wh})
    win:focus()
end
