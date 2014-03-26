#!/usr/bin/env zsh

brew uninstall node
brew update
brew install node --without-npm
brew unlink node
brew link node
curl https://npmjs.org/install.sh | sh

# set npm to use npm_lazy
npm install -g npm_lazy
npm config set registry http://localhost:8080/

npm install -g bower
npm install -g browserify
npm install -g dploy
npm install -g fuck-you
npm install -g generator-generator
npm install -g grunt-cli
npm install -g jake
npm install -g js-beautify
npm install -g jshint
npm install -g jsonlint
npm install -g npm-check-updates
npm install -g recursive-blame
npm install -g stylestats
npm install -g uglify-js
npm install -g yo
