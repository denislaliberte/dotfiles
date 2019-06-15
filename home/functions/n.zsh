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

# eqn -> Edit Quarter Note
alias eqn=edit.quarter.note
function edit.quarter.note(){
  vim +${1:-1} $note -O $q/readme.md
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
    vim -o +$line $file_path +"vsp +$line2 $file_path2" ${@:3}
  fi
  vim +$1 $note
}


# epnn 33 -> Edit file Path at the line 33 of the Note file with the Note file at the same line
function epnn(){
  file_path=$(get.data.line $1 path)
  line=$(get.data.line $1 line 1)
  vim -o +$1 $note +"vsp +$line $file_path" ${@:2}
}

# cpn 33 -> git Checkout file where the Path is at the line 33 of the Note file
alias cpn=checkout.path.note
function checkout.path.note(){
  file_path=$(get.data.line $1 path)
  git diff $file_path > .ignore/diff.txt
  git checkout $file_path
  echo "checkout $file_path"
  echo 'ignore/diff.txt'
  cat .ignore/diff.txt | tee -a $note
  vim +$1 $note
}

# tpn 33 -> Test file Path at the line 33 of Note file
alias tpn=test.path.note
function test.path.note() {
  file_path=$(get.data.line $1 path)
  line=$(get.data.line $1 line)
  echo "dev test $file_path"
  dev test $file_path | tee .ignore/test.txt
  cat .ignore/test.txt | pyp 'len(c) >= 3 | c[1].isdigit()  | "  * [ ] --- { path: %s, line: %s }" %(c[0], c[1]) | p.replace("\#", "#") | pp.sort() | p' | tee -a .ignore/test.txt

  cat .ignore/test.txt | pyp "'Rerun' in p | p.split('dev test')[1].split('--seed')[0]| '  * [ ] --- { cmd: \"dev test %s\" }' % p" | tee -a .ignore/test.txt
  vim -o .ignore/test.txt $file_path
  vim -o .ignore/test.txt +"vsp +$1 $note"
}

# bpn 1 -> Blame file Path at line 1 of the Note file
alias bpn=blame.path.note
function blame.path.note(){
  file_path=$(get.data.line $1 path)
  line=$(get.data.line $1 line 1)
  git blame --abbrev=10 -s $file_path > .ignore/blame.txt
  echo >> .ignore/blame.txt
  cat .ignore/blame.txt |  pyp "w[0]|pp.uniq()|p| p != '00000000000'" | xargs git show --format='COMMIT %s %an --- commit: %h' --name-only | pyp '"  * [ ] --- path: " + p | p.replace("--- path: COMMIT", "")' >> .ignore/blame.txt
  vim -o +$line .ignore/blame.txt +"vsp +$1 $note"
}

# dpn 1 -> Diff file Path at line 1 of the Note file
alias dpn=diff.path.note
function diff.path.note(){
  file_path=$(get.data.line $1 path)
  line=$(get.data.line $1 line 1)
  git diff $om $file_path > .ignore/diff.txt
  echo >> .ignore/diff.txt
  vim -o +$line .ignore/diff.txt +"vsp +$line $file_path"
  vim +$1 $note
}

# gscn 1 -> Git Show Commit on Note file at line 1
function gscn() {
  commit=$(get.data.line $1 commit)
  git show $commit | pyp '"   >>>     "+ p|p.replace("     +++ b/", " - [ ] ").replace("      def", "* [ ] def").replace("    test", " * [ ] test")' >> .ignore/diff.txt
  vim -o +$1 $note  .ignore/diff.txt
}

# spn -> Show Path Notes
# spn serializer -> Show Path Notes that match /serializer/
# spn serializer 10 -> Show 10 Path Notes that match /serializer/
alias spn=show.path.notes
function show.path.notes() {
  grep -in ${1:-.} $note | grep '\[ \]' | grep 'path:' | grep -v LATER | HEAD -${2:-15} | grep -i ${1:-.}
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

# cn -> Commit Note
alias cn=commit.note
function commit.note(){
  echo "commit.note $@ --- note: $note"
  message="${@:2} $( sed -n "$1p" $note | sed 's/[^a-zA-Z0-9 ]//g' )"
  echo "--- message: $message"
  git add -A :/
  git commit --allow-empty -m $message
  git log --format='%h  "%ar"  %f'  | head -1 | pyp "'  * [ ] LATER review commit: ' + p" | tee -a $n
  git show HEAD | review_diff >  .ignore/commit.txt
  vim .ignore/commit.txt +"vsp +$1 $note"
  git.log.master
}
