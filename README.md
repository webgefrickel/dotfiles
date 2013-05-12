# My dotfiles

This is a collection of my dotfiles. Requirements are:
installed and working homebrew with installed node, npm
and the node jake-plugin. And zsh :-)

```
git clone git://github.com/webgefrickel/dotfiles ~/dotfiles
cd ~/dotfiles
jake
```

If you haven't configured ZSH to be your default shell yet: 
restart your terminal and type

```
cd ~/dotfiles
jake zsh
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

## oh-my-zsh

I use a custom fork of the famous oh-my-zsh framework.
Have a look at the zshrc-file for custom aliases and functions.

## VIM

I use a lot of plugins and custom syntaxes. They are all
installed via vundle - for a list of the plugins see vimrc.

To get things to work properly you first have to install
vundle - see the instructions here: [vundle](https://github.com/gmarik/vundle)
