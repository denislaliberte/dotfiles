alias gp=grep_recursive_case_insensitive_path
function grep_recursive_case_insensitive_path() { grep -nri $1 ; grep -lri $1 | sort > "path${2:-1}.ignore"; select_path : ${2:-1} }
alias vp='vim_path'
function vim_path() { vim -O $(select_path ${1:-0} ${2:-1} p) ${@:3} }
alias sp='select_path'
function select_path() { cat "path${2:-1}.ignore" | pyp "pp[${1:-:}]|${3:-pp}"}
alias spg='select_path_grep'
function select_path_grep() { cat "path${2:-1}.ignore" | pyp "pp[:]|${3:-pp}" | grep -i $1}
alias pp='pop_path'
function pop_path() { head -${1:-1} "path${2:-1}.ignore";sed -i "1,${1:-1}d" "path${2:-1}.ignore" }
alias rp='rotate_path'
function rotate_path() { head -${1:-1} "path${2:-1}.ignore" | tee -a "path${2:-1}.ignore" ;sed -i "1,${1:-1}d" "path${2:-1}.ignore"; select_path }
alias rrp='reverse_rotate_path'
function reverse_rotate_path() { last=$(tail -n 1 "path${2:-1}.ignore" ) ; sed -i "1i$last" "path${2:-1}.ignore" ; let TRUNCATE_SIZE="${#last} + 1"; truncate -s -"$TRUNCATE_SIZE" "path${2:-1}.ignore" ;echo $last; select_path }
alias hp='head_path'
function head_path() {head -3 "path${2:-1}.ignore"}
alias gdb="git_diff_branch"
function git_diff_branch(){ echo  $(head -1 branch.ignore);git diff $(head -1 branch.ignore) ; git diff --name-only $(head -1 branch.ignore) | tee "path${2:-1}.ignore" }
alias glgp="git_ls_grep_path"
function git_ls_grep_path() { git ls-files | grep -i $1 | tee "path${2:-1}.ignore"}
alias gsg=git_status_grep
function git_status_grep() { git status -sb | pyp 'pp[1:] | w[-1]' |  grep ${1:-.}  |tee "path${2:-1}.ignore" }
alias ap=add_path
function add_path() {echo "$1 " | tee -a "path${2:-1}.ignore" }
alias tp=tee_path
function tee_path() { tee -a "path${2:-1}.ignore" }
