ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
HIST_STAMPS="yyy-mm-dd"
plugins=(you-should-use $plugins)

source $ZSH/oh-my-zsh.sh

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

export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

export PATH=/usr/texbin:/usr/local/bin:$PATH
export GOPATH=$HOME/go


export CLICOLOR=1
export ws="$HOME/workspace/"

export WORKON_HOME=~/Envs

export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="/usr/local/rvm/bin:$PATH" # Add RVM to PATH for scripting
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export EDITOR='vim'


[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

export YSU_HARDCORE=0

preexec(){ [ $1 != $2 ] && print -r "$1        ->      $2" }

[[ -f /opt/dev/sh/chruby/chruby.sh ]] && type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; }

export GOPATH=$HOME/go
if [ -e /Users/denis/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/denis/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

[[ -x /usr/local/bin/brew ]] && eval $(/usr/local/bin/brew shellenv)
