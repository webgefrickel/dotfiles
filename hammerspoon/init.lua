local vimouse = require 'vimouse'
local app = require 'hs.application'
local eventtap = require 'hs.eventtap'
local hotkey = require 'hs.hotkey'
local layout = require 'hs.layout'
local win = require 'hs.window'

local hyper = { 'cmd', 'alt', 'shift', 'ctrl' }
local laptopMonitor = "Built-in Retina Display"
local mainMonitor = "TODO TODO"

-- Define position values that don't exist by default in hs.layout.*
local positions = {
  rightTop = { x=0.5, y=0, w=0.5, h=0.5 },
  rightBottom = { x=0.5, y=0.5, w=0.5, h=0.5 }
}

local layoutDouble = {
  {"Reminders", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Calendar", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Firefox", nil, mainMonitor, layout.left50, nil, nil},
  {"ForkLift", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Spotify", nil, laptopMonitor, layout.maximized, nil, nil},
  {"iTerm", nil, mainMonitor, layout.right50, nil, nil},
  {"Messages", nil, mainMonitor, positions.rightTop, nil, nil},
  {"Signal", nil, mainMonitor, positions.rightBottom, nil, nil},
  {"Telegram", nil, mainMonitor, positions.rightTop, nil, nil},
  {"Microsoft Teams", nil, mainMonitor, positions.rightBottom, nil, nil},
}

local layoutSingle = {
  {"Reminders", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Calendar", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Firefox", nil, laptopMonitor, layout.maximized, nil, nil},
  {"ForkLift", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Spotify", nil, laptopMonitor, layout.maximized, nil, nil},
  {"iTerm", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Messages", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Signal", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Telegram", nil, laptopMonitor, layout.maximized, nil, nil},
  {"Microsoft Teams", nil, laptopMonitor, layout.maximized, nil, nil},
}

local appNames = {
  "Reminders",
  "Calendar",
  "Firefox",
  "ForkLift",
  "Spotify",
  "iTerm",
  "Messages",
  "Signal",
  "Telegram",
  "Microsoft Teams",
}

local function launchApps()
  for i, appName in ipairs(appNames) do
    app.launchOrFocus(appName)
  end
end

local function moveMouse()
  local pt = hs.geometry.rectMidPoint(win.focusedWindow():frame())
  hs.mouse.absolutePosition(pt)
end

local function fullSize()
  local w = win.focusedWindow()
  local f = w:frame()
  local max = w:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  w:setFrame(f)
end

-- Window management
--------------------

win.animationDuration = 0

-- Move and click mouse via keyboard
vimouse(hyper, 'm')

-- Window Navigation
-- hotkey D is set in Dash itself
hotkey.bind(hyper, 'a', function() app.launchOrFocus('iTerm') end)
hotkey.bind(hyper, 's', function() app.launchOrFocus('Firefox') end)
hotkey.bind(hyper, 'f', function() app.launchOrFocus('ForkLift') end)
hotkey.bind(hyper, 'g', function() launchApps() end)
hotkey.bind(hyper, 'n', function() layout.apply(layoutSingle) end)
hotkey.bind(hyper, 'p', function() layout.apply(layoutDouble) end)

-- Moving window around / navigating windows
hotkey.bind(hyper, 'z', function() fullSize(); moveMouse() end)
hotkey.bind(hyper, '[', function() win.focusedWindow():moveOneScreenNorth(); moveMouse() end)
hotkey.bind(hyper, ']', function() win.focusedWindow():moveOneScreenSouth(); moveMouse() end)
hotkey.bind(hyper, 'h', function() win.focusedWindow():focusWindowWest(); moveMouse() end)
hotkey.bind(hyper, 'j', function() win.focusedWindow():focusWindowSouth(); moveMouse() end)
hotkey.bind(hyper, 'k', function() win.focusedWindow():focusWindowNorth(); moveMouse() end)
hotkey.bind(hyper, 'l', function() win.focusedWindow():focusWindowEast(); moveMouse() end)

-- map hyper + number to the corresponding fn-key, since the touchbar
-- kinda sucks, and karabiner-elements is breaking fn-function to show keys
hotkey.bind(hyper, '1', function() eventtap.keyStroke({}, 'F1') end)
hotkey.bind(hyper, '2', function() eventtap.keyStroke({}, 'F2') end)
hotkey.bind(hyper, '3', function() eventtap.keyStroke({}, 'F3') end)
hotkey.bind(hyper, '4', function() eventtap.keyStroke({}, 'F4') end)
hotkey.bind(hyper, '5', function() eventtap.keyStroke({}, 'F5') end)
hotkey.bind(hyper, '6', function() eventtap.keyStroke({}, 'F6') end)
hotkey.bind(hyper, '7', function() eventtap.keyStroke({}, 'F7') end)
hotkey.bind(hyper, '8', function() eventtap.keyStroke({}, 'F8') end)
hotkey.bind(hyper, '9', function() eventtap.keyStroke({}, 'F9') end)
hotkey.bind(hyper, '0', function() eventtap.keyStroke({}, 'F10') end)
hotkey.bind(hyper, '-', function() eventtap.keyStroke({}, 'F11') end)
hotkey.bind(hyper, '=', function() eventtap.keyStroke({}, 'F12') end)

