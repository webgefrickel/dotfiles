#!/usr/bin/env zsh

brew reinstall dnsmasq
brew reinstall httpd
brew reinstall imagemagick
brew reinstall mariadb
brew reinstall mkcert
brew reinstall nss
brew reinstall php@7.4

# dnsmasq
echo 'address=/.localhost/127.0.0.1' > /usr/local/etc/dnsmasq.conf
sudo brew services start dnsmasq
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/localhost'

# php and ssl
brew link php@7.4
pecl install imagick
mkcert -install
mkcert localhost "dev.localhost" "*.dev.localhost"

# now move those pem-files to their correct location
