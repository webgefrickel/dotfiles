#!/usr/bin/env zsh

nvm install 6.11.0
nvm install 8.1.1
nvm use 6.11.0
nvm alias default 6.11.0

npm install -g npm@latest
npm update -g

npm install -g diff-so-fancy
npm install -g eslint
npm install -g eslint-config-xo-space
npm install -g fkill-cli
npm install -g gulp
npm install -g jsonlint
npm install -g npm-check-updates
npm install -g pure-prompt
npm install -g sass-lint
npm install -g trash-cli
npm install -g vtop
npm install -g xo
