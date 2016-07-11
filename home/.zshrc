ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="yyy-mm-dd"
plugins=(atom brew brew-cask composer copydir gitfast laravel osx history)
source $ZSH/oh-my-zsh.sh

# User configuration

#shell alias
 if [ -d ~/alias ]; then
   for f in ~/alias/*
   do
         source $f
  done
 fi

 if [ -d ~/functions ]; then
   for f in ~/functions/*
     do source $f
  done
 fi

 if [ -f ~/hc/shortcut.sh ]; then
    source ~/hc/shortcut.sh
 fi

 if [ -f ~/hc/profile ]; then
    source ~/hc/profile
 fi

 if [ -f ~/.profile ]; then
    source ~/.profile
 fi

 if [ -f ~/.note.sh ]; then
    source ~/.note.sh
 fi

export PATH="/usr/local/rvm/bin:$PATH" # Add RVM to PATH for scripting

[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.composer/vendor/bin:$PATH"


bindkey -v

export PATH=/usr/texbin:/usr/local/bin:$PATH

# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
source $HOME/ansible-desktop/.env

export CLICOLOR=1
export ws="$HOME/_workspace"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
export WORKON_ROME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source $HOME/note.sh
source /home/dlaliberte/.homesick/repos/homeshick/homeshick.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
