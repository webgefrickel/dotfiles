#!/usr/bin/env bash
brew tap homebrew-ffmpeg/ffmpeg

# install additional brew packages -- see _install.sh too
brew install curl
brew install dnsmasq
brew install git-flow
brew install golang
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac
brew install htop
brew install httpd
brew install imagemagick
brew install mariadb
brew install mkcert
brew install nss
brew install openssl
brew install php@7.3
brew install ripgrep
brew install switchaudio-osx

# dnsmasq
echo 'address=/.localhost/127.0.0.1' > /usr/local/etc/dnsmasq.conf
sudo brew services start dnsmasq
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/localhost'

# php and ssl
sudo pecl install imagick
mkcert -install
mkcert localhost "dev.localhost" "*.dev.localhost"
