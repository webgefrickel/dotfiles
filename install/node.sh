#!/usr/bin/env zsh

brew uninstall node
brew update
brew install node --without-npm
brew unlink node
brew link node
curl -L https://npmjs.org/install.sh | sh

npm install -g browserify
npm install -g dploy
npm install -g eslint
npm install -g frontend-md
npm install -g grunt-cli
npm install -g gulp
npm install -g jsonlint
npm install -g npm-check-updates
npm install -g recursive-blame
