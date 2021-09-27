# saved branch

# sbh vim -> show help line that match the regex /vim/
alias sbh=saved_branch_help
function saved_branch_help(){
  grep '^\#' ~/functions/sb.zsh | grep ${1:-.} | grep '\->'
}

# sb 1 -> select saved branch at index 1
alias sb='select_branch'
function select_branch() {
  select_branch_index ${1:-:}
}

function select_branch_index() {
  cat ".ignore/branch.txt" | pyp "pp[$1]"
}

# sbnm -> Save all Branch Not Merged in origin master
# sbnm feature/test -> Save all Branch Not Merged in feature/test
alias sbnm=git_branch_no_merged
function git_branch_no_merged(){
  git branch --no-merged ${1:-origin/master} > .ignore/branch.txt ; select_branch
}

# sbc 2 -> checkout branch 2
alias sbc=select_branch_checkout
function select_branch_checkout() {
  git checkout  $(select_branch_index ${1:-0} | head -1)
}

# sbd 1 -> delete branch 1
alias sbd=select_branch_delete
function select_branch_delete() {
  git branch -D  $(select_branch_index ${1:-0} | head -1) | tee -a $w/readme.md
}


# sbg test -> return all saved branch that match /test/
alias sbg='select_branch_grep'
function select_branch_grep() {
  select_branch_index :  $2 | grep -i $1
}

# sbr 1 -> git rebase on saved branch at index 1
alias sbr=select_branch_rebase
function select_branch_rebase() {
  git rebase -i  $(select_branch_index ${1:-0})
}

# sbm test -> Show Branch that Match /test/ regex
function sbm(){
  git branch | grep -i ${1:-.} > .ignore/branch.txt
  select_branch
}
