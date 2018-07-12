# rebase

# ro -> git Rebase Origin master
# ro test -> git Rebase Origin Test
function ro(){
  branch=${1:-master}
  git fetch origin $branch
  git rebase origin/$branch
}
