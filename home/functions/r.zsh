# rebase or remote or review

# ro -> git Rebase Origin master
# ro test -> git Rebase Origin Test
function ro(){
  current_branch=$( git rev-parse --abbrev-ref HEAD)
  echo "git push origin $current_branch --force # be careful with the --force"
  branch=${1:-master}
  git fetch origin $branch
  git rebase origin/$branch
}

# rn -> git Remote Name
function rn () {
  remote=$(git remote -v)
  if [ "X$remote" = "X" ]; then
    echo "local"
  else
    echo $remote | pyp "d[1].split(':')[1]|pp[0]"
  fi
}

# r features/awesome-features # Review features
function r(){
  git fetch origin $1
  git fetch origin master
  git checkout $1
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

# rb -> review branch
function rb() {
  {
    git diff origin/master...HEAD | review_diff | grep --color=never '\[ \]'
    git diff origin/master...HEAD | review_diff
  }
}

