local tiling = require 'hs.tiling'
local appliaction = require 'hs.application'
local hyper = { 'cmd', 'alt', 'shift', 'ctrl' }

-- Window management
--------------------

hs.window.animationDuration = 0

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

hs.hotkey.bind(hyper, '1', function() tiling.goToLayout('gp-vertical'); moveMouse() end)
hs.hotkey.bind(hyper, '2', function() tiling.goToLayout('fullscreen'); moveMouse() end)
hs.hotkey.bind(hyper, 'f', function() tiling.toggleFloat(center); moveMouse() end)
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

tiling.set('layouts', { 'fullscreen', 'gp-vertical', 'gp-horizontal', 'columns' })
