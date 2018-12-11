# rebase or remote or review

# ro -> git Rebase Origin master
# ro test -> git Rebase Origin Test
function ro(){
  branch=${1:-master}
  git fetch origin $branch
  git rebase origin/$branch
}

# rn -> git Remote Name
function rn () {
  git remote -v | pyp "d[1].split(':')[1]|pp[0]"
}

# r features/awesome-features # Review features
function r(){
  breathe
  git fetch origin $1
  git fetch origin master
  dev tophat $1
  enp
  echo $n
  ~/scripts/review.rb $1 | tee -a $n
  git_log_short origin/master..HEAD | pyp '"- [ ] " +p'| tee -a $n
  rb | tee -a $n
}

function review_diff(){ pyp '"   >>>     "+ p|p.replace("     +++ b/", " - [ ] ").replace("      def ", "* [ ] def ").replace("    test", " * [ ] test")' }

# rc 1 -> Review Commit at index 1
function rc() {
  git show $(cat .ignore/commits.txt | pyp "pp[${1:-0}]|w[0]") | review_diff
}

# rv -> review branch
function rb() {
  {
    git diff origin/master...HEAD | review_diff | grep --color=never '\[ \]'
    git diff origin/master...HEAD | review_diff
  }
}

