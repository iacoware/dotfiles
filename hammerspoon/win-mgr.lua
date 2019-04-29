local hyperSnap = {"ctrl", "alt", "cmd"}
local hyperMove = {"ctrl", "alt"}
local hyperResize = {"ctrl", "alt", "shift"}
local moveIncrement = 30
local sizeIncrement = 30
local prevFrame = {}

-- Move to next monitor
hs.hotkey.bind(hyperMove, "M", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local nextScreen = screen:next()
    win:moveToScreen(nextScreen)
    hs.alert.show("Move to next screen")
end)

-- Move windows ← ↑ ↓ →
hs.hotkey.bind(hyperMove, "Up", function()
    moveWindow(0, -moveIncrement)
end)


hs.hotkey.bind(hyperMove, "Down", function()
    moveWindow(0, moveIncrement)
end)

hs.hotkey.bind(hyperMove, "Left", function()
    moveWindow(-moveIncrement, 0)
end)

hs.hotkey.bind(hyperMove, "Right", function()
    moveWindow(moveIncrement, 0)
end)

-- Resize windows ← ↑ ↓ →
hs.hotkey.bind(hyperResize, "Right", function()
    resizeWindow(sizeIncrement, 0)
end)

hs.hotkey.bind(hyperResize, "Left", function()
    resizeWindow(-sizeIncrement, 0)
end)

hs.hotkey.bind(hyperResize, "Down", function()
    resizeWindow(0, sizeIncrement)
end)

hs.hotkey.bind(hyperResize, "Up", function()
    resizeWindow(0, -sizeIncrement)
end)

--Snap windows left & right, maximize, center
hs.hotkey.bind(hyperSnap, "Left", function()
    snapWindow(0, 0, 0.5, 1)
end)

hs.hotkey.bind(hyperSnap, "Right", function()
    snapWindow(0.5, 0, 0.5, 1)
end)

hs.hotkey.bind(hyperSnap, "C", function()
    snapWindow(0.25/2, 0.25/2, 0.75, 0.75)
end)

hs.hotkey.bind(hyperSnap, "F", function()
    snapWindow(0, 0, 1, 1)
end)

-- Restore prev size and position
hs.hotkey.bind(hyperMove, "-", function()
    local prev = getPrevWin(hs.window.focusedWindow())

    adjustWindow(function(f)
        f.x = prev.x
        f.y = prev.y
        f.w = prev.w
        f.h = prev.h
    end)
end)

-------------------------------------- Private functions
function moveWindow(xInc, yInc)
    adjustWindow(function(f)
        f.x = f.x + xInc
        f.y = f.y + yInc
    end)
end

function resizeWindow(wInc, hInc)
    adjustWindow(function(f)
        f.w = f.w + wInc
        f.h = f.h + hInc
    end)
end

function snapWindow(xf, yf, wf, hf)
    adjustWindow(function(f, s)
        f.x = s.w * xf
        f.y = s.h * yf
        f.w = s.w * wf
        f.h = s.h * hf
    end)
end

function adjustWindow(adjustment)
    local win = hs.window.focusedWindow()
    local winFrame = win:frame()
    local screen = win:screen()
    local screenFrame = screen:frame()
  
    setPrevWin(win)
    adjustment(winFrame, screenFrame, win)
    win:setFrame(winFrame)
end

function setPrevWin(win)
    local f = win:frame()
    prevFrame = {id = win:id(), x = f.x, y = f.y, w = f.w, h = f.h}
end

function getPrevWin(win)
    return copyFrame(prevFrame)
end

function copyFrame(f)
    return {id = f.id, x = f.x, y = f.y, w = f.w, h = f.h}
end