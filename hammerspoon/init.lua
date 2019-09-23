--[[ ##### TODO
* it would be great to see what command are available (split command-declaration from command-body)
* win mngm: implement go back which restore prev size&position
* win mngm: batch history so that 3 move-left end up just as one entry in the history
 ]]

require("win-mgr")

local hyper = {"ctrl", "alt", "cmd"}
local hyper2 = {"ctrl", "alt"}
local log = hs.logger.new('max-window-mgm', 'debug')
hs.window.animationDuration = 0

--Show messages
--hs.alert.show('Hello world')
--hs.notify.new({title="Hammerspoon", informativeText="Hello world"}):send()    

hs.hotkey.bind(hyper, "I", hs.toggleConsole)
hs.hotkey.bind(hyper, "R", hs.reload)

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true

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
        disable = true,
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