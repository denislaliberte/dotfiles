echo "note : $note var : $var"
function asdf(){ sed 's/.Users.TP1/\~/g' }
project_directory="$notes_folder/projects/$(basename $PWD)"
export notes_folder=$HOME/Sites/notes.local/
month=$(date +%m)
year=$(date +%Y)
export mf=$notes_folder/$year/$month # month folder
date=$(date +%Y-week-%V )
export daily=$mf/$date--daily.md
export daily_log=$mf/$date--daily-log.md
function open_firefox() { echo "\n  __open__ http://$1" |tee -a $n && open -a firefox "http://$1" }
alias of="open_firefox"
function en(){ echo $note && echo "\n  $* " | tee -a  $note }
function tdn(){ echo $note && echo "\n __todo__    |  $*  | **status**  | **détails**   " | tee -a  $note }
function qn(){ echo $note && echo "\n __question__ |  $*  | **réponse**  | **détails**    " | tee -a  $note }
function resume(){grep -n '_question_\|_todo_\|_git_commit_'  $note | sed 's/: / | /g' | sed 's/__/**/g' }
function resume_note(){grep -n '_question_\|_todo_\|_git_commit_'  $note | sed 's/: / | /g' | sed 's/__/**/g' | tee -a $note_log}
alias ngg="cat $note |grep -n '__search_google__\|]('"
alias nga="cat $note |grep -n '^__\|---'" 
alias lig="cat $note |grep -n ']('" 
function vn(){vim_note $@  && vim $note $note_log -O $@}
function vim_note() { line_note=$(wc -l $n | awk {'print $1'})  &&  echo "$(date +'%A | %H:%M') | $task | vim | $note $@" >>  $daily_log  &&  echo "$(date +'%Y-%m-%d--%H-%M') | $line_note | $@" >> $note_log }
function v(){vim_note $@  && vim -O $@}
function git_commit_note() { git commit -m $1 && git log -1 --format="$(date +'%Y-%m-%d--%H-%M') | $task | git |  %h  %s" >> $note  &&  git log -1 --format="$(date +'%A | %H:%M') | $task | git |  %h  %s" >> $daily_log  &&  vim $note }
function daily() { arg=$(echo " $(pwd) $@" |sed 's/.Users.TP1.Sites.notes.local.//g'  | sed 's/.Users.TP1/\~/g'); echo "$(date +'%A | %H:%M') | $task | daily note | $arg" >>  $daily_log  &&  vim -O $daily $daily_log $note  $1 }
alias gdno="git diff |grep \"^+\|^- \|++\" | tee -a $note"
function gac { git add -A :/;git_commit_note " $task $1 " }
alias cn="cat $note" 
alias cng="cat $note |grep -n"
alias tn="tail $note"
alias ta="tee -a $note"
alias vng="vn $(g ls-files -m)"
alias n="vim $note"
alias vno="vim $note -O"
alias gcm="git_commit_note $1"
function add_variable(){ echo "export $1=\"$2\" # $task " |tee -a $var }
#function add_project_alias(){ if [ `alias | grep $1 | wc -l` == 0 ] ; then echo "alias $1='$2' " >> $var ; fi }
#alias apa="add_project_alias"
alias av="add_variable"
function add_alias(){ echo "alias $1=\"$2\" # $task" |tee -a $var }
alias aa="add_alias"
alias cv="cat $var"
alias vv="vim -O $var $note "
alias vg="cat $var |grep"
alias vgt="grep $task $var"
alias sv="source_var"
function source_var(){ dir=$(basename $PWD) ; project_directory="$HOME/Sites/notes.local/projects/$dir"; var=$project_directory/var.sh; source $var  && source ~/alias/note.sh source && ~/alias/mysql.sh  }
function file_map(){ find * -mindepth 1 -maxdepth 2 -name "*.md" | awk 'function folder(file) { n = split(file, a, "/") return a[1] } function basename(file) { sub(".*/", "", file) return file } {printf "[ %s | %s ]( %s ) \n", basename($1), folder($1), $1 }' } 
alias fm="file_map"
function folder_map(){ ls -d1 */ | awk '{printf "  * [ %s ]( %sreadme.md ) \n", $1, $1 }' }
alias fom="folder_map"
alias gn="vim /Users/TP1/notes/git.md"
alias mn="vim /Users/TP1/notes/mysql.md"
alias nn="vim /Users/TP1/notes/note.md"
alias vvn="vim /Users/TP1/notes/vim.md"
alias pmn="vim /Users/TP1/notes/package_manager.md"
alias nt=$HOME/scripts/newtask.sh
export sc="$HOME/scripts"
