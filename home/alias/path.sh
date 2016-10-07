alias path="cat path*"

alias gp=grep_recursive_case_insensitive_path
function grep_recursive_case_insensitive_path() { np=$(next_path path); grep -nri $1 ; grep -lri $1 | sort | tee -a $np;  echo "_____$1_____$np" >> $np;select_path_name $np }
alias vp='vim_path'
function vim_path() { vim -O $(select_path ${1:-0} ${2:-1} p) ${@:3} }
alias sp='select_path'
function select_path() { ([[ $1 =~ ',' ]] && select_path_list $1 ${2:-1} ${3:-pp} ) || select_path_index ${1:-:} ${2:-1} ${3:-pp}  }
function select_path_index() { cat "path$2.ignore" | pyp "pp[$1]|$3"}
function select_path_name() { cat $1 | pyp "pp[:]"}
alias spl='select_path_list'
function select_path_list() { cat "path$2.ignore" | pyp "[pp[i] for i in ($1)]|$3"}
alias spg='select_path_grep'
function select_path_grep() { select_path_index : ${2:-1} $3 | grep -i $1}
alias pp='pop_path'
function pop_path() { head -${1:-1} "path${2:-1}.ignore";sed -i "1,${1:-1}d" "path${2:-1}.ignore"; select_path }
alias rp='rotate_path'
function rotate_path() { head -${1:-1} "path${2:-1}.ignore" | tee -a "path${2:-1}.ignore" ;sed -i "1,${1:-1}d" "path${2:-1}.ignore"; select_path : ${2:-1} pp}
alias rrp='reverse_rotate_path'
function reverse_rotate_path() { last=$(tail -n 1 "path${2:-1}.ignore" ) ; sed -i "1i$last" "path${2:-1}.ignore" ; let TRUNCATE_SIZE="${#last} + 1"; truncate -s -"$TRUNCATE_SIZE" "path${2:-1}.ignore" ;echo $last; select_path : ${2:-1} pp }
alias hp='head_path'
function head_path() {head -3 "path${2:-1}.ignore"}

alias gdb="git_diff_branch"
function git_diff_branch(){ echo  $(head -1 branch.ignore);git diff $(head -1 branch.ignore) ; git diff --name-only $(head -1 branch.ignore) | tee "path${2:-1}.ignore" }

alias glgp="git_ls_grep_path"
function git_ls_grep_path() { np=$(next_path path); echo "_____$1_____.ignore" > $np;git ls-files | grep -i $1 | tee -a $np}
alias gsg=git_status_grep
function git_status_grep() { np=$(next_path path); git status -sb | pyp 'pp[1:] | w[-1]' |  grep -i ${1:-.}  |tee $np; echo "_____git_status_grep_$1_____$np" >> $np}

alias ap=add_path
function add_path() {echo "$1 " | tee -a "path${2:-1}.ignore" }
alias tp=tee_path
function tee_path() { tee -a "path${2:-1}.ignore" }
function next_path() { i=1; while [[ -e "$1$i.ignore" ]] ; do let i++; done ; echo "$1$i.ignore"  }
alias mp=merge_path
function merge_path() { cat path*.ignore | LC_ALL=C  sort | uniq > temp.ignore; rm path*ignore; mv temp.ignore path1.ignore; select_path }
