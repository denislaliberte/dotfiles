alias sd=git_stash_drop
function git_stash_drop() { git stash drop $1 }
alias gsp="git stash pop"
alias gst="git stash save -u $*"
alias gsl="git stash list | cat"
