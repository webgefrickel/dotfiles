#!/usr/bin/env zsh

alias -- -='$EDITOR $(fzf)'
alias ...='cd ../..'
alias ..='cd ..'
alias cd='z'
alias g='git'
alias l='nvim "+Oil"'
alias lg='lazygit'
alias m='neomutt'
alias q='exit'
alias sudo='sudo '
alias v=$EDITOR
alias vd='$EDITOR -d'
alias vim=$EDITOR

# helpers
alias to='tiptop --net en0'
alias up='n lts && topgrade && npm-check -gu && vup && brew cleanup && brew autoremove'
alias vup='nvim --headless "+TSUpdateSync" +qa && nvim --headless "+Lazy! sync" +qa && nvim --headless "+MasonUpdate" +qa'

# work / dev related
alias nb='npm run build'
alias np='npm run lint && npm run production'
alias nre='n engine > /dev/null && rm -f package-lock.json && rm -rf node_modules && npm install'
alias ns='npm start'
alias yb='yarn build'
alias yp='yarn lint && yarn production'
alias yre='n engine > /dev/null && rm -f yarn.lock && rm -rf node_modules && yarn'
alias ys='yarn start'
