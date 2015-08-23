alias l="ls -1A"
alias la="ls -a"
alias lg="lsgrep" #ls grep $*
alias ll="ls -l"
alias lS="clear;pwd;ls *"
function lt(){ls $1 | pyp 'd[1]' | sort | uniq -c | sort -r && ls -d1 $1/*/ |wc -l}
function lsd(){ ls -d */ }
