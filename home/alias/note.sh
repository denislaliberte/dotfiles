

alias nt="$HOME/scripts/newtask.sh"

function vn(){ vim $note -O $@ }
function en(){ echo $note ; echo "- $*" | tee -a  $note }
function tdn(){ echo $note ; echo "- [ ]  $*" | tee -a  $note }
# tdnc command -> add ToDo to Note with a Command to check
function tdnc(){ echo $note ; echo "- [ ] check \$ $*" | tee -a  $note }
function qn(){ echo $note ; echo "- Q. $* ? | A." | tee -a  $note }

alias todo='deprecated t'
alias ct=check_todo
function check_todo() { vim "+ normal $1gg@d" $note; todo |tail -8 }
alias vt=vim_todo
alias vtd="deprecated vt"
function vim_todo(){ vim +$1 $note;todo | tail -8 }


function last_todo(){ todo | tail -1 | pyp 'p.split("|")[2]' }
alias tn="tail $note"
alias ta="tee -a $note"

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
