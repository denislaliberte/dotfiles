function search_google() { echo "\n  __search_google:__ $1" >> $n && gisele $1 >> $n  && tail -10 $n}
function search_google_lucky() { echo "\n  __search_google:__ $1" >> $n && open "https://www.google.com/search?q=$1\&btnI"}
function open_firefox() { echo "\n  __open__ http://$1" >> $n && open -a firefox "http://$1" }
function search_google_log() {
  echo "~/search/$1.txt $2" >> $n
  echo $2 | sed  s/\ /\|/g | egrep -f /dev/stdin  ~/search/$1.txt >> $n
  echo $2 >> ~/search/$1.txt
}
function vim_search() { vim -O $n ~/search/$1.txt }
alias vs="vim_search"
alias gisele="php ~/scripts/gisele.phar -n --max-result=3 --format={counter}\ \[\ {title}\ \]\({link}\) web"
function search_google_php() {search_google_log "php" $1  && search_google "$1  site:http://php.net " && search_google "php $1 site:http://stackoverflow.com" }
alias sgp="search_google_php"
function search_google_js() {search_google_log "js" $1 && search_google "js $1 site:https://developer.mozilla.org " && search_google "js $1 site:http://stackoverflow.com" }
alias sgj="search_google_js"
function search_google_wp() {search_google_log "wp" $1 && search_google "wordpress $1" && search_google "wordpress $1 site:stackexchange.com" }
alias sgw="search_google_wp"
function sgd() {search_google_log "drupal" $1 }
alias sgjq="search_google_log jquery"
alias sgl="search_google_log log"
alias of="open_firefox"
alias sg="search_google"
alias sgl="search_google_lucky"
alias en="echo $n && echo $1 >> $n"
alias qn="echo $n && echo \"\n__question__ : $1\" >> $n" # question note
alias rn="echo $n && echo \"\n__réponse__ : $1\" >> $n" #  réponse note
alias tdn="echo $n && echo \"\n__todo__ : $1\" >> $n" #  réponse note
alias fn="echo $n && echo \"\n__file__ : $1\" >> $n" # todo file
alias qg="cat $n |grep -n '__question__\|__réponse__'" # note question réponse grep
alias tg="cat $n |grep -n '__todo__\|__done__\|__git_commit__\|---'" # note todo grep
alias ngg="cat $n |grep -n '__search_google__\|]('" # note google grep
alias nga="cat $n |grep -n '^__\|---'" #note grep action
alias lig="cat $n |grep -n ']('" #note link grep
function git_commit_note() { git commit -m $1 && echo " \n__git_commit__ : $1 " >> $n}
function gac { git add -A :/;git_commit_note " $task $1 " }
alias cn="cat $n" # cat note
alias cng="cat $n |grep -n"
alias tn="tail $n" #tail note
alias vn="vim $n -O" # vim note
alias n="vim $n" # vim note
alias vno="vim $n -O" #vim note open
alias gcm="git_commit_note $1"
alias av="echo \"export $1\=$2 \" >> $var" #add variable
alias cv="cat ../var.sh"
alias vv="vim $var"
alias cvg="cat $var |grep"
alias sv="source ../var.sh && source ~/.zshrc"
alias vv="vim ../var.sh"

function gcmn(){git commit -m $1 && en $1 }
function gAmn(){ git add -A :/ && git commit -m $1 && en "__git_commit__ : -m $1" }

function file_map(){
find * -mindepth 1 -maxdepth 2 -name "*.md" | awk 'function folder(file) {
n = split(file, a, "/")
return a[1] }
function basename(file) {
sub(".*/", "", file)
return file }
{printf "[ %s | %s ]( %s ) \n", basename($1), folder($1), $1 }'
}
alias fm="file_map"
function folder_map(){ls -d1 */ | awk '{printf "  * [ %s ]( %sreadme.md ) \n", $1, $1 }'}
alias fom="folder_map"
