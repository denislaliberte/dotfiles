# saved path functions
# save path in text file

# sppm models ->  Save all Path where the Path Match /models/
alias spgl='deprecated sppm'
function sppm() {
  np=$(next_path .ignore/path);
  echo "$np # $0 $@" > $np;
  git ls-files | grep -i $1 >> $np;
  saved_path_index $np
}
function next_path() { i=1; while [[ -e "$1$i.txt" ]] ; do let i++; done ; echo "$1$i.txt"  }

# spa -> Show All Path
function spa() {show_path_all | sort}
function show_path_all(){ wc -l .ignore/path*.txt | q  'select c2,c1 from -'; grep -h .ignore .ignore/path*.txt }

# spcm class -> Save Path where the file Content Match the regex /class/
function spcm() { np=$(next_path .ignore/path); grep -nri $1 ${2:-*} ; grep -lri $1 ${2:-*}  | sort >> $np;  echo "$np # $0 $@" >> $np;saved_path_index $np }

# spdn  ->  Save Path from git branch Diff --Name-only origin/master
# spdn test-branche  ->  Save Path from git branch Diff --Name-only test-branche
function spdn(){ np=$(next_path .ignore/path); git diff ${1:-origin/master} --name-only | grep -i ${2:-.}  >> $np; echo "$np # $0 $@"   >> $np; saved_path_index $np }

function saved_path_index() { cat $1 | pyp "pp[:]"}

# sp -> Select Path indexed
# sp 1,4  -> select path at index 1 and 4
# sp 2:4 2 -> select path at index 2, 3 and 4 of the file .ignore/path2.txt
alias sp=select_path
function select_path() { ([[ $1 =~ ',' ]] && select_path_list $1 ${2:-1} ${3:-pp} ) || select_path_index ${1:-:} ${2:-1} ${3:-pp} }
function select_path_index() { cat ".ignore/path$2.txt" | pyp "pp[$1]|w[0]|$3 "}
function select_path_list() { cat ".ignore/path$2.txt" | pyp "[pp[i] for i in ($1)]|w[0]|${3:-pp}"}


# spv 1 -> Select Path 1 and edit it with Vim
function spv() { vim -O $(select_path ${1:-:} ${2:-1} p) ${@:3} }

# spm models -> Select Path that Match /models/ indexed
function spm() {
  select_path_index : ${2:-1} ${3:-pp} | grep -i $1
}

# spmt -> Select Path that Match /Test.rb/ indexed
# spmt model -> Select Path that Match /Test.rb/ and /model/ indexed
function spmt(){ show_saved_path | grep test.rb | grep ${1:-test} }
function show_saved_path(){ for path_file in .ignore/path*.txt; do echo "## ${path_file}";cat ${path_file} | pyp 'pp'; done}

# spma -> Select Path that Match /App\// indexed
# spma controller -> Select Path that Match /App\// and /controller/ indexed
function spma(){ show_saved_path | grep '\/app\/' | grep ${1:-app} }



# spt 1 update -> Select Path 1 and run dev Test /update/ on it
function spt(){ dev test $(select_path $1 ${3:-1}) -n "/${2:-test}/" }

# sptrd 1 update -> Select Path at index 1  and run dev Test --Record-Deprecations /update/ on it
function sptrd() { dev test --record-deprecations $(select_path $1 ${3:-1}) -n "/${2:-test}/" }



# spga 1 -> Select Path at the index 1 and Git Add it
function spga() {git add $(select_path $1 $2) }

# spc 1 -> Select Path at index 1 and git Checkout on i on it
function spc() { git checkout $(select_path_index $1 ${2:-1}) }


# spgs -> Save Path that are in the Git Status
function spgs() { np=$(next_path .ignore/path);git_status_files |  grep -i ${1:-.} >> $np; echo "$np # $0 $1"  >> $np; saved_path_index $np}
function git_status_files() {  git status -sb |pyp 'pp[1:] | w[-1]' }

# sps -> Show all Path with git Status
function sps() {
  git status -sb
  echo '###'
  git_status_files > .ignore/git_status.txt
  select_path | grep -Ef .ignore/git_status.txt
}


# spd 1 1 master -> Select the Path at index 1 of the file 1 and git Diff it with master
function spd() { git diff $(select_path $1 $2) $3}

# spdv 1 1 master -> Select the Path at index 1 of the file 1 git Diff then edit it with Vim
function spdv() {
  git diff $(select_path $1 $2) $3
  vim -O $(select_path ${1:-:} ${2:-1} p) ${@:4}
}


# spgb -> Select Path at index 1 and Git Blame it
function spgb(){ git blame $(select_path $1)}

# sprm 1 -> Select Path and ReMove
function sprm() { rm $(select_path $1 ${2:-1}) }

# rp 2 -> remove paths file 2
# rp -> remove all paths files
alias rp=rm_path
function rm_path() { rm .ignore/path${1:-*}.txt }

# mp -> merge path; take the content of all path file, sort and uniq
function mp() {
  cat .ignore/path*.txt | sed 's/path..txt/path1.txt/g'| LC_ALL=C  sort | uniq  > temp.txt;
  rm .ignore/path*txt;
  mv temp.txt .ignore/path1.txt;
  select_path
}


alias pp='pop_path'
function pop_path() { head -${1:-1} ".ignore/path${2:-1}.txt";sed -i.ignore "1,${1:-1}d" ".ignore/path${2:-1}.txt"; select_path }

alias rop='rotate_path'
function rotate_path() { head -${1:-1} ".ignore/path${2:-1}.txt" | tee -a ".ignore/path${2:-1}.txt" ;sed -i.ignore "1,${1:-1}d" ".ignore/path${2:-1}.txt"; select_path : ${2:-1} pp}

alias rrp='reverse_rotate_path'
function reverse_rotate_path() { last=$(tail -n 1 ".ignore/path${2:-1}.txt" ) ; sed -i.ignore "1i$last" ".ignore/path${2:-1}.txt" ; let TRUNCATE_SIZE="${#last} + 1"; truncate -s -"$TRUNCATE_SIZE" ".ignore/path${2:-1}.txt" ;echo $last; select_path : ${2:-1} pp }


alias gp='deprecated spcm'
alias spgt='deprecated spmt'
alias rmp="deprecated rp"
alias spg='deprecated spm'
alias lp='deprecated sp'
alias gs="deprecated sps"
alias lt="deprecated spt"
alias lpg="deprecated spg"
alias lg="deprecated spg"
alias vp='deprecated spv'
alias glgp="deprecated gl"
alias gdnp='deprecated spdn'
