#!/usr/bin/env bash

# everything needed for mutt
brew install gpgme
brew install isync
brew install khal
brew install khard
brew install msmtp
brew install mu
brew install neomutt/homebrew-neomutt/neomutt --with-gpgme
brew install ripmime
brew install w3m
brew install vdirsyncer
read -p "Press any key to continue... " -n1 -s

# python dependencies (for mutt)
sudo pip3 install -I urlscan
read -p "Press any key to continue... " -n1 -s

mkdir ~/Calendars
mkdir ~/Contacts
mkdir ~/Mail
mkdir ~/Mail/mailbox
mkdir ~/Mail/viu
mkdir ~/Mail/mf
mkdir ~/Mail/kfi
mkdir ~/Mail/hsv
read -p "Press any key to continue... " -n1 -s

ln -s ~/dotfiles/office/mutt ~/.mutt
ln -s ~/dotfiles/office/mbsyncrc ~/.mbsyncrc
ln -s ~/dotfiles/office/msmtprc ~/.msmtprc
ln -s ~/dotfiles/office/khal ~/.config/khal
ln -s ~/dotfiles/office/khard ~/.config/khard
ln -s ~/dotfiles/office/vdirsyncer ~/.vdirsyncer
read -p "Press any key to continue... " -n1 -s
