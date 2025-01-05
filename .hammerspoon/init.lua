local app = require('hs.application')
local eventtap = require('hs.eventtap')
local geometry = require('hs.geometry')
local hotkey = require('hs.hotkey')
local layout = require('hs.layout')
local win = require('hs.window')

-- Custom variables
--------------------

local hyper = { 'cmd', 'alt', 'shift', 'ctrl' }
local alt = { 'alt' }
local altShift = { 'alt', 'shift' }
local laptopMonitor = "Built-in Retina Display"
local mainMonitor = "DELL U3415W"
-- local mainMonitor = "DELL U3419W"

-- Custom positions and layouts where which apps can be on the screen
--------------------

local screenPositions = {
  left = geometry.rect(0, 0, 0.5, 1),
  leftTop = { x = 0, y = 0, w = 0.5, h = 0.5 },
  leftBottom = { x= 0, y = 0.5, w = 0.5, h = 0.5 },
  right = geometry.rect(0.5, 0, 0.5, 1),
  rightTop = { x = 0.5, y = 0, w = 0.5, h = 0.5 },
  rightBottom = { x= 0.5, y = 0.5, w = 0.5, h = 0.5 },
  top = geometry.rect(0, 0, 1, 0.5),
  bottom = geometry.rect(0, 0.5, 1, 0.5),
  center = geometry.rect(0.2, 0.2, 0.6, 0.6),
  max = geometry.rect(0.1, 0.1, 0.8, 0.8),
  full = geometry.rect(0, 0, 1, 1),
}

local layoutDouble = {
  { "Mail", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Microsoft Teams", nil, mainMonitor, screenPositions.rightBottom, nil, nil },
  { "Signal", nil, mainMonitor, screenPositions.rightBottom, nil, nil },
  { "Strongbox", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "TIDAL", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "WezTerm", nil, mainMonitor, screenPositions.right, nil, nil },
  { "Zen Browser", nil, mainMonitor, screenPositions.left, nil, nil },
}

local layoutSingle = {
  { "Mail", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Microsoft Teams", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Signal", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Strongbox", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "TIDAL", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "WezTerm", nil, laptopMonitor, screenPositions.full, nil, nil },
  { "Zen Browser", nil, laptopMonitor, screenPositions.full, nil, nil },
}

local appsToLaunch = {
  "Mail",
  "Microsoft Teams",
  "Signal",
  "Strongbox",
  "TIDAL",
  "WezTerm",
  "Zen Browser",
}

-- Local helper functions
--------------------

local function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

local function launchApps()
  for i, appName in ipairs(appsToLaunch) do
    app.launchOrFocus(appName)
  end
end

local function moveMouse()
  local pt = geometry.rectMidPoint(win.focusedWindow():frame())
  hs.mouse.absolutePosition(pt)
end

local function applyPosition(pos)
  local w = win.focusedWindow()
  local screenName = w:screen():name()
  local tempPos = screenPositions[pos]
  local tempLayout = { { app.frontmostApplication(), w, screenName, tempPos, nil, nil } }
  layout.apply(tempLayout)
end

-- Key-trap (cat/baby-mode)
--------------------
local function babymode()
  local alert = require('hs.alert')
  alert('Babymode activated')

  Mousetrap = eventtap.new({
    eventtap.event.types.leftMouseDown,
    eventtap.event.types.rightMouseDown,
  }, function(event)
    return true -- Stop event from propogating
  end)

  Keytrap = eventtap.new({ eventtap.event.types.keyDown }, function(event)
    local keyCode = event:getKeyCode()

    if (math.fmod(keyCode, 2) == 0) then
      hs.window.switcher.nextWindow()
    end

    if keyCode == hs.keycodes.map['\\'] then
      local mod = event:getFlags()
      if (mod.ctrl == true and mod.shift == true and mod.alt == true and mod.cmd == true) then
        alert('Babymode deactivated')
        Mousetrap:stop()
        Keytrap:stop()
      end
    end

    return true -- Stop event from propogating
  end)

  Mousetrap:start()
  Keytrap:start()
end

hotkey.bind(hyper, '\\', function() babymode() end)

-- Window management and general config
--------------------

win.animationDuration = 0
app.enableSpotlightForNameSearches(true)

-- Keybindings
--------------------

-- Applying main two layouts
hotkey.bind(hyper, 'q', function() layout.apply(layoutSingle) end)
hotkey.bind(hyper, 'w', function()
  local screen = require('hs.screen')

  if (tablelength(screen.allScreens()) == 2) then
    layout.apply(layoutDouble)
  else
    layout.apply(layoutSingle)
  end
end)

-- Direct app navigation
hotkey.bind(hyper, 'a', function() app.launchOrFocus('WezTerm') end)
hotkey.bind(hyper, 's', function() app.launchOrFocus('Zen Browser') end)
hotkey.bind(hyper, 'd', function() app.launchOrFocus('TIDAL') end)
-- hotkey.bind(hyper, 'f', function() app.launchOrFocus('Mouseless') end)
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
