#!/bin/zsh

if [ "x$1" = "x" ]; then
  echo "Usage: ${0} task"
  exit 0
fi

source $HOME/alias/note.sh

function git_root() { basename $(git rev-parse --show-toplevel); }

function project_directory() { echo "$note_workspace/$(git_root)"; }

project_directory="$(project_directory)"

var=$project_directory/var.sh
if [ ! -f $var ]; then
  echo "no var file found $var be sure you are in a projet directory and the parent contain a var file"
  exit 0
fi

source $project_directory/var.sh

date_start=$(date +%Y-%m-%d)
month=$(date +%m)
year=$(date +%Y)
description="$@"
task_name=$(echo $description | sed 's/ /-/g')
shelf="$project_directory/$year/$month/"
task_shelf="$project_directory/$year/$month/$date_start--$task_name"
branche="pricing/$task_name"
note="$project_directory/$year/$month/$date_start--$task_name.md"

if [ -f $note ]; then
  echo "note file already exist : $note"
  exit 0
fi

echo "Create task variables $task_name"
echo "
### $description
export task_name=$task_name
export branche=$branche
export shelf=$shelf
export task_shelf=$task_shelf
export note=$note
export n=$note
" >> $var

if [ ! -d $shelf ]; then
  echo "create directory $shelf"
  mkdir -p $shelf 
fi

if [ ! -f $note ]; then
echo "create project template "
echo "[pricing] $description" > $note
cat $HOME/.gitmessage >> $note
fi

echo "create tash shelf $task_shelf"
if [ ! -d $task_shelf ]; then 
  mkdir $task_shelf 
fi

echo "git checkout on $branche"

git checkout $main_branch && git checkout -b $branche

source $var
source ~/alias/note.sh

vim $note
git stash
git commit --allow-empty
