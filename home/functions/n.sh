# Note

echo "note : $note";
export note_workspace="$HOME/workspace/notes.local/projects"

# np -> create a New Project directory and variables files 
function np(){
  mkdir -p $(project_directory)
  touch var_path
  echo $(project_directory)
}

function project_directory(){
  echo "$note_workspace/$(git_root)"
}
