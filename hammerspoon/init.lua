local tiling = require 'hs.tiling'
local appliaction = require 'hs.application'
local hyper = { 'cmd', 'alt', 'shift', 'ctrl' }

-- Window management
--------------------

hs.window.animationDuration = 0
tiling.set('layouts', { 'fullscreen', 'gp-vertical' })

function isInScreen(screen, win)
  return win:screen() == screen
end

function moveMouse()
  local pt = hs.geometry.rectMidPoint(hs.window.focusedWindow():frame())
  hs.mouse.setAbsolutePosition(pt)
end

function focusScreen(screen)
  -- Get windows within screen, ordered from front to back.
  -- If no windows exist, bring focus to desktop. Otherwise, set focus on
  -- front-most application window.
  local windows = hs.fnutils.filter(
      hs.window.orderedWindows(),
      hs.fnutils.partial(isInScreen, screen))
  local windowToFocus = #windows > 0 and windows[1] or hs.window.desktop()
  windowToFocus:focus()
  moveMouse()
end

-- Push the window into the center of the screen
local function center(window)
  frame = window:screen():frame()
  frame.x = frame.w * 0.1
  frame.y = frame.h * 0.1
  frame.w = frame.w * 0.8
  frame.h = frame.h * 0.8
  window:setFrame(frame)
end

local function fullsize(window)
  frame = window:screen():frame()
  frame.x = 0
  frame.y = 0
  frame.w = frame.w
  frame.h = frame.h
  window:setFrame(frame)
end

local function size720(window) 
  frame = window:screen():frame()
  frame.x = (frame.w - 1280) / 2
  frame.y = (frame.h - 720) / 2
  frame.w = 1280
  frame.h = 720
  window:setFrame(frame)
end

local function size900(window) 
  frame = window:screen():frame()
  frame.x = (frame.w - 1440) / 2
  frame.y = (frame.h - 900) / 2
  frame.w = 1440
  frame.h = 900
  window:setFrame(frame)
end

local function size1080(window) 
  frame = window:screen():frame()
  frame.x = (frame.w - 1920) / 2
  frame.y = (frame.h - 1080) / 2
  frame.w = 1920
  frame.h = 1080
  window:setFrame(frame)
end

hs.hotkey.bind(hyper, 'f', function() tiling.toggleFloat(center); moveMouse() end)
hs.hotkey.bind(hyper, 't', function() tiling.toggleFloat(size720); moveMouse() end)
hs.hotkey.bind(hyper, 'y', function() tiling.toggleFloat(size900); moveMouse() end)
hs.hotkey.bind(hyper, 'u', function() tiling.toggleFloat(size1080); moveMouse() end)
hs.hotkey.bind(hyper, 'z', function() fullsize(hs.window.focusedWindow()); moveMouse() end)
hs.hotkey.bind(hyper, 'r', function() tiling.retile(); moveMouse() end)
hs.hotkey.bind(hyper, 'a', function() tiling.cycle(1); moveMouse() end)
hs.hotkey.bind(hyper, 'w', function() tiling.promote(); moveMouse() end)
hs.hotkey.bind(hyper, 'c', function() tiling.cycleLayout(); moveMouse() end)
hs.hotkey.bind(hyper, '[', function() hs.window.focusedWindow():moveOneScreenNorth(); moveMouse() end)
hs.hotkey.bind(hyper, ']', function() hs.window.focusedWindow():moveOneScreenSouth(); moveMouse() end)
hs.hotkey.bind(hyper, 'h', function() hs.window.focusedWindow():focusWindowWest(); moveMouse() end)
hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():focusWindowSouth(); moveMouse() end)
hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():focusWindowNorth(); moveMouse() end)
hs.hotkey.bind(hyper, 'l', function() hs.window.focusedWindow():focusWindowEast(); moveMouse() end)
hs.hotkey.bind(hyper, 'n', function () focusScreen(hs.window.focusedWindow():screen():next()) end)

-- map hyper + number to the corresponding fn-key, since the touchbar
-- kinda sucks, and karabiner-elements is breaking fn-function to show keys
hs.hotkey.bind(hyper, '1', function() hs.eventtap.keyStroke({}, 'F1') end)
hs.hotkey.bind(hyper, '2', function() hs.eventtap.keyStroke({}, 'F2') end)
hs.hotkey.bind(hyper, '3', function() hs.eventtap.keyStroke({}, 'F3') end)
hs.hotkey.bind(hyper, '4', function() hs.eventtap.keyStroke({}, 'F4') end)
hs.hotkey.bind(hyper, '5', function() hs.eventtap.keyStroke({}, 'F5') end)
hs.hotkey.bind(hyper, '6', function() hs.eventtap.keyStroke({}, 'F6') end)
hs.hotkey.bind(hyper, '7', function() hs.eventtap.keyStroke({}, 'F7') end)
hs.hotkey.bind(hyper, '8', function() hs.eventtap.keyStroke({}, 'F8') end)
hs.hotkey.bind(hyper, '9', function() hs.eventtap.keyStroke({}, 'F9') end)
hs.hotkey.bind(hyper, '0', function() hs.eventtap.keyStroke({}, 'F10') end)
hs.hotkey.bind(hyper, '-', function() hs.eventtap.keyStroke({}, 'F11') end)
hs.hotkey.bind(hyper, '=', function() hs.eventtap.keyStroke({}, 'F12') end)

