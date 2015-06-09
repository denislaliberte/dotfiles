function up(){
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
  builtin cd "$*" && pwd;ls 
}


function lsgrep()
{
  ls | grep "$*"
}




function shellaliasgrep()
{
  grep -r "$*" ~/hc/alias
}


function frequent_used_command_grep(){
  history| grep $1 |awk '{print $3}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -30
}

function command_not_found_handler() {
  echo "$1 $2" >> ~/.command_not_found;
  echo "$1 >> ~/.command_not_found";
}

function frequent_used_command(){
  history |awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c|sort -rn|head -50
}
