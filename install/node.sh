#!/usr/bin/env zsh

nvm install 6.9.3
nvm use 6.9.3
nvm alias default 6.9.3
curl -L https://www.npmjs.com/install.sh | sh

npm update -g

npm install -g npm
npm install -g caniuse-cmd
npm install -g diff-so-fancy
npm install -g eslint
npm install -g fkill-cli
npm install -g gulp
npm install -g jsonlint
npm install -g lighthouse
npm install -g np
npm install -g npm-check-updates
npm install -g pure-prompt
npm install -g sass-lint
npm install -g trash-cli
npm install -g vtop
npm install -g yarn
