#!/usr/bin/env zsh

# Shell config
export SHELL=/opt/homebrew/bin/zsh
export TERM=xterm-256color
export CLICOLOR=1
export COPYFILE_DISABLE=true
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export DISABLE_AUTO_TITLE=true
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=$LANG
export LC_COLLATE=C

# Shell tools and 3rd party exports/config
export EDITOR="/opt/homebrew/bin/nvim"
export VISUAL="/opt/homebrew/bin/nvim"
export LESS="-F -i -J -M -R -W -x2 -X -z-4"
export PAGER="less -F -i -J -M -R -W -x2 -X -z-4"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ENV_HINTS=true
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export MANPATH=/opt/homebrew/share/man:$MANPATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/opt/curl/bin:$PATH
export PATH=/.local/bin:$PATH
