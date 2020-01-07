# My dotfiles

This is a collection of my dotfiles.

## Installation

```
git clone git://github.com/webgefrickel/dotfiles ~/dotfiles
cd ~/dotfiles
./install/install.sh
```

Now change the file `.gitconfig.user` in your home-folder and provide your git credentials, such as:

```
[user]
  name = Your name
  email = youremail@domain.de
[github]
  user = username
  token = 1235687641287364
```

## Additional stuff

There are additional installation script for commonly used CLI-tools and software (mainly macOS specific) and config for mutt/neovim, see the folders install/, alfred/ and other/.

