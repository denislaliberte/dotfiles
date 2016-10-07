export notes_folder=$HOME/Sites/notes.local/
function search_google(){ php ~/scripts/gisele.phar -n --max-result=7 --format={link}\ \|\ {title} web " $* " | sed -e "s/^/__google_search__ | $* | ** /g" | tee -a $n }
#alias sg="search_google"
function search_google_log() { echo "$notes_folder/tech/$1.md $@" |tee -a $n && echo "${@:2}" | sed  s/\ /\|/g | egrep -f /dev/stdin  $notes_folder/tech/$1.md | tee -a $n && echo $@ | tee -a $notes_folder/tech/$1.md }
function vim_search() { vim -O $n $notes_folder/tech/$1.md }
alias vs="vim_search"
function sgl(){ search_google_log $@ && search_google $@ &&  vim_search $1 }
alias glucky="search_google_lucky"
