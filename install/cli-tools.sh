#!/usr/bin/env bash

# install additional brew packages -- see _install.sh too
brew install composer
brew install curl
brew install dnsmasq
brew install ffmpeg
brew install git-flow
brew install git-ftp
brew install httpd
brew install imagemagick
brew install mariadb
brew install mkcert
brew install nss
brew install openssl
brew install php@7.3
brew install ripgrep
brew install youtube-dl
read -p "Press any key to continue... " -n1 -s

# dnsmasq
echo 'address=/.localhost/127.0.0.1' > /usr/local/etc/dnsmasq.conf
sudo brew services start dnsmasq
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/localhost'
read -p "Press any key to continue... " -n1 -s

# php
sudo pecl install imagick
read -p "Press any key to continue... " -n1 -s
