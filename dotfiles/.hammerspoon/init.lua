BROWSER = "Google Chrome"
CONSOLE = "iTerm"

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


-- Predefined window layouts
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
    local screens = getScreens()
    local windowLayout = {
        {BROWSER, nil, screens[1], hs.layout.right50, nil, nil},
        {EDITOR, nil, screens[1], hs.layout.left50, nil, nil},
    }
    hs.layout.apply(windowLayout)
    hs.alert.show('Default layout')
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
