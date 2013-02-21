# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="webgefrickel"

# default plugins to load
plugins=(brew cap extract git github history-substring-search jake-node laravel npm node gem osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# paths
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/.rvm/bin:$PATH
export MANPATH=/usr/local/share/man:$MANPATH

# disable stupid ._ and dsstore files
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true
export COPYFILE_DISABLE=true

# editor
export EDITOR=vim
export VISUAL=vim

# node.js
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH

# disable auto titling fixes tmux window
export DISABLE_AUTO_TITLE=true

# z script installed via homebrew
. `brew --prefix`/etc/profile.d/z.sh

### aliases ##
# aliases for apache and mysql
alias apachestart='_ /usr/sbin/apachectl start'
alias apachestop='_ /usr/sbin/apachectl stop'
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
alias dev='apachestart && mysqlstart'
alias devs='apachestop && mysqlstop'
alias devr='devs && dev'

# dnsflush-shortcut
alias dnsflush='_ dscacheutil -flushcache'

# all in one homebrew, gem and vim bundles update commands
alias dotup='cd ~/Dotfiles/ && git pull && cd -'
alias dotsubup='cd ~/Dotfiles/ && git submodule foreach git pull && cd -'
alias brewup='brew update && brew upgrade && brew cleanup && brew linkapps'
alias gemup='gem update --system && gem update && gem cleanup'
alias npmup='npm -g cache clean && npm -g update'
alias rvmup='rvm get latest'
alias upall='brewup && rvmup && gemup && npmup && dotup && dotsubup'

# always use mvim but for 'vim'
alias v='vim'
alias vd='vimdiff'
alias diff='vimdiff'

# easy hosts-editing
alias hosts='_ vim /etc/hosts'
alias vhosts='_ vim /etc/apache2/extra/httpd-vhosts.conf'

# Easier navigation: .., ..., ~ and -
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Shortcuts
alias drop='cd ~/Dropbox && l'
alias web='cd ~/Sites && l'
alias rep='cd ~/Repositories && l'
alias dot='cd ~/Dotfiles && l'
alias brain='cd ~/Dropbox/Brain && vim .'
alias jake='noglob jake'

# Gitty gitgit
alias gitrm='git rm $(git ls-files --deleted)'
# THIS is evil. only use for private stuff and useless stuff
alias ggg='git add . && git commit -a -m "-"'
# git search helper
gf() { git hist | grep "$*"; }

# dandelion deployment shortcuts
alias deploy='dandelion deploy'
alias status='dandelion status'

# grunt
alias grw='grunt watch'
alias grd='grunt deploy'

# other tools
alias t='tmux -u'
alias ta='tmux attach'
alias pdf2jpg='gs -dNOPAUSE -sDEVICE=jpeg -r144 -sOutputFile=p%03d.jpg file.pdf'


# rvm ftw!
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
