# variables
echo "var : $var"
export var_workspace="$HOME/workspace/notes.local/projects"

function var_path() { "$var_workspace/$(git_root)/var.sh" }

# ev -> Edit Variable file with Vim
function ev(){ vim $var -O $@ }

# sv -> source variable file
function sv(){
  var="$var_workspace/$(git_root)/var.sh"
  echo "source $var"
  source $var
  source ~/alias/*
}

# vm test-> get the Var that match /test/
function vm(){ grep ${1:-export} $var }
