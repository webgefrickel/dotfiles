# My dotfiles

This is a collection of my dotfiles. To install on your local machine run the following commands:

```
git clone git://github.com/nebelschwade/Dotfiles ~/Dotfiles
cd ~/Dotfiles
ln -s ~/Dotfiles/vim ~/.vim
ln -s ~/Dotfiles/gitconfig ~/.gitconfig
ln -s ~/Dotfiles/gitignore ~/.gitignore
ln -s ~/Dotfiles/inputrc ~/.inputrc
ln -s ~/Dotfiles/jshintrc ~/.jshintrc
ln -s ~/Dotfiles/pearrc ~/.pearrc
ln -s ~/Dotfiles/profile ~/.profile
ln -s ~/Dotfiles/pearrc ~/.pearrc
ln -s ~/Dotfiles/vimrc ~/.vimrc
git submodule init
git submodule update
git submodule foreach git checkout master
git submodule foreach git pull
```

Then create a file `.gitconfig.user` in your home-folder and provide your git credentials, such as:

```
[user]
  name = Your name
  email = youremail@domain.de
[github]
  user = username
  token = 1235687641287364
```

Restart your terminal and vim, and you are ready to go.

## VIM

### Bundled Plugins

- Pathogen (sits in autoload/ - the only one _not_ in bundle/)
- ack
- browser-refresh
- buffergator
- ctrlp
- easymotion
- fugitive
- gist
- indent-guides
- indent-object
- matchit
- nrrwrgn
- nerdtree
- pasta
- ragtag
- repeat
- snipmate
- sparkup
- supertab
- surround
- syntastic
- tabular
- tagbar
- tcomment
- unimpaired
- yankring
- zoomwin

### Bundled Color Schemes

- jellybeans (one to rule them all)

### Better syntax and indenting for

- javascript
- css3 and scss
- html5
- php
- git
- markdown

### Custom Stuff (see my github profile)

- [typoscript syntax for Vim](https://github.com/nebelschwade/typoscript-vim)
- [a better statusline](https://github.com/nebelschwade/statusline-vim)
- [custom snipmate snippets](https://github.com/nebelschwade/snipmate-snippets)

- remapping ; to :
- \<leader\> is set to comma (,)
- \<tab\> and \<shift-tab\> for switching between buffers
- no arrow-keys, except for indenting, moving blocks of code with \<shift\>
- ,u and ,l (and uppercase) for uppercasing/lowercasing words
- ,w for switching to words
- ,v for a new vertical split
- ,= for resizing splits equally
- ,a for Ack-Search
- ,/ for un/commenting
- ,z for zoomin
- ,r for browser-refreshing- 
- ,n for nerdtree toggling
- ,m for easymotion (,mw or ,mf are my favorites here)
- ,y for the yankring
- ,b for toggling buffergator
- ,t for CtrlP 
- ,d for changing the working dir to the dir of the current file
- \<F8\> for toggling the tagbar
- \<shift-tab\> in css indents single line to column 31
- autotrailing of whitespace for php, html, css, js, ts, xml, json, inc and vim files

## Bash and aliases

Well, have a look at .profile.
