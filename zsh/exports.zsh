export CLICOLOR=1
export COPYFILE_DISABLE=true
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export DISABLE_AUTO_TITLE=true
export EDITOR="/opt/homebrew/bin/nvim"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=$LANG
export LC_COLLATE=C
export LESS="-F -i -J -M -R -W -x2 -X -z-4"
export MANPATH=/opt/homebrew/share/man:$MANPATH
export PAGER="less -F -i -J -M -R -W -x2 -X -z-4"
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/opt/curl/bin:$PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH
export SHELL=/opt/homebrew/bin/zsh
export TERM=xterm-256color
export VISUAL="/opt/homebrew/bin/nvim"

# ripgrep
export RIPGREP_CONFIG_PATH="$HOME/dotfiles/ripgreprc"

# brew
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ENV_HINTS=true

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# fzf colors
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} ${FZF_THEME}"

# n node version management
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# lazygit
export LG_CONFIG_FILE="/Users/webgefrickel/.config/lazygit/config.yml"
