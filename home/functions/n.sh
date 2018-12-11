# Note

echo "note : $note";
export note_workspace="$HOME/workspace/notes.local/projects"

# enp -> Export Note Path
# enp 25 features/asdf -> Export Note Path for the week 25 and the branch name features/asdf
function enp() {
  branch=${2:-$(bn)}
  export shelf="$q/$(rn)/$branch/weeks/${1:-$(date +%W)}"
  mkdir -p $shelf
  export s=$shelf
  export note=$shelf/readme.md
  export n=$note
  echo "- $(date +%H%m) $(pwd | pyp 's[5:7]|s') work on: \$q/$(echo $n |  pyp 's[8:]|s'):1 branch: $branch" | tee -a $w/readme.md
}

# en -> Edit Note
alias en=edit.note
function edit.note(){
  vim +${1:-1} $note -O "${@:2}"
}

# na this is a message -> Note Add "this is a message"
function na(){
  echo $note 
  echo "- $*" | tee -a  $note
}

# un -> show Url in Note
function un() {
  tf | grep -o "http[^ ]*" | pyp 'pp'
}

# oun 1 -> Open Url in Note at Index 1
function oun() {
  open $(tf | grep -o "http[^ ]*" | pyp "pp[$1]")
}

# epn 33 -> Edit file Path at the line 33 of the Note file
# epn 33 34 -> Edit file Path at the line 33 and 34 of the Note file
function epn(){
  file_path=$(get.data.line $1 path)
  line=$(get.data.line $1 line 1)
  if [ "x$2" = x ]
  then
    vim -o +$line $file_path
  else
    file_path2=$(get.data.line $2 path)
    line2=$(get.data.line $2 line 1)
    vim -o +$line $file_path +$line2 $file_path2 
  fi
}

# spn -> Show Path Notes
# spn serializer -> Show Path Notes that match /serializer/
# spn serializer 10 -> Show 10 Path Notes that match /serializer/
function spn() {
  grep -n ${1:-.} $note | grep '\[ \].*path:' | grep -v LATER | HEAD -${2:-5}
}

# spns 33 -> show path from note split only the path
function spns(){
  file_path=$(sed "$1!d" $note | pyp "p.split(':')[0]|w[-1]")
  echo $file_path
}


# np -> create a New Project directory and variables files 
function np(){
  mkdir -p $(project_directory)
  touch var_path
  echo $(project_directory)
}

function project_directory(){
  echo "$note_workspace/$(git_root)"
}


# rst ->  Run and Sumarize Test
function nrt() {
  dev test $@ | tee .ignore/test.txt
  st
}

# st -> Sumarize Test to note file
function st() {
  grep 'Error\|Rerun\|#' .ignore/test.txt | pyp "p.replace('Rerun:', '- [ ] Rerun: --- cmd: ')" | tee -a $note
}

# sn -> Summarize Notes
function sn() {
  cat ${1:-$n}|grep  '^#\|\[ \]\|\]:'
}

