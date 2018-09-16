# Note

echo "note : $note";
export note_workspace="$HOME/workspace/notes.local/projects"

# enp -> Export Note Path
function enp() {
  export shelf="$q/$(rn)/$(bn)/weeks/$(date +%W)"
  mkdir -p $shelf
  export s=$shelf
  export note=$shelf/readme.md
  export n=$note
}

alias vn='deprecated ne'
alias en=ne
# ne -> Note Edit
function ne(){
  vim $note -O $@
}

# na this is a message -> Note Add "this is a message"
function na(){
  echo $note 
  echo "- $*" | tee -a  $note
}

# spn 33 -> show path from note
function spn(){
  file_path=$(cat $note | pyp "[pp[i] for i in ($1,)] |p.split(':')[0]|w[-1]")
  echo $file_path
}


# epn 33 -> Edit file Path at the line 33 of the Note file and the line number after the :
function epn(){
  file_path=$(cat $note | pyp "[pp[i] for i in ($1,)] | p.split(':')[0] | w[-1] | '\n' .join(pp)")
  first_index=$(echo $1 | pyp 'p.split(",")[0]')
  line_number=$(cat $note | pyp "pp[$first_index]" | pyp 'p.split(":")[1]|w[0]')
  echo $file_path > .ignore/file_path_from_note.txt
  vim -o +$line_number $(cat .ignore/file_path_from_note.txt)
}

# pn -> Show Path from Notes
function pn() {
  cat $note | pyp 'pp' | grep '\/.*\..*:'
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


# nrt -> Note: Run Test and save rerun command to note
function nrt() {
  dev test $@ | grep Rerun | pyp "p.replace('Rerun:', '- [ ] Rerun: $ ')" | tee -a $note
}
