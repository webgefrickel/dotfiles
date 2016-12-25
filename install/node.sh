#!/usr/bin/env zsh

# use nvm instead of brew node or anything else
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
nvm install 6.9.2
nvm use 6.9.2
nvm alias default 6.9.2
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
