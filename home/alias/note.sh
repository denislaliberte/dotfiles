echo "note : $note var : $var";

export note_workspace="$HOME/workspace/notes.local/projects"

## Utils
function git_root() { basename $(git rev-parse --show-toplevel); }
function project_directory() { echo "$note_workspace/$(git_root)"; }

alias np="new_project";
function new_project() { mkdir -p $(project_directory)  && touch "$(project_directory)/var.sh" && echo $(project_directory); }

alias sv="source_var";
function source_var(){ var="$note_workspace/$(git_root)/var.sh" && echo "source $var" && source $var  && source ~/alias/note.sh source; }

alias nt="$HOME/scripts/newtask.sh";

function vn(){ vim $note -O $@; }
function en(){ echo $note && echo "\n  $* " | tee -a  $note; }
function tdn(){ echo $note && echo "__todo__    |  $*  | **status**" | tee -a  $note; }
function qn(){ echo $note && echo "__question__ |  $* ?  | **réponse**" | tee -a  $note; }

function todo(){ clear && resume | grep 'plus tard\|later' && echo '\n\n todo \n'; grep \* $s/resume.md | wc -l ;grep \*  $s/resume.md | grep -v 'plus tard\|later'; }
alias vtd=vim_todo
function vim_todo() { vim +$1 $note;todo | grep 'question\|todo' | tail -8 }
function last_todo() { todo | tail -1 | pyp 'p.split("|")[2]' }
alias tn="tail $note";
alias ta="tee -a $note";
alias vv="vim -O $var $note";


export notes_folder=$HOME/Sites/notes.local/
month=$(date +%m)
year=$(date +%Y)
export mf=$notes_folder/$year/$month # month folder
date=$(date +%Y-week-%V )
export daily=$mf/$date--daily.md
export daily_log=$mf/$date--daily-log.md
function date_note(){ date +'%Y-%m-%d %H:%M' }
function hn(){ echo $note && history |tail -1 | tee -a  $note }
function resume(){  resume_header | tee $s/resume.md  && grep -n '_question_\|_todo_\|_git_commit_\|_google_search_'  $note  | sed 's/__/  /g' | sed 's/:  / |  /g'| tee -a $s/resume.md }
function resume_header() { echo "type | budy | status " }
alias ngg="cat $note |grep -n '__search_google__\|]('"
alias nga="cat $note |grep -n '^__\|---'" 
alias lig="cat $note |grep -n ']('" 
function git_commit_note() { git commit -m $1 && git log -1 --format="$(date +'%Y-%m-%d--%H-%M') | $task | git |  %h  %s" >> $note  &&  git log --format="$(date +'%A | %H:%M') | $task | git |  %h  %s" >> $daily_log  &&  vim $note }
function daily() { daily_log $@  && arg=$(echo " $(pwd) $@" |sed 's/.Users.TP1.Sites.notes.local.//g'  | sed 's/.Users.TP1/\~/g'); echo "$(date +'%A | %H:%M') | $task | daily note | $arg" >>  $daily_log && vim $daily} 
function vim_daily() { arg=$(echo " $(pwd) $@" |sed 's/.Users.TP1.Sites.notes.local.//g'  | sed 's/.Users.TP1/\~/g'); echo "$(date +'%A | %H:%M') | $task | daily note | $arg" >>  $daily_log  &&  vim -O $daily $@ }
function tolog(){  grep -n '^0\|^## ' $daily }
alias dl='daily_log'
function daily_log()  {  echo "0 | $(date +'%m/%d/%Y | %H:%M') | $@"  >> $daily }
function gac { git add -A :/;git_commit_note "$task : $1 " }
alias cn="cat $note" 
alias cng="cat $note |grep -n"
alias vng="vn $(g ls-files -m)"
alias gcm="git_commit_note $1"
alias cv="cat $var"
alias vg="cat $var |grep"
alias vgt="grep $task $var"
alias fm="file_map"
export sc="$HOME/scripts"
