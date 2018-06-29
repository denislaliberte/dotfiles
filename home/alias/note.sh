echo "note : $note";

export note_workspace="$HOME/workspace/notes.local/projects"

## Utils
function project_directory(){ echo "$note_workspace/$(git_root)"; }

alias np="new_project";
function new_project(){ mkdir -p $(project_directory)  && touch var_path  && echo $(project_directory); }

alias nt="$HOME/scripts/newtask.sh";

function vn(){ vim $note -O $@; }
function en(){ echo $note && echo "- $*" | tee -a  $note; }
function tdn(){ echo $note && echo "- [ ]  $*" | tee -a  $note; }
function qn(){ echo $note && echo "- Q. $* ? | A." | tee -a  $note; }

function todo(){ grep -n LATER $note; grep -E -n '\- Q.*A.$|\- \[ \]' $note | grep -v LATER | grep -E '\- Q.*A.$|\- \[ \]' }
alias vtd=vim_todo
function vim_todo(){ vim +$1 $note;todo | tail -8 }

alias cn=execute_command_from_note
function execute_command_from_note(){ sed "$1!d" $note | sed -n -e 's/^.*\$//p' ; $( sed "$1!d" $note | sed -n -e 's/^.*\$//p' ) }
function last_todo(){ todo | tail -1 | pyp 'p.split("|")[2]' }
alias tn="tail $note";
alias ta="tee -a $note";

export notes_folder=$HOME/Sites/notes.local/

month=$(date +%m)
year=$(date +%Y)
export mf=$notes_folder/$year/$month # month folder
date=$(date +%Y-week-%V )
function date_note(){ date +'%Y-%m-%d %H:%M' }
function hn(){ echo $note && history |tail -1 | tee -a  $note }
alias ngg="cat $note |grep -n '__search_google__\|]('"
alias nga="cat $note |grep -n '^__\|---'" 
alias lig="cat $note |grep -n ']('" 
alias cng="cat $note |grep -n"
alias fm="file_map"
export sc="$HOME/scripts"
