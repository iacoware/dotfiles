local hyperSnap = {"ctrl", "alt", "cmd"}
local hyperMove = {"ctrl", "alt"}
local hyperResize = {"ctrl", "alt", "shift"}
local moveIncrement = 30
local sizeIncrement = 30

-- Move to next monitor
hs.hotkey.bind(hyperMove, "M", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local nextScreen = screen:next()
    win:moveToScreen(nextScreen)
    hs.alert.show("Move to next screen")
end)

-- Move windows ← ↑ ↓ → + grow, shrink
hs.hotkey.bind(hyperMove, "Up", function()
    adjustWindow(function(f)
        f.y = f.y - moveIncrement
    end)
end)


hs.hotkey.bind(hyperMove, "Down", function()
    adjustWindow(function(f)
        f.y = f.y + moveIncrement
    end)
end)

hs.hotkey.bind(hyperMove, "Left", function()
    adjustWindow(function(f)
        f.x = f.x - moveIncrement
    end)
end)

hs.hotkey.bind(hyperMove, "Right", function()
    adjustWindow(function(f)
        f.x = f.x + moveIncrement
    end)
end)

hs.hotkey.bind(hyperResize, "Right", function()
    adjustWindow(function(f)
        f.w = f.w + sizeIncrement
    end)
end)

hs.hotkey.bind(hyperResize, "Left", function()
    adjustWindow(function(f)
        f.w = f.w - sizeIncrement
    end)
end)

hs.hotkey.bind(hyperResize, "Down", function()
    adjustWindow(function(f)
        f.h = f.h + sizeIncrement
    end)
end)

hs.hotkey.bind(hyperResize, "Up", function()
    adjustWindow(function(f)
        f.h = f.h - sizeIncrement
    end)
end)

--Snap windows left & right, maximize, center
hs.hotkey.bind(hyperSnap, "Left", function()
    adjustWindow(function(f, s)
        f.x = s.x
        f.y = s.y
        f.w = s.w / 2
        f.h = s.h
    end)
end)

hs.hotkey.bind(hyperSnap, "Right", function()
    adjustWindow(function(f, s)
        f.x = s.w / 2
        f.y = s.y
        f.w = s.w / 2
        f.h = s.h
    end)
end)

hs.hotkey.bind(hyperSnap, "C", function()
    adjustWindow(function(f, s)
        f.x = s.w * 0.25 / 2
        f.y = s.h * 0.25 / 2
        f.w = s.w * 0.75
        f.h = s.h * 0.75
    end)
end)

hs.hotkey.bind(hyperSnap, "F", function()
    adjustWindow(function(f, s)
        f.x = s.x
        f.y = s.y
        f.w = s.w
        f.h = s.h
    end)
end)

function adjustWindow(adjustment)
    local win = hs.window.focusedWindow()
    local winFrame = win:frame()
    local screen = win:screen()
    local screenFrame = screen:frame()
  
    adjustment(winFrame, screenFrame)
    win:setFrame(winFrame)
end