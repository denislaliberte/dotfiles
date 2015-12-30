export notes_folder=$HOME/Sites/notes.local/
function search_google() { echo "\n  __search_google:__ $@" |tee -a $n && gisele $@ | tee -a $n }
function search_google_lucky() { echo "\n  __search_google:__ $1" |tee -a $n && open "https://www.google.com/search?q=$1\&btnI"}
function search_google_log() { echo "$notes_folder/tech/$1.md $@" |tee -a $n && echo "${@:2}" | sed  s/\ /\|/g | egrep -f /dev/stdin  $notes_folder/tech/$1.md | tee -a $n && echo $@ | tee -a $notes_folder/tech/$1.md }
function search_google_php() {search_google_log "php" $@  && search_google "$@  site:http://php.net " && search_google "$@ site:http://stackoverflow.com" && search_google $@ && vim_search php }
function vim_search() { vim -O $n $notes_folder/tech/$1.md }
alias vs="vim_search"
alias gisele="php ~/scripts/gisele.phar -n --max-result=3 --format={counter}\ \[\ {title}\ \]\({link}\) web"
alias sgp="search_google_php"
function search_google_js() {search_google_log "js" $1 && search_google "js $1 site:https://developer.mozilla.org " && search_google "js $1 site:http://stackoverflow.com" && search_google "javascript $1" && vim_search js }
alias sgj="search_google_js"
function search_google_wp() {search_google_log "wp" $1 && search_google "wordpress $1" && search_google "wordpress $1 site:stackexchange.com" && vim_search wp }
alias sgw="search_google_wp"
function search_google_git() {search_google_log "git" $1 && search_google "git $1" && search_google "git $1 site:stackoverflow.com" && vim_search git }
alias sgg="search_google_git"
function search_google_jquery() { search_google_log jquery $1 && search_google " $1 site:https://jquery.com/" && search_google " jquery $1" && search_google "jquery $1 site:http://stackoverflow.com" && vim_search jquery }
alias sgjq="search_google_jquery"
function search_google_drupal() { search_google_log drupal $1 && search_google " $1 site:https://drupal.org/" && search_google " drupal $1" && search_google "drupal $1 site:http://drupal.stackexchange.com/" && vim_search drupal }
alias sgd="search_google_drupal"
function search_google_mysql() { search_google_log mysql $1 && search_google " $1 site:http://dev.mysql.com/" && search_google " mysql $1" && search_google "mysql $1 site:http://stackoverflow.com/" && vim_search mysql }
alias sgm="search_google_mysql"
function search_google_phpunit() { search_google_log phpunit $1 && search_google " $1 site:phpunit.de" && search_google " phpunit $1" && search_google "phpunit $1 site:stackoverflow.com" && vim_search phpunit }
alias sgpu="search_google_phpunit"
function sgl(){ search_google_log $1 && search_google $@ &&  vim_search $1 }
alias sg="search_google"
alias glucky="search_google_lucky"
