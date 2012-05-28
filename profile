export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:$PATH
export MANPATH=/usr/local/share/man:$MANPATH

# disable stupid ._ and dsstore files
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

# colors ftw!
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# editor
export EDITOR=mvim
VISUAL=$EDITOR; export VISUAL

# node.js
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH

# aliases for starting apache and mysql
alias apachestart='sudo /usr/sbin/apachectl start'
alias apachestop='sudo /usr/sbin/apachectl stop'
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
alias devstart='apachestart && mysqlstart'
alias devstop='apachestop && mysqlstop'

# dnsflush-shortcut
alias dnsflush='sudo dscacheutil -flushcache'

# all in one homebrew, gem and vim bundles update commands
alias brewup='brew update && brew upgrade && brew cleanup && brew linkapps'
alias vimup='cd ~/.vim/ && git submodule foreach git pull && cd -'
alias gemup='gem update --system && gem update'
alias upall='brewup && gemup && vimup'

# easy hosts-editing
alias hosts='sudo mvim /etc/hosts'
alias vhosts='sudo mvim /etc/apache2/extra/httpd-vhosts.conf'

# Always list everything
alias ls='ls -all'   
alias lsd='ls -l | grep "^d"'

# always use mvim
alias vim='mvim'
alias v='mvim'
alias vd='mvimdiff'
alias diff='mvimdiff'

alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

# Easier navigation: .., ..., ~ and -
alias ..='cd ..'
alias ...='cd ../..'

# Shortcuts
alias dr='cd ~/Dropbox && ls'
alias w='cd ~/Sites && ls'
alias r='cd ~/Repositories && ls'
alias d='cd ~/Dotfiles && ls'

# Gitty gitgit
alias gti='git'
alias g='git'
alias grm='git rm $(git ls-files --deleted)'
alias deploy='dandelion deploy'
alias status='dandelion status'

# use ffmpeg to create nice web-videos and a jpg-still
ffencode () { 
  ffmpeg -i $1 -vcodec libx264 -vprofile high -preset slow -vb 1000k -maxrate 1000k -bufsize 2000k -vf scale="854:trunc(ow/a/2)*2" -threads 0 -ab 128k video-low.mp4;
  ffmpeg -i $1 -vcodec libx264 -vprofile high -preset slower -vb 1800k -vf scale="1280:trunc(ow/a/2)*2" -threads 0 -ab 224k video-high.mp4
  ffmpeg -i $1 -vcodec libvpx -quality good -cpu-used 0 -vb 1000k -maxrate 1000k -bufsize 2000k -qmin 10 -qmax 42 -vf scale="854:trunc(ow/a/2)*2" -threads 0 -acodec libvorbis -ab 128k video-low.webm;
  ffmpeg -i $1 -vcodec libvpx -quality good -cpu-used 0 -vb 1800k -maxrate 1800k -bufsize 3600k -qmin 10 -qmax 42 -vf scale="1280:trunc(ow/a/2)*2" -threads 0 -acodec libvorbis -ab 224k video-high.webm;
  ffmpeg -i $1 -ss 00:00:05.01 -y -f image2 -vcodec mjpeg -vframes 1 -s hd720 video-high.jpg
  ffmpeg -i $1 -ss 00:00:05.01 -y -f image2 -vcodec mjpeg -vframes 1 -s hd480 video-low.jpg
  mp4box -inter 500 -hint video-high.mp4
  mp4box -inter 500 -hint video-low.mp4
}

# rvm ftw!
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

