local tiling = require 'hs.tiling'
local hyper = { 'cmd', 'alt', 'shift', 'ctrl' }
local meta = { 'ctrl', 'cmd' }
local keys = { 
  '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
  'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
  'u', 'v', 'w', 'x', 'y', 'z', '[', ']', 'space'
}

-- hyper mode
-------------

k = hs.hotkey.modal.new({}, 'F17')

local printIsdown = function(b) return b and 'down' or 'up' end

-- sends a key event with all modifiers
-- bool -> string -> void -> side effect
local hyperFunction = function(isdown)
  return function(key)
    return function()
      k.triggered = true
      local event = hs.eventtap.event.newKeyEvent(hyper, key, isdown)
      event:post()
    end
  end
end

local hyperDown = hyperFunction(true)
local hyperUp = hyperFunction(false)

local hyperBind = function(key)
  k:bind('', key, msg, hyperDown(key), hyperUp(key), nil)
end

-- bind all keys defined above to hyper + key
for index, key in pairs(keys) do hyperBind(key) end

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
-- This has to be mapped with karabiner-elements
local pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- send ESCAPE if no other keys are pressed.
local releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
local f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

-- Ctrl-key sends escape if it is hold for less than 0.2 seconds
----------------------------------------------------------------

local send_escape = false
local last_mods = {}
local control_key_timer = hs.timer.delayed.new(0.2, function()
  send_escape = false
end)

hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(evt)
  local new_mods = evt:getFlags()
  if last_mods['ctrl'] == new_mods['ctrl'] then
    return false
  end
  if not last_mods["ctrl"] then
    last_mods = new_mods
    send_escape = true
    control_key_timer:start()
  else
    if send_escape then
      hs.eventtap.keyStroke({}, 'escape')
    end
    last_mods = new_mods
    control_key_timer:stop()
  end
  return false
end):start()

hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(evt)
  send_escape = false
  return false
end):start()


-- Window management
--------------------

-- Push the window into the center of the screen
local function center(window)
  frame = window:screen():frame()
  frame.x = frame.w * 0.1
  frame.y = frame.h * 0.1
  frame.w = frame.w * 0.8
  frame.h = frame.h * 0.8
  window:setFrame(frame)
end

hs.hotkey.bind(hyper, '1', function() tiling.goToLayout('gp-vertical') end)
hs.hotkey.bind(hyper, '2', function() tiling.goToLayout('fullscreen') end)
hs.hotkey.bind(hyper, 'f', function() tiling.toggleFloat(center) end)
hs.hotkey.bind(hyper, 'r', function() tiling.retile() end)
hs.hotkey.bind(hyper, 'a', function() tiling.cycle(1) end)
hs.hotkey.bind(hyper, 'w', function() tiling.promote() end)
hs.hotkey.bind(hyper, 'c', function() tiling.cycleLayout() end)
hs.hotkey.bind(hyper, '[', function() hs.window.focusedWindow():moveOneScreenNorth() end)
hs.hotkey.bind(hyper, ']', function() hs.window.focusedWindow():moveOneScreenSouth() end)
hs.hotkey.bind(hyper, 'h', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(hyper, 'j', function() hs.window.focusedWindow():focusWindowSouth() end)
hs.hotkey.bind(hyper, 'k', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(hyper, 'l', function() hs.window.focusedWindow():focusWindowEast() end)

tiling.set('layouts', { 'fullscreen', 'gp-vertical', 'gp-horizontal', 'columns' })
