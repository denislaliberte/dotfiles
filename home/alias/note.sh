echo "note : $note var : $var"
function search_google() { echo "\n  __search_google:__ $1" >> $n && gisele $1 >> $n }
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
function search_google_php() {search_google_log "php" $1  && search_google "$1  site:http://php.net " && search_google "php $1 site:http://stackoverflow.com" && vim_search php }
alias sgp="search_google_php"
function search_google_js() {search_google_log "js" $1 && search_google "js $1 site:https://developer.mozilla.org " && search_google "js $1 site:http://stackoverflow.com" && search_google "javascript $1" && vim_search js }
alias sgj="search_google_js"
function search_google_wp() {search_google_log "wp" $1 && search_google "wordpress $1" && search_google "wordpress $1 site:stackexchange.com" && vim_search wp }
alias sgw="search_google_wp"
function search_google_git() {search_google_log "git" $1 && search_google "git $1" && search_google "git $1 site:stackoverflow.com" && vim_search git }
alias sgg="search_google_git"
alias sgd="search_google_drupal"
function search_google_jquery() { search_google_log jquery $1 && search_google " $1 site:https://jquery.com/" && search_google " jquery $1" && search_google "jquery $1 site:http://stackoverflow.com" && vim_search jquery }
function search_google_drupal() { search_google_log drupal $1 && search_google " $1 site:https://drupal.org/" && search_google " drupal $1" && search_google "drupal $1 site:http://http://drupal.stackexchange.com/" && vim_search drupal }
alias sgjq="search_google_jquery"
alias sgl="search_google_log log"
alias of="open_firefox"
alias sg="search_google"
alias sgl="search_google_lucky"
alias en="echo $note && echo $1 >> $note"
alias qn="echo $note && echo \"\n__question__ : $1\" >> $note"
alias rn="echo $note && echo \"\n__réponse__ : $1\" >> $note"
alias tdn="echo $note && echo \"\n__todo__ : $1\" >> $note"
alias fn="echo $note && echo \"\n__file__ : $1\" >> $note"
alias qg="cat $note |grep -n '__question__\|__réponse__'"
alias tg="cat $note |grep -n '__todo__\|__done__\|__git_commit__\|---'" 
alias ngg="cat $note |grep -n '__search_google__\|]('"
alias nga="cat $note |grep -n '^__\|---'" 
alias lig="cat $note |grep -n ']('" 
function git_commit_note() { 
  git commit -m $1;
  git show HEAD --name-only | grep -v "^Date\|^Author\|^$" >> $note;
  vim $note
}
alias gdno="git diff |grep \"^+\|^- \|++\" >> $note && vim $note"
function gac { git add -A :/;git_commit_note " $task $1 " }
alias cn="cat $note" 
alias cng="cat $note |grep -n"
alias tn="tail $note"
alias vn="vim $note -O"
alias n="vim $note"
alias vno="vim $note -O"
alias gcm="git_commit_note $1"
function add_variable(){ echo "export $1=$2 " >> $var }
#function add_project_alias(){ if [ `alias | grep $1 | wc -l` == 0 ] ; then echo "alias $1='$2' " >> $var ; fi }
#alias apa="add_project_alias"
alias av="add_variable"
alias cv="cat ../var.sh"
alias vv="vim $var"
alias vg="cat $var |grep"
alias sv="source ../var.sh && source ~/alias/note.sh source && ~/alias/mysql.sh"
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
alias gn="vim /Users/TP1/notes/git.md"
alias mn="vim /Users/TP1/notes/mysql.md"
alias nn="vim /Users/TP1/notes/note.md"
alias vvn="vim /Users/TP1/notes/vim.md"
alias pmn="vim /Users/TP1/notes/package_manager.md"
