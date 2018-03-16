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

 if [ -f ~/.sobriquet.sh ]; then
    source ~/.sobriquet.sh
 fi


[[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*



bindkey -v


# pip should only run if there is a virtualenv currently activated
#export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export PATH=/usr/texbin:/usr/local/bin:$PATH
export GOPATH=$HOME/go


if [ -f $HOME/ansible-desktop/.env ]; then
  source $HOME/ansible-desktop/.env
fi


export CLICOLOR=1
export ws="$HOME/workspace/"

export WORKON_HOME=~/Envs
#source /usr/local/bin/virtualenvwrapper.sh

export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="/usr/local/rvm/bin:$PATH" # Add RVM to PATH for scripting
export EDITOR='vim'
eval "$(rbenv init -)"
