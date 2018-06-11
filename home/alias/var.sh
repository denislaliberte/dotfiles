echo "var : $var";
export var_workspace="$HOME/workspace/notes.local/projects"

function var_path() { "$var_workspace/$(git_root)/var.sh" }

alias sv="source_var";
function source_var(){ var="$var_workspace/$(git_root)/var.sh" && echo "source $var" && source $var  && source ~/alias/*; }

function vv(){ vim $var -O $@;}

alias cv="cat $var"
function grep_var(){ grep ${1:-export} $var }
alias gv=grep_var
function gvb() {grep_var export.b | grep ${1:-.} }

