# sbn -> show Branch in Note
# sbn 5 -> show the first five Branch in Note
function sbn(){
  grep -n '\[ \].*branch:' $note | head -${1:-3} | grep -v LATER
}

# cbn 1 -> Checkout to the Branch at line 1 of Note
function cbn() {
  branch=$(get.data.line $1 branch $note)
  repo=$(get.data.line $1 repo $note)
  if [ $repo != null ]
  then
    echo $repo
    dev cd $repo
  else
    dev cd shopify
  fi
  echo $branch
  git fetch origin $branch
  git checkout $branch
}

# nbn 1 -> create a New Branch from the name at line 1 of the Note file
function nbn() {
  branch=$(get.data.line $1 branch)
  echo $branch
  git fetch origin master
  git checkout origin/master
  git checkout -b $branch
  git push origin $branch
  enp
  cat ~/.gitmessage | tee -a $n
  en
}

# rbn 1 -> Review Branch in index one of Note file
function rbn() {
  branch=$(sed "$1!d" ${2:-$note} | pyp 'w[-1]')
  echo $branch
  r $branch
  echo $branch
}

# bn -> return the current branch name
alias bn=git_branch_name
function git_branch_name() {
  git rev-parse --abbrev-ref HEAD
}

