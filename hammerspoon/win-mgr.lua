local hyperSnap = {"ctrl", "alt", "cmd"}
local hyperMove = {"ctrl", "alt"}
local hyperResize = {"ctrl", "alt", "shift"}
local moveIncrement = 30
local sizeIncrement = 30
local prevFrame = {}

function moveCurried(xInc, yInc)
    return function() moveWindow(xInc, yInc) end
end

function resizeCurried(wInc, hInc)
    return function() resizeWindow(wInc, hInc) end
end

function snapCurried(xf, yf, wf, hf)
    return function() snapWindow(xf, yf, wf, hf) end
end

-- Move windows ← ↑ ↓ →
hs.hotkey.bind(hyperMove, "Up",     moveCurried(0, -moveIncrement))
hs.hotkey.bind(hyperMove, "Down",   moveCurried(0, moveIncrement))
hs.hotkey.bind(hyperMove, "Left",   moveCurried(-moveIncrement, 0))
hs.hotkey.bind(hyperMove, "Right",  moveCurried(moveIncrement, 0))

-- Resize windows ← ↑ ↓ →
hs.hotkey.bind(hyperResize, "Right",resizeCurried(sizeIncrement, 0))
hs.hotkey.bind(hyperResize, "Left", resizeCurried(-sizeIncrement, 0))
hs.hotkey.bind(hyperResize, "Down", resizeCurried(0, sizeIncrement))
hs.hotkey.bind(hyperResize, "Up",   resizeCurried(0, -sizeIncrement))

--Snap windows left & right, maximize, center
hs.hotkey.bind(hyperSnap, "Left",   snapCurried(0, 0, 0.5, 1))
hs.hotkey.bind(hyperSnap, "Right",  snapCurried(0.5, 0, 0.5, 1))
hs.hotkey.bind(hyperSnap, "C",      snapCurried(0.25/2, 0.25/2, 0.75, 0.75))
hs.hotkey.bind(hyperSnap, "F",      snapCurried(0, 0, 1, 1))

-- Move to next monitor
hs.hotkey.bind(hyperSnap, "M", function()
    local win = hs.window.focusedWindow()
    win:moveToScreen(win:screen():next())
    hs.alert.show("Move to next screen")
end)

-- Restore prev size and position
hs.hotkey.bind(hyperSnap, "-", function()
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