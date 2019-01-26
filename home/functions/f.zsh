# help -> show all Help function
function help() { grep -hri '^#.*help' $HOME/{alias,functions}/ | grep '[A-Z]\|->' }
function function_help(){ grep '^\#' ~/functions/$1.sh | grep -i ${2:-.} | grep '[A-Z]\|->' }


# fh -> Function : grep the Help string for functions
# fh test -> Function : grep the Help string for functions that match the regex /test/
function fh(){ grep -hi '^\#' ~/functions/* | grep -i ${1:-.} | grep '[A-Z]\|->' }

function fg(){
  grep $* ~/functions/*
}


# fgp git.commit  ->  return all git commit functions
alias fgp=functions_grep
function functions_grep(){ grep  -ni "$*" ~/functions/* }

alias vf="deprecated ef"
# ef git -> Edit Function file for git
function ef(){
  vim -O ~/functions/$1.zsh
  source ~/functions/$1.zsh
}

function deprecated(){ echo "DEPRECATED : use $*"}
