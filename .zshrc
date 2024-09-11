# Zinit
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugins
zi load zsh-users/zsh-autosuggestions
zi load zsh-users/zsh-completions
zi load zdharma-continuum/fast-syntax-highlighting
zi load starship/starship
zi snippet PZTM::history
zi snippet PZTM::completion

# Fixes for unicode
setopt COMBINING_CHARS
setopt NO_HUP # fixes topgrade

# Source exports, aliases and functions
source ~/.zsh/exports.sh
source ~/.zsh/functions.sh
source ~/.zsh/aliases.sh

# other tools init
source <(fzf --zsh)
source <(starship init zsh)
source <(zoxide init zsh)
