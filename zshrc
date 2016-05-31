# Load the functions, aliases, function etc.
for file in ~/dotfiles/zsh/{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# a nice prompt
autoload -U promptinit && promptinit
prompt pure

# completions
autoload -U compinit && compinit -C
autoload bashcompinit && bashcompinit

# autocomplete for the git alias
compdef g=git
compdef gf=git-flow

# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end


# history settings
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000

bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# easy vim/terminal switch
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# smart urls
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# jobs
setopt long_list_jobs

# source some zsh and other plugins
source $HOME/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/zsh/zsh-completions/zsh-completions.plugin.zsh
source $HOME/dotfiles/zsh/forklift/forklift.plugin.zsh

# nice dircolors -- this requires installed coreutils and lscolors fallback
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
eval `gdircolors $HOME/dotfiles/zsh/dircolors-solarized/dircolors.256dark`

# fasd
eval "$(fasd --init auto)"

# nvm
export NVM_DIR="/Users/webgefrickel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
