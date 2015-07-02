function search_google() { echo "\n  __search_google:__ $1" >> $n && gisele $1 >> $n }
function search_google_lucky() { echo "\n  __search_google:__ $1" >> $n && open "https://www.google.com/search?q=$1\&btnI"}
function open_firefox() { echo "\n  __open__ http://$1" >> $n && open -a firefox "http://$1" }
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
function git_commit_note() { git commit -m $1 && echo " \n__git_commit__ : $1" >> $n}
alias gAc="git add -A :/;git_commit_note $1"
alias cn="cat $n" # cat note
alias cng="cat $n |grep -n"
alias tn="tail $n" #tail note
alias vn="vim $n -O" # vim note
alias n="vim $n" # vim note
alias vno="vim $n -O" #vim note open
alias gcm="git_commit_note $1"
alias av="echo \"export $1\=$2 \" >> $var" #add variable
alias cv="cat $var"
alias vv="vim $var"
alias cvg="cat $var |grep"
alias sv="source ../__shelf/var.sh && source ~/.zshrc"
alias vv="vim ../__shelf/var.sh"

function gcmn(){git commit -m $1 && en $1 }
function gAmn(){ git add -A :/ && git commit -m $1 && en "__git_commit__ : -m $1" }

