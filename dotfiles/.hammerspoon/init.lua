BROWSER = "Google Chrome"
CHAT = "HipChat"
CONSOLE = "iTerm"
EDITOR = "Atom"

laptopScreen = hs.screen.allScreens()[1]:name()

hs.window.animationDuration = 0;


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    hs.application.launchOrFocus(CHAT)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
    hs.application.launchOrFocus(EDITOR)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
    hs.application.launchOrFocus(CONSOLE)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
    hs.application.launchOrFocus(BROWSER)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
    local windowLayout = {
        {CONSOLE, nil, laptopScreen, hs.layout.maximized, nil, nil},
        {BROWSER, nil, laptopScreen, hs.layout.maximized, nil, nil},
        {EDITOR, nil, laptopScreen, hs.layout.maximized, nil, nil},
    }
    hs.layout.apply(windowLayout)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
    local windowLayout = {
        {CONSOLE, nil, laptopScreen, hs.layout.left30, nil, nil},
        {BROWSER, nil, laptopScreen, hs.layout.right70, nil, nil},
        {EDITOR, nil, laptopScreen, hs.layout.maximized, nil, nil},
    }
    hs.layout.apply(windowLayout)
end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.right70)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.left30)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "right", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.right50)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "left", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.left50)
end)
