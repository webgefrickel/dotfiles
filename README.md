# My dotfiles

This is a collection of my dotfiles. To install on your local machine do:

```
git clone git://github.com/nebelschwade/dotfiles ~/Dotfiles
cd ~/Dotfiles
rake install
```

Thanks a lot to Ryan Bates for his install-script [here](https://github.com/ryanb/dotfiles).
The Vim-config is highly influenced by [janus](https://github.com/carlhuda/janus).

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
