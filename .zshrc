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
export PYENV_ROOT="$HOME/.pyenv"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

# Paths
export XDG_CONFIG_HOME="$HOME/.config"
export MANPATH=/opt/homebrew/share/man:$MANPATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export PATH=/opt/homebrew/opt/curl/bin:$PATH
export PATH=/.local/bin:$PATH
export PATH=/.composer/vendor/bin:$PATH
export PATH="$PYENV_ROOT/bin:$PATH"

# Aliases
alias -- -='$EDITOR $(fzf)'
alias ...='cd ../..'
alias ..='cd ..'
alias O='cd ~ && mbsync -a && mu index'
alias g='git'
alias l='nvim "+Oil"'
alias lg='lazygit'
alias m='neomutt'
alias nb='npm run build'
alias np='npm run lint && npm run production'
alias nre='n engine > /dev/null && rm -f package-lock.json && rm -rf node_modules && npm install'
alias ns='npm start'
alias q='exit'
alias sudo='sudo '
alias to='tiptop --net en0'
alias upall='n lts && topgrade && npm-check -gu && vimup && brew cleanup && brew autoremove'
alias v=$EDITOR
alias vd='$EDITOR -d'
alias ocrpdf='convert *.jpg -auto-orient temp.pdf && ocrmypdf --rotate-pages --optimize 3 --jpeg-quality 70 temp.pdf ocr.pdf'
alias vim=$EDITOR
alias vimup='nvim --headless "+TSUpdateSync" +qa && nvim --headless "+Lazy! sync" +qa && nvim --headless "+MasonUpdate" +qa'
alias yb='yarn build'
alias yp='yarn lint && yarn production'
alias yre='n engine > /dev/null && rm -f yarn.lock && rm -rf node_modules && yarn'
alias ys='yarn start'

s () { # as in 'show': quicklook file
  trap 'exit 0' 2 #traps Ctrl-C (signal 2)
  qlmanage -p $1 >& /dev/null
}

take () { # shortcut for creating and going into dir
  mkdir -p $1
  cd $1
}

# used in aliases
current_branch () {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# fancy vim/shell switch with ctrl-z (see zshrc)
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

# terminal weather shortcut
wttr () {
  if [[ -n "$1" ]]
    then 
      curl "wttr.in/$1?format=v2"
    else 
      curl "wttr.in/Leipzig?format=v2"
  fi
}

# function for easily converting a video for web
webvideo () {
  if [ $# -eq 0 ]; then
    echo "No arguments supplied, example usage: webvideo FILENAME --resize 1920 --mute"
  else
    zparseopts -E -D -- -resize:=opt_resize -mute=opt_mute

    file=$(basename -- "$1")
    extension="${file##*.}"
    filename="${file%.*}"
    width="${opt_resize[2]}"
    w="${width:-trunc(iw/2)*2}"
    h="trunc(ih/2)*2"

    if [[ -n "$width" ]]
    then
      h="trunc(ow/a/2)*2"
    fi

    scale="scale=$w\:$h"
    ffmpeg -ss 00:00:02 -i $1 -frames:v 1 -vf $scale $filename.jpg

    if [ -z "${opt_mute}" ]; then
      ffmpeg -i $1 -map_metadata -1 -c:a copy -c:v libx264 -crf 26 -preset veryslow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf $scale $filename.h264.mp4
      ffmpeg -i $1 -map_metadata -1 -c:a libopus -b:a 64k -c:v libaom-av1 -crf 50 -b:v 0 -pix_fmt yuv420p -movflags +faststart -cpu-used 8 -vf $scale $filename.av1.webm
    else
      ffmpeg -i $1 -map_metadata -1 -an -c:v libx264 -crf 26 -preset veryslow -profile:v main -pix_fmt yuv420p -movflags +faststart -vf $scale $filename.h264.mp4
      ffmpeg -i $1 -map_metadata -1 -an -c:v libaom-av1 -crf 50 -b:v 0 -pix_fmt yuv420p -movflags +faststart -cpu-used 8 -vf $scale $filename.av1.webm
    fi
  fi
}

pdf () {
  convert *.jpg -auto-orient -monochrome temp.pdf
  ocrmypdf --rotate-pages --optimize 3 --jpeg-quality 70 temp.pdf document.pdf
  rm temp.pdf
  rm *.jpg
}

# easy vim/terminal switch
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# other tools init, pyenv + rbenv are sandboxd
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(rbenv init - --no-rehash)"
eval "$(pyenv init --path --no-rehash)"

# chat-gpt, hooray
source ~/OPENAI_API_KEY.sh
