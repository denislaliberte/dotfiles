# sbn -> show Branch in Note
function sbn(){
  grep -n 'branch:' $note
}

# cbn 1 -> Checkout to the Branch at line 1 of Note
function cbn() {
  branch=$(sed "$1!d" ${2:-$note} | pyp 'w[-1]')
  git checkout $branch
}

# bn -> return the current branch name
alias bn=git_branch_name
function git_branch_name() {
  git rev-parse --abbrev-ref HEAD
}
