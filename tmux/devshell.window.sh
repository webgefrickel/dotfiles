# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "./"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window "devshell"

# Split window into panes.
split_h 50

# Run commands.
run_cmd "git status" 1   # runs in active pane
run_cmd "grunt watch" 2  # runs in pane 1

# Set active pane.
select_pane 1
