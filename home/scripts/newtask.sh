#!/bin/bash
project_directory="$notes_folder/projects/$(basename $PWD)"

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
branche="features/$task_name"
note="$project_directory/$year/$month/$date_start--$task_name.md"
note_log="$project_directory/$year/$month/$date_start--$task_name-log.md"
task_url=https://touspourun.atlassian.net/browse/$task

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
export task_url=$task_url
export tu=$task_url
" >> $var

if [ ! -d $shelf ]; then
  echo "create directory $shelf"
  mkdir -p $shelf 
fi

if [ ! -f $note ]; then
echo "create project template "
echo "# $task $description $date_start

[ url jira ]($task_url)
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
source ~/alias/mysql.sh
source ~/alias/note.sh
