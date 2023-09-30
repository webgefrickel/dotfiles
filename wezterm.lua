local wezterm = require('wezterm')
local mux = wezterm.mux
local act = wezterm.action
local config = wezterm.config_builder()

-- helper functions
local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format('file://%s', os.getenv('HOME'))
  return current_dir == HOME_DIR and '~' or string.gsub(current_dir, '(.*[/\\])(.*)', '%2')
end

local function isVim(pane)
  return pane:get_foreground_process_name():find('n?vim') ~= nil
end

local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
  if isVim(pane) then
    window:perform_action(act.SendKey({ key = vim_direction, mods = 'CTRL' }), pane)
  else
    window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
  end
end

-- base config
config.color_scheme = 'GruvboxDark'
config.font = wezterm.font('FiraCode Nerd Font')
config.default_prog = { '/opt/homebrew/bin/zsh' }
config.font_size = 14.0
config.initial_cols = 120
config.initial_rows = 32
config.inactoutive_pane_hsb = { saturation = 0.5, brightness = 0.9 }
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.scrollback_lines = 5000
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.use_dead_keys = false
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'

-- key mappings
config.keys = {
  { key = '\\',
    mods = 'LEADER',
    action = act.SplitHorizontal,
  },
  {
    key = '-',
    mods = 'LEADER',
    action = act.SplitVertical,
  },
  {
    key = ']',
    mods = 'LEADER',
    action = act.ActivateCopyMode,
  },
  {
    key = ',',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
  {
    key = 'c',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter name for new workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
  {
    key = '$',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Rename current workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          wezterm.mux.rename_workspace(wezterm.mux.get_active_workspace(), line)
        end
      end),
    },
  },
  {
    key = 'g',
    mods = 'LEADER',
    action = act.ShowLauncherArgs {
      flags = 'FUZZY|WORKSPACES',
    },
  },
  -- Navigator.nvim keys
  { key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
  { key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
  { key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
  { key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },
}

-- Navigator.nvim events
wezterm.on('ActivatePaneDirection-right', function(window, pane)
  conditionalActivatePane(window, pane, 'Right', 'l')
end)
wezterm.on('ActivatePaneDirection-left', function(window, pane)
  conditionalActivatePane(window, pane, 'Left', 'h')
end)
wezterm.on('ActivatePaneDirection-up', function(window, pane)
  conditionalActivatePane(window, pane, 'Up', 'k')
end)
wezterm.on('ActivatePaneDirection-down', function(window, pane)
  conditionalActivatePane(window, pane, 'Down', 'j')
end)

-- set tab-title to current dir if not set explicitly
wezterm.on('format-tab-title', function(tab)
  local cwd = get_current_working_dir(tab)
  local title = tab.tab_title
  local num = tab.tab_index + 1

  if title and #title > 0 then
    return string.format('  %s %s  ', num, title)
  end

  return string.format('  %s %s  ', num, cwd)
end)

-- show workspace on the left side of tabbar
wezterm.on('update-status', function(window)
  local workspace = mux.get_active_workspace()
  window:set_left_status(string.format('  %s  ', workspace))
end)

-- always maximise and start default session with mutt, neorg and dotfiles
wezterm.on('gui-startup', function()
 local tab, pane, window = mux.spawn_window({})
 window:gui_window():maximize()
end)

return config
