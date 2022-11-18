#!/usr/bin/env zsh

# everything needed for mutt
brew install isync
brew install msmtp
brew install mu
brew install neomutt
brew install ripmime
brew install w3m

# python dependencies (for mutt)
pip install urlscan

# create folders
mkdir ~/Mail
mkdir ~/Mail/mailbox
mkdir ~/Mail/mailbox/cur
mkdir ~/Mail/mailbox/new
mkdir ~/Mail/mailbox/tmp

# link config files
ln -s ~/dotfiles/office/mutt ~/.mutt
ln -s ~/dotfiles/office/mbsyncrc ~/.mbsyncrc
ln -s ~/dotfiles/office/msmtprc ~/.msmtprc

# now: create the correct keychain-entries in system keychain
# for the mailboxes (compare msmtp/mbsync-config, remember to
# prepend imap-ones with http:// and smtp-ones with smtp://), then:

mbsync -a
mu init -m ~/Mail
mu index
