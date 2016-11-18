alias gb=git_branch_no_merged
function git_branch_no_merged(){ git branch --no-merged > .ignore/branch.txt ; select_branch }
alias gbg=git_branch_grep
function git_branch_grep(){ git branch | grep -i ${1:-.} > .ignore/branch.txt ; select_branch }

alias sb='select_branch'
function select_branch() { ([[ $1 =~ ',' ]] && select_branch_list $1 ${2:-pp} ) || select_branch_index ${1:-:} ${2:-pp}  }
function select_branch_index() { cat ".ignore/branch.txt" | pyp "pp[$1]|$2"}
function select_branch_name() { cat $1 | pyp "pp[:]"}
alias sbl='select_branch_list'
function select_branch_list() { cat ".ignore/branch.txt" | pyp "[pp[i] for i in ($1)]|$2"}

alias sbg='select_branch_grep'
function select_branch_grep() { select_branch_index :  $2 | grep -i $1}

alias sbc=select_branch_checkout
function select_branch_checkout() { select_branch_execute checkout ${1:-0}  }
function select_branch_execute (){ git $1 $(select_branch ${2:-0} 'p'| head -1)}

