#!/usr/bin/env bash
brew tap homebrew-ffmpeg/ffmpeg

# install additional brew packages -- see _install.sh too
brew install clipper
brew install curl
brew install dnsmasq
brew install fzf
brew install homebrew-ffmpeg/ffmpeg/ffmpeg --with-fdk-aac
brew install htop
brew install httpd
brew install imagemagick
brew install jump
brew install mariadb
brew install mkcert
brew install neovim
brew install nnn
brew install nss
brew install openssl
brew install php@7.4
brew install ripgrep
brew install switchaudio-osx
brew install tmux
brew install trash-cli
brew install tree

# install fzf
/usr/local/opt/fzf/install

# clipper
mkdir -p ~/Library/LaunchAgents
brew services start clipper

# vim stuff
gem install neovim
easy_install --user pip
python -m pip install --user neovim
pip3 install neovim

curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sh -c 'curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# dnsmasq
echo 'address=/.localhost/127.0.0.1' > /usr/local/etc/dnsmasq.conf
sudo brew services start dnsmasq
sudo mkdir -v /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/localhost'

# php and ssl
pecl install imagick
mkcert -install
mkcert localhost "dev.localhost" "*.dev.localhost"
