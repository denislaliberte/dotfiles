function search_google() { echo "\n  __search_google:__ $1" >> $n && open "https://www.google.com/search?q=$1"}
alias sg="search_google"
alias en="echo $n && echo $1 >> $n"
alias qn="echo $n && echo "\n__question:__ $1" >> $n" # question note
alias rn="echo $n && echo "\n__réponse:__ $1" >> $n" #  réponse note
alias tdn="echo $n && echo "\n__todo:__ $1" >> $n" # todo note
alias fn="echo $n && echo "\n__file:__ $1" >> $n" # todo file
alias qg="cat $n |grep -n '__question:__\|__réponse:__'" # note question réponse grep
alias tg="cat $n |grep -n '__todo:__\|__done__'" # note todo grep
alias ngg="cat $n |grep -n '__search_google:__\|]('" # note google grep
alias lig="cat $n |grep -n ']('" #note link grep
function git_commit_note() { git commit -m $1 && echo " \n  __git_commit:__ $1" >> $n}
alias gAc="git add -A :/;git_commit_note $1"
alias cn="cat $n" # cat note
alias cng="cat $n |grep -n"
alias tn="tail $n" #tail note
alias vn="vim $n" # vim note
alias vno="vim $n -O" #vim note open
alias gcm="git_commit_note $1"
function gcmn(){git commit -m $1 && en $1 }
function gAmn(){ git add -A :/ && git commit -m $1 && en "__git_commit:__ -m $1" }

