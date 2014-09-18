# My dotfiles

This is a collection of my dotfiles.

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

## VIM

I use a lot of plugins and custom syntaxes. They are all
installed via neobundle - for a list of the plugins see vimrc.
