#!/usr/bin/env zsh

brew reinstall dnsmasq
brew reinstall httpd
brew reinstall imagemagick
brew reinstall mariadb
brew reinstall mkcert
brew reinstall nss
brew reinstall php@7.4

# link etc-configs
sudo rm -rf /usr/local/etc/php
sudo rm -rf /usr/local/etc/httpd
sudo rm /usr/local/etc/my.cnf
sudo rm /usr/local/etc/dnsmasq.conf
ln -s ~/dotfiles/etc/httpd /usr/local/etc/httpd
ln -s ~/dotfiles/etc/php /usr/local/etc/php
ln -s ~/dotfiles/etc/my.cnf /usr/local/etc/my.cnf
ln -s ~/dotfiles/etc/dnsmasq.conf /usr/local/etc/dnsmasq.conf

sudo rm /etc/hosts
sudo ln -s ~/dotfiles/etc/resolver /etc/resolver
sudo ln -f ~/dotfiles/etc/hosts /etc/hosts

# php and ssl
brew link php@7.4
pecl install imagick

# additional webdev cli tools
npm install -g npm-check
npm install -g yarn
npm install -g glyphhanger

# additional stuff for glyphhanger
pip install fonttools
pip install brotli
pip install zopfli

# certificates for local ssl
mkcert -install
mkcert localhost "dev.localhost" "*.dev.localhost"
# now move those pem-files to ~/Sites/__dev

# start services
sudo brew services start dnsmasq
brew services start httpd
brew services start mariadb
brew services start php@7.4

# mariadb
sudo mysql -uroot
# then in mysql-prompt: set password = password("root");
