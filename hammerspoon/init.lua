local vimouse = require('vimouse')
local app = require('hs.application')
local eventtap = require('hs.eventtap')
local geometry = require('hs.geometry')
local hotkey = require('hs.hotkey')
local layout = require('hs.layout')
local screen = require('hs.screen')
local win = require('hs.window')

-- Custom variables
--------------------

local hyper = { 'cmd', 'alt', 'shift', 'ctrl' }
local alt = { 'alt' }
local altShift = { 'alt', 'shift' }
local laptopMonitor = "Built-in Retina Display"
local mainMonitor = "DELL U3415W"

-- Custom positions and layouts where which apps can be on the screen
--------------------

local screenPositions = {
  left = geometry.rect(0.01, 0.01, 0.485, 0.98),
  leftTop = { x = 0.01, y = 0.01, w = 0.485, h = 0.485 },
  leftBottom = { x= 0.01, y = 0.505, w = 0.485, h = 0.485 },
  right = geometry.rect(0.505, 0.01, 0.485, 0.98),
  rightTop = { x = 0.505, y = 0.01, w = 0.485, h = 0.485 },
  rightBottom = { x= 0.505, y = 0.505, w = 0.485, h = 0.485 },
  top = geometry.rect(0.01, 0.01, 0.98, 0.485),
  bottom = geometry.rect(0.01, 0.505, 0.98, 0.485),
  center = geometry.rect(0.15, 0.15, 0.7, 0.7),
  max = geometry.rect(0.01, 0.01, 0.98, 0.98),
  full = geometry.rect(0, 0, 1, 1),
}

local layoutDouble = {
  { "Calendar", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Firefox", nil, mainMonitor, screenPositions.left, nil, nil },
  { "ForkLift", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Messages", nil, mainMonitor, screenPositions.rightTop, nil, nil },
  { "Microsoft Teams", nil, mainMonitor, screenPositions.rightBottom, nil, nil },
  { "Reminders", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Signal", nil, mainMonitor, screenPositions.rightBottom, nil, nil },
  { "Spotify", nil, mainMonitor, screenPositions.left, nil, nil },
  { "Telegram", nil, mainMonitor, screenPositions.rightTop, nil, nil },
  { "iTerm2", nil, mainMonitor, screenPositions.right, nil, nil },
}

local layoutSingle = {
  { "Calendar", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Firefox", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "ForkLift", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Messages", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Microsoft Teams", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Reminders", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Signal", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Spotify", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Telegram", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "iTerm2", nil, laptopMonitor, screenPositions.full, nil, nil },
}

local appNames = {
  "Calendar",
  "Firefox",
  "ForkLift",
  "Messages",
  "Microsoft Teams",
  "Reminders",
  "Signal",
  "Spotify",
  "Telegram",
  "iTerm",
}

-- Local helper functions
--------------------

local function launchApps()
  for i, appName in ipairs(appNames) do
    app.launchOrFocus(appName)
  end
end

local function moveMouse()
  local pt = hs.geometry.rectMidPoint(win.focusedWindow():frame())
  hs.mouse.absolutePosition(pt)
end

local function applyPosition(pos)
  local w = win.focusedWindow()
  local screenName = w:screen():name()
  local tempPos = screenPositions[pos]
  local tempLayout = {
    { app.frontmostApplication(), w, screenName, tempPos, nil, nil },
  }

  layout.apply(tempLayout)
end

-- Window management and general config
--------------------

win.animationDuration = 0

-- Keybindings
--------------------

-- Applying main two layouts
hotkey.bind(hyper, 'q', function() layout.apply(layoutSingle) end)
hotkey.bind(hyper, 'w', function() layout.apply(layoutDouble) end)

-- Direct app navigation
-- hotkey D is set in Dash itself
hotkey.bind(hyper, 'a', function() app.launchOrFocus('iTerm') end)
hotkey.bind(hyper, 's', function() app.launchOrFocus('Firefox') end)
hotkey.bind(hyper, 'f', function() app.launchOrFocus('ForkLift') end)
hotkey.bind(hyper, 'g', function() launchApps() end)

-- Moving windows around / navigating windows
hotkey.bind(hyper, '[', function() win.focusedWindow():moveOneScreenNorth(); moveMouse() end)
hotkey.bind(hyper, ']', function() win.focusedWindow():moveOneScreenSouth(); moveMouse() end)
hotkey.bind(hyper, 'z', function() applyPosition('full'); moveMouse() end)
hotkey.bind(hyper, 'x', function() applyPosition('max'); moveMouse() end)
hotkey.bind(hyper, 'c', function() applyPosition('center'); moveMouse() end)
hotkey.bind(hyper, 'h', function() applyPosition('left'); moveMouse() end)
hotkey.bind(hyper, 'u', function() applyPosition('leftTop'); moveMouse() end)
hotkey.bind(hyper, 'n', function() applyPosition('leftBottom'); moveMouse() end)
hotkey.bind(hyper, 'l', function() applyPosition('right'); moveMouse() end)
hotkey.bind(hyper, 'i', function() applyPosition('rightTop'); moveMouse() end)
hotkey.bind(hyper, 'm', function() applyPosition('rightBottom'); moveMouse() end)
hotkey.bind(hyper, 'k', function() applyPosition('top'); moveMouse() end)
hotkey.bind(hyper, 'j', function() applyPosition('bottom'); moveMouse() end)

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

-- macos keyboard input source switching is still broken AF, so we map
-- umlauts and others manually with hammerspoon, instead of using US-german-layout
-- dunno why I had to add a space beföre ´äÄ, but this way it works
hotkey.bind(alt, 'a', function() eventtap.keyStrokes(' ä') end)
hotkey.bind(alt, 'o', function() eventtap.keyStrokes('ö') end)
hotkey.bind(alt, 's', function() eventtap.keyStrokes('ß') end)
hotkey.bind(alt, 'u', function() eventtap.keyStrokes('ü') end)
hotkey.bind(altShift, 'a', function() eventtap.keyStrokes(' Ä') end)
hotkey.bind(altShift, 'o', function() eventtap.keyStrokes('Ö') end)
hotkey.bind(altShift, 'u', function() eventtap.keyStrokes('Ü') end)

vimouse(hyper, ',')
