# c* -> Commit

alias c='git.commit'
function git.commit(){
  git add -u :/
  git commit
}

# can -> git Commit Amend No edit
function can(){
  git add -u :/
  git commit --amend --no-edit
  git show HEAD | review_diff | tee -a $n
}

# cnc -> git Commit fast No Comment
function cnc(){
  git add -A :/
  git commit -m 'no comment '
  git show HEAD | review_diff | tee -a $n
}

# cam -> git Commit add All and Message
function cam() {
  git add -A :/
  git commit -m "$@"
  git log --format='%h  "%ar"  %f'  | head -1 | pyp "'  * [ ] LATER review commit: ' + p" | tee -a $n
  git show HEAD | review_diff | tee -a $n
}

# cf -> git Commit Fixup
function cf(){
  git commit -a --fixup $(cat .ignore/commits.txt | pyp "pp[${1:-0}]|w[0]")
  git show HEAD | review_diff | tee -a $n
}

# cfn -> git Commit Fixup last Note commit
function cfn(){
  git commit -a --fixup :/note
  git_log_short origin/master..HEAD
  git show HEAD | review_diff | tee -a $n
}

# glm -> Git Log Master
function glm(){
  git_log_short ${1:-origin/master}..${2:-HEAD}
  git_log_short ${1:-origin/master}..${2:-HEAD} | pyp 'pp[:-1]|p' > .ignore/commits.txt
  cat .ignore/commits.txt | pyp 'pp'
  echo '$ gsc i' 
}
