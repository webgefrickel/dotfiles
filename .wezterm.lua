local wezterm = require('wezterm')
local act = wezterm.action
local config = wezterm.config_builder()
local mux = wezterm.mux

-- helper functions
local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format('file://%s', os.getenv('HOME'))
  return current_dir == HOME_DIR and '~' or string.gsub(tostring(current_dir), '(.*[/\\])(.*)', '%2')
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

-- open new development session with splits and commands
-- this expects the default src / public-dist structure to work
local function newDevelopmentSession(id)
  local sites_dir = wezterm.home_dir .. '/Sites/'
  local path = sites_dir .. id
  local dev_tab, dev_pane, dev_window = mux.spawn_window({
    cwd = path,
    workspace = id,
  })
  local devcli_pane = dev_pane:split({
    workspace = id,
    direction = 'Right',
    cwd = path
  })
  local src_tab, src_pane = dev_window:spawn_tab({ cwd = path })
  local git_tab, git_pane = dev_window:spawn_tab({ cwd = path })

  src_tab:set_title('src')
  src_pane:send_text('v\n')
  git_tab:set_title('git')
  git_pane:send_text('lg\n')
  dev_tab:set_title('zsh')
  devcli_pane:send_text('g pl && g s\n')
  dev_tab:activate()

  mux.set_active_workspace(id)
end

-- base config
config.color_scheme = 'Gruvbox Material (Gogh)'
config.line_height = 1.1
config.font_size = 14
config.font = wezterm.font({
  family = 'MonaspiceAr Nerd Font',
  harfbuzz_features = { 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
})

config.max_fps = 120
config.default_prog = { '/opt/homebrew/bin/zsh' }
config.initial_cols = 140
config.initial_rows = 40
config.inactive_pane_hsb = { saturation = 0.3, brightness = 1 }
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.scrollback_lines = 50000
config.send_composed_key_when_left_alt_is_pressed = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.use_dead_keys = false
config.use_fancy_tab_bar = false
config.window_padding = { left = 5, right = 5, top = 10, bottom = 10 }
config.window_decorations = 'RESIZE'

-- key mappings
config.keys = {
  { key = '\\', mods = 'LEADER', action = act.SplitHorizontal },
  { key = '-', mods = 'LEADER', action = act.SplitVertical },
  { key = ']', mods = 'LEADER', action = act.ActivateCopyMode },
  { key = 'g', mods = 'LEADER', action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
  -- Navigator.nvim keys
  { key = 'h', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-left') },
  { key = 'j', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-down') },
  { key = 'k', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-up') },
  { key = 'l', mods = 'CTRL', action = act.EmitEvent('ActivatePaneDirection-right') },
  -- leader-key mappings
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
    key = 'd',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter name for new workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          newDevelopmentSession(line:gsub('%s+', ''))
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
          mux.rename_workspace(mux.get_active_workspace(), line)
        end
      end),
    },
  },
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

-- always maximise and start default session with mutt, notes and dotfiles
wezterm.on('gui-startup', function()
  local home_dir = wezterm.home_dir
  local tab, pane, window = mux.spawn_window({ cwd = home_dir .. '/Downloads' })
  local mail_tab, mail_pane = window:spawn_tab({ cwd = home_dir })
  local todo_tab, todo_pane = window:spawn_tab({ cwd = home_dir .. '/Notes' })
  local dot_tab, dot_pane = window:spawn_tab({ cwd = home_dir .. '/Dotfiles' })
  local git_pane = dot_pane:split({ direction = 'Right', cwd = home_dir .. '/Dotfiles' })

  tab:set_title('files')
  pane:send_text('y\n')
  mail_tab:set_title('mail')
  mail_pane:send_text('m\n')
  dot_tab:set_title('dotfiles')
  dot_pane:send_text('v +Yazi\n')
  todo_tab:set_title('todo')
  todo_pane:send_text('v -O index.md webgefrickel.md\n')
  git_pane:send_text('g s\n')
  tab:activate()

  -- initialize some sessions for MRU projects and folders
  newDevelopmentSession('ag/core')
  newDevelopmentSession('ag/web')
  newDevelopmentSession('ag/sp')
  newDevelopmentSession('pax/frontend')
  newDevelopmentSession('wwz/frontend')

  mux.set_active_workspace('default')
  window:gui_window():maximize()
end)

return config
