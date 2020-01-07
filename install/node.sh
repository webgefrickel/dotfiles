#!/usr/bin/env zsh
curl -L https://git.io/n-install | bash

npm install -g npm@latest
npm update -g

npm install -g diff-so-fancy
npm install -g eslint

# Do we need this config globally?!
npm install -g eslint-config-xo-space
npm install -g fkill-cli
npm install -g htmlhint
npm install -g jsonlint
npm install -g neovim
npm install -g npm-check-updates
npm install -g prettier
npm install -g pure-prompt

# REPLACE with stylelint
npm install -g sass-lint
npm install -g trash-cli
npm install -g yarn
