alias sph=saved_path_help
function saved_path_help(){
  echo '
    $ sph vim -> show help line that match the regex /vim/
    $ sp -> show saved path indexed
    $ spv 1 -> edit the saved path at the index 1 with vim
    $ spt -> show saved path that match /test/ indexed
    $ spg models -> select path that match grep /models/ indexed
    $ spdt 1 /update/ -> run dev test on selected path
    $ spc 1 -> git checkout on saved path at index 1
    $ sps -> saved path with git status
  ' | grep ${1:-.}
}

alias lp='deprecated sp'
alias sp=show_saved_path
function show_saved_path(){ for path_file in .ignore/path*.txt; do echo "## ${path_file}";cat ${path_file} | pyp 'pp'; done}

alias lt="deprecated spt"
alias spt=show_saved_path_test
function show_saved_path_test(){ show_saved_path | grep test.rb | grep ${1:-test} }

alias lpg="deprecated spg"
alias lg="deprecated spg"
alias pg=select_path_grep
alias spg=select_path_grep
function select_path_grep() { show_saved_path | grep $@}

alias sp=select_path # return a subset of path save in .ignore/path*.txt # also see select_path_index and select_path_list # ex. `sp 0` -> return the first line of .ignore/path1.txt
function select_path() { ([[ $1 =~ ',' ]] && select_path_list $1 ${2:-1} ${3:-pp} ) || select_path_index ${1:-:} ${2:-1} ${3:-pp}  }
alias spi=select_path_index
function select_path_index() { cat ".ignore/path$2.txt" | pyp "pp[$1]|$3"}
alias spl=select_path_list
function select_path_list() { cat ".ignore/path$2.txt" | pyp "[pp[i] for i in ($1)]|$3"}

alias vp='deprecated spv'
alias spv=select_saved_path_vim
function select_saved_path_vim() { vim -O $(select_path ${1:-:} ${2:-1} p) ${@:3} }


alias gdp=git_diff_path
function git_diff_path() { git diff $(select_path $1 $2) $3}
alias gap=git_add_path # add the file of the path to git # ex. `$ gap 1 2`
function git_add_path() {git add $(select_path $1 $2) }

alias spc=select_path_checkout
function select_path_checkout() { git checkout $(select_path $1) }

function git_blame_path(){ git blame $(select_path $1)}
alias gbp=git_blame_path
alias gp=grep_recursive_case_insensitive_path
function grep_recursive_case_insensitive_path() { np=$(next_path .ignore/path); grep -nri $1 ${2:-*} ; grep -lri $1 ${2:-*}  | sort >> $np;  echo "_____$1_____$np" >> $np;select_path_name $np }
alias gl="git_ls_grep_path" #   previously glgp #  `$ gl example`  ->  send all file path from the git index in the .ignore/path*.txt file
alias glgp="deprecated gl"
function git_ls_grep_path() { np=$(next_path .ignore/path); echo "_____$1_____$np" > $np;git ls-files | grep -i $1 >> $np; select_path_name $np}

function git_status_files() {  git status -sb |pyp 'pp[1:] | w[-1]' }
alias gsg=git_status_grep # capture all changed file path in git to the next .ignore/pathN.txt file
function git_status_grep() { np=$(next_path .ignore/path);git_status_files |  grep -i ${1:-.} >> $np; echo "_____git_status_grep_$1_____$np" >> $np; select_path_name $np}

alias gdnp=git_diff_name_path
function git_diff_name_path(){ np=$(next_path .ignore/path); git diff ${1:-origin/master} --name-only | grep -i ${2:-.}  >> $np; echo "_____git_diff_${1:-origin/master}_$2____$np" >> $np; select_path_name $np }
alias gdb="git_diff_branch"
alias gcp=git_checkout_path
function git_checkout_path(){git checkout $(select_path_index $1 ${2:-1})}
alias pp='pop_path'
function pop_path() { head -${1:-1} ".ignore/path${2:-1}.txt";sed -i.ignore "1,${1:-1}d" ".ignore/path${2:-1}.txt"; select_path }
alias rop='rotate_path'
function rotate_path() { head -${1:-1} ".ignore/path${2:-1}.txt" | tee -a ".ignore/path${2:-1}.txt" ;sed -i.ignore "1,${1:-1}d" ".ignore/path${2:-1}.txt"; select_path : ${2:-1} pp}
alias rrp='reverse_rotate_path'
function reverse_rotate_path() { last=$(tail -n 1 ".ignore/path${2:-1}.txt" ) ; sed -i.ignore "1i$last" ".ignore/path${2:-1}.txt" ; let TRUNCATE_SIZE="${#last} + 1"; truncate -s -"$TRUNCATE_SIZE" ".ignore/path${2:-1}.txt" ;echo $last; select_path : ${2:-1} pp }
alias mp=merge_path
function merge_path() { cat .ignore/path*.txt | LC_ALL=C  sort | uniq | grep -v ignore > temp.txt; rm .ignore/path*txt; mv temp.txt .ignore/path1.txt; select_path }
alias rp=rm_path # ex.  `$ rp`  ->  remove all file .ignore/path*.txt
alias rmp="deprecated rp"
function rm_path() { rm .ignore/path${1:-*}.txt }
function next_path() { i=1; while [[ -e "$1$i.txt" ]] ; do let i++; done ; echo "$1$i.txt"  }
function select_path_name() { cat $1 | pyp "pp[:]"}
alias spg='select_path_grep'
function select_path_grep() { select_path_index : ${2:-1} $3 | grep -i $1}

alias sps=saved_path_git_status
alias gs="deprecated sps"
function saved_path_git_status() { git status -sb; echo '###'; git_status_files > .ignore/git_status.txt ; select_path | grep -Ef .ignore/git_status.txt }
