# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="webgefrickel"


# default plugins to load
plugins=(brew git git-flow github history-substring-search jake-node npm node gem osx zsh-syntax-highlighting)


source $ZSH/oh-my-zsh.sh
unsetopt correct_all


# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file


# z script installed via homebrew
. `brew --prefix`/etc/profile.d/z.sh


# rvm TODO use rbenv in the future
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
