--[[ ##### TODO
* commit files into dotfiles
* split files into init.lua and win management (move + resize + snap + other monitor) 
* it would be great to see what command are available (split command-declaration from command-body)
* win mngm: implement go back which restore prev size&position
* win mngm: batch history so that 3 move-left end up just as one entry in the history
 ]]

local hyper = {"ctrl", "alt", "cmd"}
local hyper2 = {"ctrl", "alt"}
local hyperSnap = {"ctrl", "alt", "cmd"}
local hyperMove = {"ctrl", "alt"}
local hyperResize = {"ctrl", "alt", "shift"}
local moveIncrement = 30
local sizeIncrement = 30

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true

local log = hs.logger.new('max-window-mgm', 'debug')

hs.window.animationDuration = 0

--Show messages
--hs.alert.show('Hello world')
--hs.notify.new({title="Hammerspoon", informativeText="Hello world"}):send()    

hs.hotkey.bind(hyper, "I", hs.toggleConsole)
hs.hotkey.bind(hyper, "R", hs.reload)

hs.hotkey.bind(hyper2, "M", function()
    local win = hs.window.focusedWindow()
    local screen = win:screen()
    local nextScreen = screen:next()
    win:moveToScreen(nextScreen)
    hs.alert.show("Move to next screen")
end)

-- Move windows H,J,K,L + grow, shrink
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

spoon.SpoonInstall:andUse("ColorPicker",
    {
        --disable = true,
        hotkeys = {
            show = { hyper, "P" }
        },
        config = {
            show_in_menubar = false,
        },
        start = true,
    }
)

spoon.SpoonInstall:andUse("TextClipboardHistory",
    {
        --disable = true,
        config = {
            show_in_menubar = true,
        },
        hotkeys = {
            toggle_clipboard = { { "cmd", "shift" }, "v" } 
        },
        start = true,
    }
)

spoon.SpoonInstall:andUse("FadeLogo",
    {
        config = {
            default_run = 1.0,
        },
        start = true
    }
)