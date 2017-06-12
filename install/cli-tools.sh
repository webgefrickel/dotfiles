#!/usr/bin/env bash
brew tap homebrew/dupes
brew tap homebrew/php
brew tap homebrew/versions

# install additional brew packages -- see _install.sh too
brew install composer
brew install curl --with-ssl --with-libssh2
brew install ffmpeg --with-libvpx --with-libvorbis --with-fdk-aac
brew install git-flow
brew install git-ftp
brew install imagemagick
brew install mariadb
brew install mozjpeg
brew install nginx --with-http2
brew install openssl
brew install php70 --with-homebrew-curl --with-homebrew-openssl
brew install php70-intl
brew install php70-mcrypt
brew install rbenv
brew install rsync
brew install shpotify
brew install the_silver_searcher
brew install youtube-dl

# install a current ruby version
rbenv install 2.4.1

# use nvm instead of brew node or anything else
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.1/install.sh | bash
