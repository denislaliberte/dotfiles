## include bash command ##
 if [ -f ~/.bash_command ]; then
    source ~/.bash_command
 fi

## include bash alias ##
 if [ -f ~/.alias.sh ]; then
    source ~/.alias.sh
 fi


##bash option
export PS1='\W \!$ '
export GREP_OPTIONS="--color=auto"
force_color_prompt=yes
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

  #bash history
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
    # Combine multiline commands into one in history
shopt -s cmdhist
    # Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

#editing mode
set editing-mode vi
set -o vi

PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
