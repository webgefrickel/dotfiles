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

I use the famous oh-my-zsh framework with a custom theme.
Have a look at the zshrc-file for custom aliases and functions.

## VIM

### Bundled Plugins

- Pathogen (sits in autoload/ - the only one _not_ in bundle/)
- ack
- buffergator
- ctrlp
- easymotion
- editorconfig
- fugitive
- gist (more config needed, see github page)
- indent-object
- matchit
- nerdtree
- nrrwrgn
- powerline
- ragtag
- repeat
- snipmate
- sparkup
- supertab
- surround
- syntastic
- tabular
- tcomment
- unimpaired
- zoomwin

### Bundled Color Schemes

- jellybeans (one to rule them all)

### Better syntax and indenting for

- css3
- git
- html5
- javascript
- markdown
- php
- scss
- typoscript

### Custom Stuff (see my github profile)

- [typoscript syntax for Vim](https://github.com/webgefrickel/typoscript-vim)
- [custom snipmate snippets](https://github.com/webgefrickel/snipmate-snippets)

- remapping ; to :
- \<leader\> is set to comma (,)
- \<tab\> and \<shift-tab\> for switching between buffers
- no arrow-keys, except for indenting and moving codes of blocks around
- ,u and ,l (and uppercase) for uppercasing/lowercasing words
- ,w for switching to words
- ,\ for a new vertical split
- ,= for resizing splits equally
- ,a for Ack-Search
- ,f for search and replace
- ,/ for un/commenting
- ,z for zoomin
- ,n for nerdtree toggling
- ,m for easymotion (,mw or ,mf are my favorites here)
- ,b for toggling buffergator
- ,t for CtrlP 
- ,d for changing the working dir to the dir of the current file
- ,e for editing file in the same path
- autotrailing of whitespace for php, html, css, js, ts, xml, json, inc and vim files

Hav a look at the vimrc-file and have fun!
