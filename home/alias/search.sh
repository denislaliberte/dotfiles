function search_google() { echo "\n  __search_google:__ $1" |tee -a $n && gisele $1 | tee -a $n }
function search_google_lucky() { echo "\n  __search_google:__ $1" |tee -a $n && open "https://www.google.com/search?q=$1\&btnI"}
function search_google_log() { echo "~/search/$1.txt $2" |tee -a $n && echo $2 | sed  s/\ /\|/g | egrep -f /dev/stdin  ~/search/$1.txt | tee -a $n && echo $2 | tee -a ~/search/$1.txt }
function search_google_php() {search_google_log "php" $1  && search_google "$1  site:http://php.net " && search_google "php $1 site:http://stackoverflow.com" && vim_search php }
function vim_search() { vim -O $n ~/search/$1.csv }
alias vs="vim_search"
alias gisele="php ~/scripts/gisele.phar -n --max-result=3 --format={counter}\ \[\ {title}\ \]\({link}\) web"
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
alias sg="search_google"
alias sgl="search_google_lucky"
