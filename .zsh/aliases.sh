#!/usr/bin/env zsh

alias -- -='$EDITOR $(fzf)'
alias ...='cd ../..'
alias ..='cd ..'
alias cd='z'
alias ff='fastfetch'
alias g='git'
alias l='y'
alias lg='lazygit'
alias m='neomutt'
alias nvimdiff='nvim -d'
alias q='exit'
alias sudo='sudo '
alias v=$EDITOR
alias vd='$EDITOR -d'
alias vim=$EDITOR

# helpers
alias vup='nvim --headless "+TSUpdateSync" +qa && nvim --headless "+Lazy! sync" +qa && nvim --headless "+MasonUpdate" +qa'
alias up='n lts && topgrade && npm-check -gu && vup && brew cleanup && brew autoremove && nvim "+Mason"'

# work / dev related
alias nb='npm run build'
alias np='npm run lint && npm run production'
alias nre='rm -f package-lock.json && rm -rf node_modules && npm install'
alias ns='npm start'
alias yb='yarn build'
alias yp='yarn lint && yarn production'
alias yre='rm -f yarn.lock && rm -rf node_modules && yarn'
alias ys='yarn start'
