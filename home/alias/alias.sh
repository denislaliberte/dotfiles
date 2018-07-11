
# ag git.commit -> return all alias that match the regex /git.commit/
alias ag=alias_grep
function alias_grep(){ grep  -ni "$*" ~/alias/* }

# va git -> edit ~/alias/git.sh file with vim
alias va=vim_alias
function vim_alias(){ vim ~/alias/$1.sh }

alias sz="source ~/.zshrc"

# wh va -> return the definition of a function
alias wh=which_definition
function which_definition(){ which $1; which $(which $1 |pyp wl) | pyp 'pp[1:-1]|p'}

function history_grep() { fc -l 1 | grep $* }
function h5() { history_grep $1 | tail -5 }
function h15() { history_grep $1 | tail -15 }
function h33() { history_grep $1 | tail -33 }

alias fucg="frequent_used_command_grep"
function frequent_used_command_grep(){history| grep $1 |awk '{print $3}' | awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -30 }

alias fuc="frequent_used_command | pyp 'int(w[0]) > 50 | len(w[1]) > 3'"
function frequent_used_command(){ history |awk '{print $2}'| pyp "len(p) > 2" | awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -100 | pyp "int(w[0]) > 30" }

alias fusc="frequent_used_sub_command | pyp 'int(w[0]) > 50 | len(w[1]) > 3'"
function frequent_used_sub_command(){ history | awk '{print $3}'| pyp "len(p) > 2" | awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -100 | pyp "int(w[0]) > 30" }
