alias la="ls -a"
alias lg="lsgrep" #ls grep $*
alias ll="ls -l"
alias lS="clear;pwd;ls *"
function lsd(){ ls -d */ }
function lsgrep(){ ls $2 | grep -i "$1" }
