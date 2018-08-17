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


# np -> create a New Project directory and variables files 
function np(){
  mkdir -p $(project_directory)
  touch var_path
  echo $(project_directory)
}

function project_directory(){
  echo "$note_workspace/$(git_root)"
}
