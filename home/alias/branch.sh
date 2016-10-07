alias gb=git_branch_no_merged
function git_branch_no_merged(){ git branch --no-merged > branch.ignore ; select_branch }
alias gbg=git_branch_grep
function git_branch_grep(){ git branch | grep -i ${1:-.} > branch.ignore ; select_branch }
alias sb='select_branch'
function select_branch() { ([[ $1 =~ ',' ]] && select_branch_list $1 ${2:-pp} ) || select_branch_index ${1:-:} ${2:-pp}  }
function select_branch_index() { cat "branch.ignore" | pyp "pp[$1]|$2"}
function select_branch_name() { cat $1 | pyp "pp[:]"}
alias sbc=select_branch_checkout
function select_branch_checkout (){ git checkout $(select_branch ${1:-0} 'p'| head -1)}
alias sbl='select_branch_list'
function select_branch_list() { cat "branch.ignore" | pyp "[pp[i] for i in ($1)]|$2"}
alias sbg='select_branch_grep'
function select_branch_grep() { select_branch_index :  $2 | grep -i $1}
