hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()

    hs.application.launchOrFocus("Google Chrome")
    hs.application.launchOrFocus("iTerm")

    local laptopScreen = hs.screen.allScreens()[1]:name()
    local windowLayout = {
        {"iTerm", nil, laptopScreen, hs.layout.left30, nil, nil},
        {"Google Chrome", nil, laptopScreen, hs.layout.right70, nil, nil},
    }

    hs.layout.apply(windowLayout)

end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()

    hs.application.launchOrFocus("Google Chrome")

    local laptopScreen = hs.screen.allScreens()[1]:name()
    local windowLayout = {
        {"Google Chrome", nil, laptopScreen, hs.layout.maximized, nil, nil},
    }

    hs.layout.apply(windowLayout)

end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()

    hs.application.launchOrFocus("iTerm")

    local laptopScreen = hs.screen.allScreens()[1]:name()
    local windowLayout = {
        {"iTerm", nil, laptopScreen, hs.layout.maximized, nil, nil},
    }

    hs.layout.apply(windowLayout)

end)


hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()

    hs.application.launchOrFocus("Atom")

    local laptopScreen = hs.screen.allScreens()[1]:name()
    local windowLayout = {
        {"Atom", nil, laptopScreen, hs.layout.maximized, nil, nil},
    }

    hs.layout.apply(windowLayout)

end)
