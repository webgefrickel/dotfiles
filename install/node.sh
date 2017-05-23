#!/usr/bin/env zsh

nvm install 6.10.3
nvm install 7.10.0
nvm use 6.10.3
nvm alias default 6.10.3
curl -L https://www.npmjs.com/install.sh | sh

npm install -g npm
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
npm install -g webpack
npm install -g xo
npm install -g yarn
