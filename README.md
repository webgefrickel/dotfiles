# My dotfiles

This is a collection of my dotfiles.

## Installation

```
git clone git://github.com/webgefrickel/dotfiles ~/dotfiles
cd ~/dotfiles
./install/_install.sh
```

Now change the file `.gitconfig.user` in your home-folder and 
provide your git credentials, such as:

```
[user]
  name = Your name
  email = youremail@domain.de
[github]
  user = username
  token = 1235687641287364
```

Finally restart your terminal and vim again, and you are ready to go.

## Additional stuff

There are additional installation script for commonly used
CLI-tools and software (mainly macOS specific) and some color
schemes for different terminal emulators, see the folders 
install/, alfred/ and other/.

## Vim

I use neovim as a default, with some selected plugins. Those
plugins are managed with dein, see nvim/bundles.vim.
