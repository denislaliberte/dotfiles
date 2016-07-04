hunction up(){
    pwd;
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1/*}/$1
    fi
    cd "$dir";
    pwd;
}

ss() {
    if [[ $# == 0 ]]; then
       sudo $(history -p '!!')
    else
      sudo "$@"
    fi
}

function mc() {
        if [ $# != 1 ]; then
                echo "Usage: mc <dir>"
        else
                mkdir -p $1 && cd $1
        fi
}

function cl(){
        last_dir="$(ls -Frt | grep '/$' | tail -n1)"
        if [ -d "$last_dir" ]; then
                cd "$last_dir"
        fi
}

function cd()
{
  builtin cd "$*" && clear && pwd && ls -1A
}

function lsgrep()
{
  ls $2 | grep "$1"
}

function shellaliasgrep()
{
  grep -ni "$*" ~/alias/*
}

function history_grep()
{
  fc -l 1 | grep --color=auto --exclude-dir={.bzr,.cvs,.git,.hg,.svn} $*
}

function frequent_used_command_grep(){
history| grep $1 |awk '{print $3}' | awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -30
}

function command_not_found_handler() {
  echo "$1 >> ~/.command_not_found && grep -c $1 ~/.command_not_found";
  grep -c $1 ~/.command_not_found
  echo "$*" >> ~/.command_not_found;
}

function frequent_used_command(){
  history |awk '{print $2}'| pyp "len(p) > 2" | awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -100 | pyp "int(w[0]) > 30"
}

function vim_alias(){
  vim ~/alias/$1.sh
}

function vim_hc(){
  vim ~/$1.sh
}

function srdb(){
   ~/script/srdbcli.php -h "127.0.0.1" -u root -p "" -n $1 -s "$2" -r "$3"
}
