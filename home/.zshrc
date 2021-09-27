ZSH=~/.oh-my-zsh
#ZSH_THEME="robbyrussell"
ZSH_THEME="dracula"
HIST_STAMPS="yyy-mm-dd"
source $ZSH/oh-my-zsh.sh

# User configuration

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

if [ -f ~/.profile ]; then
   source ~/.profile
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
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR='vim'

fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_ALIAS=fuck;
    export TF_HISTORY="$(fc -ln -10)";
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}


[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }
