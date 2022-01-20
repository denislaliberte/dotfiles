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
  git show HEAD | review_diff | tee -a $note
}

# cnc -> git Commit fast No Comment
function cnc(){
  git add -A :/
  git commit -m 'no comment '
  git show HEAD | review_diff | tee -a $note
}

# cam -> git Commit add All and Message
alias cam=commit.all.message
function commit.all.message() {
  git add -A :/
  git commit --allow-empty -m "$@"
  git log --format='%h  "%ar"  %f'  | head -1 | pyp "'  * [ ] LATER review commit: ' + p" | tee -a $note
  git show HEAD | review_diff >  .ignore/commit.txt
  vim -o .ignore/commit.txt +"vsp $note"
  git.log.master
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
  git show HEAD | review_diff | tee -a $note
}

# glm -> Git Log Master
alias glm=git.log.main
function git.log.main(){
  git_log_short ${1:-origin/main}..${2:-HEAD} > .ignore/commits.txt
  cat .ignore/commits.txt | pyp 'pp'
  echo '$ gsc i' 
}
