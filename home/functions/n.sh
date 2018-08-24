# Note

echo "note : $note";
export note_workspace="$HOME/workspace/notes.local/projects"

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
  file_path=$(sed "$1!d" $note | pyp 'p.split(":")[0]|w[-1]')
  echo $file_path
}


# epn 33 -> Edit file Path at the line 33 of the Note file and the line number after the :
function epn(){
  file_path=$(sed "$1!d" $note | pyp 'p.split(":")[0]|w[-1]')
  line_number=$(sed "$1!d" $note | pyp 'p.split(":")[1]')
  vim +$line_number $file_path
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
