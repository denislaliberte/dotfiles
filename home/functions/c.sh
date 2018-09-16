# can -> git Commit Ammend No edit
function can(){
  git add -u :/
  git commit --amend --no-edit
}

# cnc -> git Commit fast No Comment
function cnc(){
  git add -A :/
  git commit -m 'no comment '
}

# cam -> git Commit add All and Message
function cam() {
  git add -A :/
  git commit -m "$@"
}

# cfr -> git Commit Fixup Rebase the last two commits
function cfr(){
  git commit -a --fixup HEAD
  git_rebase_i_head ${1:-2}
}

# cf -> git Commit Fixup
function cf(){
  git commit -a --fixup HEAD
}

# cfn -> git Commit Fixup last Note commit
function cfn(){
  git commit -a --fixup :/note
  git_log_short origin/master..HEAD
}

# glm -> Git Log Master
function glm(){
  git_log_short ${1:-origin/master}..${2:-HEAD}
  git_log_short ${1:-origin/master}..${2:-HEAD} | pyp 'pp[:-1]|p' > .ignore/commits.txt
  cat .ignore/commits.txt | pyp 'pp'
  echo '$ gsc i' 
}
