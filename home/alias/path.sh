
# show path
alias lp=list_path
function list_path(){ for path_file in .ignore/path*.txt; do echo "## ${path_file}";cat ${path_file} | pyp 'pp'; done}
alias lt=list_test
function list_test(){ list_path_grep test.rb }
alias lpg=list_path_grep
function list_path_grep() { list_path | grep $@}
alias sp='select_path'
function select_path() { ([[ $1 =~ ',' ]] && select_path_list $1 ${2:-1} ${3:-pp} ) || select_path_index ${1:-:} ${2:-1} ${3:-pp}  }
function select_path_index() { cat ".ignore/path$2.txt" | pyp "pp[$1]|$3"}
alias spl='select_path_list'
function select_path_list() { cat ".ignore/path$2.txt" | pyp "[pp[i] for i in ($1)]|$3"}
alias hp='head_path'
function head_path() {head -3 ".ignore/path${2:-1}.txt"}
alias gs=show_path_git_status
function show_path_git_status() { git status -sb; echo '###'; git status -sb |pyp 'pp[1:] | w[-1]' > .ignore/git_status.txt ; select_path | grep -Ef .ignore/git_status.txt; cat .ignore/git_status.txt | grep -vEf .ignore/path1.txt }
alias spdm=show_path_git_diff_master
function show_path_git_diff_master() { git diff origin/master --name-only |pyp 'pp[1:] | w[-1]' > .ignore/git_status.txt ; select_path | grep -Ef .ignore/git_status.txt }

#use path
alias vp='vim_path'
function vim_path() { vim -O $(select_path ${1:-:} ${2:-1} p) ${@:3} }
alias gdp=git_diff_path
function git_diff_path() { git diff $(select_path $1 $2) $3}
alias gckp=git_checkout_path
function git_checkout_path() { git checkout $(select_path $1) }
function git_blame_path(){ git blame $(select_path $1)}
alias gbp=git_blame_path

# add path
alias gp=grep_recursive_case_insensitive_path
function grep_recursive_case_insensitive_path() { np=$(next_path .ignore/path); grep -nri $1 ${2:-*} ; grep -lri $1 ${2:-*}  | sort >> $np;  echo "_____$1_____$np" >> $np;select_path_name $np }
alias glgp="git_ls_grep_path"
function git_ls_grep_path() { np=$(next_path .ignore/path); echo "_____$1_____$np" > $np;git ls-files | grep -i $1 >> $np; select_path_name $np}
alias gsg=git_status_grep
function git_status_grep() { np=$(next_path .ignore/path); git status -sb | pyp 'pp[1:] | w[-1]' |  grep -i ${1:-.} >> $np; echo "_____git_status_grep_$1_____$np" >> $np; select_path_name $np}
alias gdnp=git_diff_name_path
function git_diff_name_path(){ np=$(next_path .ignore/path); git diff ${1:-origin/master} --name-only | grep -i ${2:-.}  >> $np; echo "_____git_diff_${1:-origin/master}_$2____$np" >> $np; select_path_name $np }
alias ap=add_path
function add_path() {echo "$1 " | tee -a ".ignore/path${2:-1}.txt" }
alias gdb="git_diff_branch"
function git_diff_branch(){ echo  $(head -1 branch.txt);git diff $(head -1 branch.txt) ; git diff --name-only $(head -1 branch.txt) >> ".ignore/path${2:-1}.txt"; select_path_name $np }


# modify path
alias pp='pop_path'
function pop_path() { head -${1:-1} ".ignore/path${2:-1}.txt";sed -i.ignore "1,${1:-1}d" ".ignore/path${2:-1}.txt"; select_path }
alias rp='rotate_path'
function rotate_path() { head -${1:-1} ".ignore/path${2:-1}.txt" | tee -a ".ignore/path${2:-1}.txt" ;sed -i.ignore "1,${1:-1}d" ".ignore/path${2:-1}.txt"; select_path : ${2:-1} pp}
alias rrp='reverse_rotate_path'
function reverse_rotate_path() { last=$(tail -n 1 ".ignore/path${2:-1}.txt" ) ; sed -i.ignore "1i$last" ".ignore/path${2:-1}.txt" ; let TRUNCATE_SIZE="${#last} + 1"; truncate -s -"$TRUNCATE_SIZE" ".ignore/path${2:-1}.txt" ;echo $last; select_path : ${2:-1} pp }
alias mp=merge_path
function merge_path() { cat .ignore/path*.txt | LC_ALL=C  sort | uniq | grep -v ignore > temp.txt; rm .ignore/path*txt; mv temp.txt .ignore/path1.txt; select_path }
alias rmp=rm_path
function rm_path() { rm .ignore/path${1:-*}.txt }


alias tp=tee_path
function tee_path() { tee -a ".ignore/path${2:-1}.txt" }
function next_path() { i=1; while [[ -e "$1$i.txt" ]] ; do let i++; done ; echo "$1$i.txt"  }
function select_path_name() { cat $1 | pyp "pp[:]"}
alias spg='select_path_grep'
function select_path_grep() { select_path_index : ${2:-1} $3 | grep -i $1}
