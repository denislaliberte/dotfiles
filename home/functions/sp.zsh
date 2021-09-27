# saved path functions
# save path in text file

# sppm models ->  Save all Path where the Path Match /models/
function sppm() {
  np='.ignore/path.txt'
  npc='.ignore/path_content.txt'
  echo "- [ ] --- cmd: \"spcm $1 $2\"" > $npc
  git ls-files | grep -i $1 > $np;
  git ls-files | grep -i $1 | pyp '"  * [ ] --- { path: " + p +", line:1 }"' > $npc;
  saved_path_index $np
  vim -o $npc $note
}
function next_path() { i=1; while [[ -e "$1$i.txt" ]] ; do let i++; done ; echo "$1$i.txt"  }

# spa -> Show All Path
function spa() {show_path_all | sort}
function show_path_all(){ wc -l .ignore/path*.txt | q  'select c2,c1 from -'; grep -h .ignore .ignore/path*.txt }

# spcm class -> Save Path where the file Content Match the regex /class/
function spcm() {
  np='.ignore/path.txt'
  npc='.ignore/path_content.txt'
  echo "- [ ] --- cmd: \"spcm $1 $2\"" > $npc
  ag --noheading --nocolor $1 ${2:-*} | pyp "p.split(':')| '  * [ ] ' + ':'.join(p[2:]).strip() + ' --- { path: ' +p[0] + ', line: ' +  p[1] + ' }'"  >> $npc
  ag -l --nocolor $1 ${2:-*}  | sort > $np
  echo "$np # $0 $@" >> $np
  echo "$npc # $0 $@" >> $np
  saved_path_index $np
  vim -o $npc $note
}

# spdn  ->  Save Path from git branch Diff --Name-only origin/master
# spdn test-branche  ->  Save Path from git branch Diff --Name-only test-branche
function spdn(){
  np='.ignore/path.txt';
  npc='.ignore/path_content.txt'
  echo "- [ ] --- cmd: spdn" > $npc
  git diff ${1:-origin/master} --name-only | grep -i ${2:-.}  > $np;
  git diff ${1:-origin/master} --name-only | grep -i ${2:-.} | pyp "'  * [ ]  --- { path: %s, line: 1 }' %(p) "  >> $npc;
  echo "$np # $0 $@"   >> $np;
  echo "$npc # $0 $@" >> $np
  saved_path_index $np
  vim -o $npc $note
}

function saved_path_index() { cat $1 | pyp "pp[:]"}

# sp -> Select Path indexed
# sp 1,4  -> select path at index 1 and 4
# sp 2:4 2 -> select path at index 2, 3 and 4 of the file .ignore/path2.txt
alias sp=select_path
function select_path() { ([[ $1 =~ ',' ]] && select_path_list $1 ${2:-pp} ) || select_path_index ${1:-:} ${3:-pp} }
function select_path_index() { cat ".ignore/path.txt" | pyp "pp[$1]|w[0]|$2 "}
function select_path_list() { cat ".ignore/path.txt" | pyp "[pp[i] for i in ($1)]|w[0]|${2:-pp}"}

# ep 1 -> Edit file at Path 1
function ep() { vim -o $(select_path ${1:-:} ${2:-1} p) ${@:3} }

function show_saved_path(){ for path_file in .ignore/path*.txt; do echo "## ${path_file}";cat ${path_file} | pyp 'pp'; done}

# spgs -> Save Path that are in the Git Status
function spgs() { np='.ignore/path.txt';git_status_files |  grep -i ${1:-.} >> $np; echo "$np # $0 $1"  >> $np; saved_path_index $np}
function git_status_files() {  git status -sb |pyp 'pp[1:] | w[-1]' }

# sps -> Show all Path with git Status
function sps() {
  git status -sb
  echo '###'
  git_status_files > .ignore/git_status.txt
  select_path | grep -Ef .ignore/git_status.txt
  show.path.notes | grep -Ef .ignore/git_status.txt
}
