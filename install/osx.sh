#!/usr/bin/env zsh
#
# Thanks a lot to http://mths.be/osx
#
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "frcklbook"
sudo scutil --set HostName "frcklbook"
sudo scutil --set LocalHostName "frcklbook"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "frcklbook"

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# UTF-8 all the things
# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
