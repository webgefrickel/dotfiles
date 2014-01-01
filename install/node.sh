#!/usr/bin/env zsh

brew update
brew upgrade node
brew link --overwrite node
npm install -g grunt-cli
npm install -g npm-check-updates
npm install -g jshint
npm install -g uglify-js
npm install -g jake
npm install -g js-beautify
npm install -g jsonlint
npm install -g recursive-blame
npm install -g bower
npm install -g yo
npm install -g generator-generator
