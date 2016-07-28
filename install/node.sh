#!/usr/bin/env zsh

# use nvm instead of brew node or anything else
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash
nvm install v4.4.6
nvm use default
curl -L https://www.npmjs.com/install.sh | sh

npm update -g

npm install -g caniuse-cmd
npm install -g diff-so-fancy
npm install -g dploy
npm install -g eslint
npm install -g fkill-cli
npm install -g gulp
npm install -g grunt-cli
npm install -g jsonlint
npm install -g npm-check-updates
npm install -g pure-prompt
npm install -g recursive-blame
npm install -g trash-cli
npm install -g vtop
