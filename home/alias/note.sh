export notes_folder=$HOME/Sites/notes.local/
month=$(date +%m)
year=$(date +%Y)
export mf=$notes_folder/$year/$month # month folder
date=$(date +%Y-week-%V )
export daily=$mf/$date--daily.md
export daily_log=$mf/$date--daily-log.md
function line_note() {wc -l $note  | awk {'print $1'} }
function date_note(){date +'%Y-%m-%d %H:%M'}
function hn(){ echo $note && history |tail -1 | tee -a  $note }
function resume(){  resume_header | tee $s/resume.md  && grep -n '_question_\|_todo_\|_git_commit_\|_google_search_'  $note  | sed 's/__/  /g' | sed 's/:  / |  /g'| tee -a $s/resume.md }
alias ngg="cat $note |grep -n '__search_google__\|]('"
alias nga="cat $note |grep -n '^__\|---'" 
alias lig="cat $note |grep -n ']('" 
function git_commit_note() { git commit -m $1 && git log -1 --format="$(date +'%Y-%m-%d--%H-%M') | $task | git |  %h  %s" >> $note  &&  git log -1 --format="$(date +'%A | %H:%M') | $task | git |  %h  %s" >> $daily_log  &&  vim $note }
function daily() { daily_log $@  && arg=$(echo " $(pwd) $@" |sed 's/.Users.TP1.Sites.notes.local.//g'  | sed 's/.Users.TP1/\~/g'); echo "$(date +'%A | %H:%M') | $task | daily note | $arg" >>  $daily_log && vim $daily} 
function vim_daily() { arg=$(echo " $(pwd) $@" |sed 's/.Users.TP1.Sites.notes.local.//g'  | sed 's/.Users.TP1/\~/g'); echo "$(date +'%A | %H:%M') | $task | daily note | $arg" >>  $daily_log  &&  vim -O $daily $@ }
function tolog(){  grep -n '^0\|^## ' $daily }
alias dl='daily_log'
function daily_log()  {  echo "0 | $(date +'%m/%d/%Y | %H:%M') | $@"  >> $daily }
function gac { git add -A :/;git_commit_note " $task $1 " }
alias cn="cat $note" 
alias cng="cat $note |grep -n"
alias vng="vn $(g ls-files -m)"
alias gcm="git_commit_note $1"
alias cv="cat $var"
alias vg="cat $var |grep"
alias vgt="grep $task $var"
alias fm="file_map"
export sc="$HOME/scripts"
