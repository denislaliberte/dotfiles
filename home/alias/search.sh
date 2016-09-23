export notes_folder=$HOME/Sites/notes.local/
function search_google(){ php ~/scripts/gisele.phar -n --max-result=7 --format={link}\ \|\ {title} web " $* " | sed -e "s/^/__google_search__ | $* | ** /g" | tee -a $n }
alias sg="search_google"
function search_google_log() { echo "$notes_folder/tech/$1.md $@" |tee -a $n && echo "${@:2}" | sed  s/\ /\|/g | egrep -f /dev/stdin  $notes_folder/tech/$1.md | tee -a $n && echo $@ | tee -a $notes_folder/tech/$1.md }
function search_google_php() {search_google_log "php" $@  && search_google "$@  site:http://php.net " && search_google "$@ site:http://stackoverflow.com" && search_google $@ && vim_search php }
function vim_search() { vim -O $n $notes_folder/tech/$1.md }
alias vs="vim_search"
alias sgp="search_google_php"
function search_google_js() {search_google_log "js" $1 && search_google "js $1 site:https://developer.mozilla.org " && search_google "js $1 site:http://stackoverflow.com" && search_google "javascript $1" && vim_search js }
alias sgj="search_google_js"
function search_google_git() {search_google_log "git" $1 && search_google "git $1" && search_google "git $1 site:stackoverflow.com" && vim_search git }
alias sgg="search_google_git"
function search_google_jquery() { search_google_log jquery $1 && search_google " $1 site:https://jquery.com/" && search_google " jquery $1" && search_google "jquery $1 site:http://stackoverflow.com" && vim_search jquery }
alias sgjq="search_google_jquery"
function search_google_mysql() { search_google_log mysql $1 && search_google " $1 site:http://dev.mysql.com/" && search_google " mysql $1" && search_google "mysql $1 site:http://stackoverflow.com/" && vim_search mysql }
alias sgm="search_google_mysql"
function sgl(){ search_google_log $@ && search_google $@ &&  vim_search $1 }
alias glucky="search_google_lucky"
