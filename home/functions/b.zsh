# sbn -> show Branch in Note
# sbn 5 -> show the first five Branch in Note
function sbn(){
  grep -n '\[ \].*branch:' $note  | grep -v LATER | grep ${1:-branch}
}

# cbn 1 -> Checkout to the Branch at line 1 of Note
alias cbn=checkout.branch.note
function checkout.branch.note() {
  branch=$(get.data.line $1 branch master)
  repo=$(get.data.line $1 repo shopify)
  echo $repo
  dev cd $repo
  echo $branch
  git checkout $branch
  dev open pr
}

# nbn 1 -> create a New Branch from the name at line 1 of the Note file
function nbn() {
  branch=$(get.data.line $1 branch)
  repo=$(get.data.line $1 repo shopify)
  echo $repo
  dev cd $repo
  echo $branch
  git fetch origin master
  git checkout origin/master
  git checkout -b $branch
  enp
  cat ~/.gitmessage | tee -a $n
  en
}

# rbn 1 -> Review Branch in index one of Note file
function rbn() {
  branch=$(get.data.line $1 branch master)
  echo $branch
  r $branch
  echo $branch
}

# bn -> return the current branch name
alias bn=git_branch_name
function git_branch_name() {
  git rev-parse --abbrev-ref HEAD
}

# dbn 2 -> Delete the Branch in the Note file at line 2
alias dbn=delete.branch.note
function delete.branch.note() {
  branch=$(get.data.line $1 branch)
  echo "Delete $branch"
  git branch -D $branch | tee -a $w/readme.md
  en $1
}
