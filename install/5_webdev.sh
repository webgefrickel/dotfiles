#!/usr/bin/env zsh

brew install composer
brew install dnsmasq
brew install httpd
brew install imagemagick
brew install mariadb
brew install mkcert
brew install nss
brew install php

# link etc-configs
sudo rm -rf /opt/homebrew/etc/php
sudo rm -rf /opt/homebrew/etc/httpd
sudo rm /opt/homebrew/etc/my.cnf
sudo rm /opt/homebrew/etc/dnsmasq.conf
ln -s ~/dotfiles/etc/httpd /opt/homebrew/etc/httpd
ln -s ~/dotfiles/etc/php /opt/homebrew/etc/php
ln -s ~/dotfiles/etc/my.cnf /opt/homebrew/etc/my.cnf
ln -s ~/dotfiles/etc/dnsmasq.conf /opt/homebrew/etc/dnsmasq.conf

sudo rm /etc/hosts
sudo ln -s ~/dotfiles/etc/resolver /etc/resolver
sudo ln -f ~/dotfiles/etc/hosts /etc/hosts

# additional webdev cli tools
npm install -g npm-check
npm install -g yarn

# certificates for local ssl
mkcert -install
mkcert localhost "dev.localhost" "*.dev.localhost"
# now move those pem-files to ~/Sites/__dev

# start services
sudo brew services start dnsmasq
brew services start httpd
brew services start mariadb
brew services start php

# mariadb
sudo mysql -uroot
# then in mysql-prompt: set password = password("root");
