alias sbh=saved_branch_help
function saved_branch_help() {
  echo '
    $ sb -> select saved branch
    $ sbnm -> save all branch not merged
    $ sbd 1 -> delete branch 1
    $ sbc 2 -> checkout branch 2
    $ sbg test -> return all saved branch that match /test/
    $ sbr 1 -> git rebase on saved branch at index 1
  '
}

alias sb='select_branch'
function select_branch() { ([[ $1 =~ ',' ]] && select_branch_list $1 ) || select_branch_index ${1:-:}; saved_branch_help }


alias gbnm="deprecated sbnm"
alias sbnm=git_branch_no_merged
function git_branch_no_merged(){ git branch --no-merged > .ignore/branch.txt ; select_branch }

alias bg=branch_grep
function branch_grep(){ git branch | grep -i ${1:-.} > .ignore/branch.txt ; select_branch }


function select_branch_index() { cat ".ignore/branch.txt" | pyp "pp[$1]"}
function select_branch_name() { cat $1 | pyp "pp[:]"}

alias sbd=select_branch_delete # ex. `gbds 0` -> delete the first branch of .ignore/branch.txt
function select_branch_delete() {git branch -D $(select_branch_index $1 | head -1) }

alias sbl='select_branch_list'
function select_branch_list() { cat ".ignore/branch.txt" | pyp "[pp[i] for i in ($1)]|$2"}

alias sbr=select_branch_rebase # ex $ sbr 1
function select_branch_rebase() { git rebase -i  $(select_branch_index ${1:-0}) }

alias sbg='select_branch_grep'
function select_branch_grep() { select_branch_index :  $2 | grep -i $1}

alias sbc=select_branch_checkout
function select_branch_checkout() { select_branch_execute checkout ${1:-0}  }
function select_branch_execute (){ git $1 $(select_branch ${2:-0} 'p'| head -1)}

