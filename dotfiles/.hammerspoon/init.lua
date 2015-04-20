BROWSER = "Google Chrome"
CHAT = "HipChat"
CONSOLE = "iTerm"
EDITOR = "Atom"

hs.window.animationDuration = 0;

function getScreens()
    screens = {}
    screens[1] = hs.screen.allScreens()[1]:name()

    if hs.screen.allScreens()[2] then
        screens[2] = hs.screen.allScreens()[2]:name()
    else
        screens[2] = screens[1]
    end

    return screens
end


-- Focus window shortcuts
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
    hs.application.launchOrFocus(CHAT)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
    hs.application.launchOrFocus(CONSOLE)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
    hs.application.launchOrFocus(BROWSER)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
    hs.application.launchOrFocus(EDITOR)
end)


-- Predefined window layouts
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
    local screens = getScreens()
    local windowLayout = {
        {CONSOLE, nil, screens[1], hs.layout.maximized, nil, nil},
        {BROWSER, nil, screens[1], hs.layout.maximized, nil, nil},
        {EDITOR, nil, screens[2], hs.layout.maximized, nil, nil},
    }
    hs.layout.apply(windowLayout)
    hs.alert.show('Maximized layout: editor focus')
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
    local screens = getScreens()
    local windowLayout = {
        {CONSOLE, nil, screens[1], hs.layout.left30, nil, nil},
        {BROWSER, nil, screens[1], hs.layout.right70, nil, nil},
        {EDITOR, nil, screens[2], hs.layout.maximized, nil, nil},
    }
    hs.layout.apply(windowLayout)
    hs.alert.show('Split layout: editor focus')
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
    local screens = getScreens()
    local windowLayout = {
        {CONSOLE, nil, screens[1], hs.layout.left30, nil, nil},
        {EDITOR, nil, screens[1], hs.layout.right70, nil, nil},
        {BROWSER, nil, screens[2], hs.layout.maximized, nil, nil},
    }
    hs.layout.apply(windowLayout)
    hs.alert.show('Split layout: browser focus')
end)


-- Basic window moving shortcuts
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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind({"alt", "ctrl"}, "left", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest()
end)

hs.hotkey.bind({"alt", "ctrl"}, "right", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast()
end)
