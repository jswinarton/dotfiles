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


-- Basic window moving shortcuts
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "right", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.right50)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "left", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.left50)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "up", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.layout.maximized)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "down", function()
  local win = hs.window.focusedWindow()
  win:moveToUnit(hs.geometry.unitrect(0.5,0.5,1,1))
end)

hs.hotkey.bind({"alt", "ctrl"}, "left", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenWest()
end)

hs.hotkey.bind({"alt", "ctrl"}, "right", function()
    local win = hs.window.focusedWindow()
    win:moveOneScreenEast()
end)


-- Spotify controls
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "space", function()
--   if hs.spotify.isPlaying() then
--     hs.spotify.pause()
--   else
--     hs.spotify.displayCurrentTrack()
--     hs.spotify.play()
--   end
-- end)
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "left", function()
--   hs.spotify.previous()
--   hs.spotify.displayCurrentTrack()
-- end)
--
-- hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "right", function()
--   hs.spotify.next()
--   hs.spotify.displayCurrentTrack()
-- end)
