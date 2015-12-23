echo "note : $note var : $var"
function open_firefox() { echo "\n  __open__ http://$1" |tee -a $n && open -a firefox "http://$1" }
alias of="open_firefox"
alias en="echo $note && echo $1 >> $note"
alias qn="echo $note && echo \"\n__question__ : $1\" | tee -a  $note"
alias rn="echo $note && echo \"\n__réponse__ : $1\" | tee -a  $note"
alias tdn="echo $note && echo \"\n__todo__ : $1\" | tee -a  $note"
alias fn="echo $note && echo \"\n__file__ : $1\" | tee -a  $note"
alias qg="cat $note |grep -n '__question__\|__réponse__'"
alias tg="cat $note |grep -n '__todo__\|__done__\|__git_commit__\|---'" 
alias ngg="cat $note |grep -n '__search_google__\|]('"
alias nga="cat $note |grep -n '^__\|---'" 
alias lig="cat $note |grep -n ']('" 
function git_commit_note() { git commit -m $1 && git log -1 --format='### git commit [ %h ] : %s  %ad' >> $note && date=$(date +%Y-week-%V ); year=$(date +%Y); month=$(date +%m);  git log -1 --format='### git commit [ %h ] : %s  %ad' >> /Users/TP1/Sites/notes.dl.tp1.ca/$year/$month/$date--daily.md  && vim $note }
alias gdno="git diff |grep \"^+\|^- \|++\" | tee -a $note"
function gac { git add -A :/;git_commit_note " $task $1 " }
alias cn="cat $note" 
alias cng="cat $note |grep -n"
alias tn="tail $note"
alias ta="tee -a $note"
alias vn=vim_note
function vim_note() { date=$(date +%Y-week-%V); month=$(date +%m); year=$(date +%Y);  hour=$(date +"%H:%M"); day=$(date +"%Y-%m-%d--%H-%M");  echo "$hour w| $task | $note  | $@" >> /Users/TP1/Sites/notes.dl.tp1.ca/$year/$month/$date--daily.md  && echo "$day $@" >> $note && vim $note -O $@ }
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
function source_var() {dir=$(basename $PWD); project_directory="$HOME/Sites/notes.dl.tp1.ca/project/$dir"; var=$project_directory/var.sh; source $var  && source ~/alias/note.sh source && ~/alias/mysql.sh  }
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
function daily() { date=$(date +%Y-week-%V); month=$(date +%m); year=$(date +%Y); daily=/Users/TP1/Sites/notes.dl.tp1.ca/$year/$month/$date--daily.md; hour=$(date +"%H:%M"); echo "$hour $(pwd) $1" >>  $daily &&  vim -O $daily $1 }
export sc=~/scripts
