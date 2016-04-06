#!/usr/bin/env zsh

brew uninstall node
brew update
brew install node
brew unlink node
brew link node

npm install -g caniuse-cmd
npm install -g dploy
npm install -g eslint
npm install -g fkill-cli
npm install -g gulp
npm install -g grunt-cli
npm install -g jsonlint
npm install -g npm-check-updates
npm install -g pure-prompt
npm install -g recursive-blame
npm install -g trash
npm install -g vtop
