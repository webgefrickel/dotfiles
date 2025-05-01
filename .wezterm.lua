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

local function is_inside_vim(pane)
  local tty = pane:get_tty_name()
  if tty == nil then return false end
  local success = wezterm.run_child_process
    { 'sh', '-c',
      'ps -o state= -o comm= -t' .. wezterm.shell_quote_arg(tty) .. ' | ' ..
      'grep -iqE \'^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$\'' }
  return success
end

local function is_outside_vim(pane) return not is_inside_vim(pane) end

local function bind_if(cond, key, mods, action)
  local function callback (win, pane)
    if cond(pane) then
      win:perform_action(action, pane)
    else
      win:perform_action(act.SendKey({key=key, mods=mods}), pane)
    end
  end

  return { key=key, mods=mods, action=wezterm.action_callback(callback) }
end

-- colors and fonts
config.color_scheme = 'Gruvbox Material (Gogh)'
config.line_height = 1.05
config.font_size = 14
config.font = wezterm.font({
  family = 'Maple Mono NF',
  harfbuzz_features = { 'calt', 'zero', 'cv01' },
})

-- base config and minimal layout
config.default_prog = { '/opt/homebrew/bin/zsh' }
config.initial_cols = 140
config.inactive_pane_hsb = { saturation = 0.3, brightness = 1 }
config.initial_rows = 40
config.max_fps = 120
config.scrollback_lines = 50000
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'
config.window_padding = { left = 5, right = 5, top = 10, bottom = 10 }

-- key mappings
config.keys = {
  bind_if(is_outside_vim, 'h', 'CTRL', act.ActivatePaneDirection('Left')),
  bind_if(is_outside_vim, 'l', 'CTRL', act.ActivatePaneDirection('Right')),
  bind_if(is_outside_vim, 'j', 'CTRL', act.ActivatePaneDirection('Down')),
  bind_if(is_outside_vim, 'k', 'CTRL', act.ActivatePaneDirection('Up')),

  { key = '/', mods = 'CTRL|CMD',  action = act.SplitHorizontal },
  { key = '-',  mods = 'CTRL|CMD',  action = act.SplitVertical },
  { key = 'p',  mods = 'CTRL|CMD',  action = act.ActivateCopyMode },
  { key = 'g',  mods = 'CTRL|CMD',  action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' } },
  {
    key = ',',
    mods = 'CTRL|CMD',
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
    key = '.',
    mods = 'CTRL|CMD',
    action = act.PromptInputLine {
      description = 'Rename current workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          mux.rename_workspace(mux.get_active_workspace(), line)
        end
      end),
    },
  },
  {
    key = 'c',
    mods = 'CTRL|CMD',
    action = act.PromptInputLine {
      description = 'Enter name for new workspace',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(act.SwitchToWorkspace({ name = line }), pane)
        end
      end),
    },
  },
}

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
  mux.set_active_workspace('default')
  window:gui_window():maximize()
end)

return config
