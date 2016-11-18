#!/bin/bash
source $HOME/note.sh

function project_directory() { echo "$note_workspace/$(git_root)"; }

project_directory="$(project_directory)"

if [ "x$1" == "x" ] || [ "x$2" == "x" ]; then
  echo "Usage: ${0} task description"
  exit 0
fi

var=$project_directory/var.sh
if [ ! -f $var ]; then
  echo "no var file found $var be sure you are in a projet directory and the parent contain a var file"
  exit 0
fi

source $project_directory/var.sh

date_start=$(date +%Y-%m-%d)
month=$(date +%m)
year=$(date +%Y)
task=$1
description=$2
task_name=$task-$(echo $description | sed 's/ /-/g')
shelf="$project_directory/$year/$month/"
task_shelf="$project_directory/$year/$month/$date_start--$task"
branche="new-$task_name"
note="$project_directory/$year/$month/$date_start--$task_name.md"

if [ -f $note ]; then
  echo "note file already exist : $note"
  exit 0
fi

echo "Create task variables $task $description"
echo "
### $task $description
export task=$task
export task_name=$task_name
export date_start=$date_start
export branche=$branche
export b=$branche
export month=$month
export shelf=$shelf
export task_shelf=$task_shelf
export note=$note
export note_log=$note_log
export s=$task_shelf
export r=$task_shelf/resume.md
export n=$note
" >> $var

if [ ! -d $shelf ]; then
  echo "create directory $shelf"
  mkdir -p $shelf 
fi

if [ ! -f $note ]; then
echo "create project template "
echo "# $task $description $date_start

<!-- shelf : $task_shelf -->


  " > $note
fi

echo "create tash shelf $task_shelf"
if [ ! -d $task_shelf ]; then 
  mkdir $task_shelf 
fi

echo "git checkout on $branche"

git checkout $main_branch && git checkout -b $branche

source $var
source ~/note.sh
