# rebase or remote

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
