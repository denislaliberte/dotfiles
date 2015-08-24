#!/bin/bash

if [ "x$1" == "x" ] || [ "x$2" == "x" ]; then
        echo "Usage: ${0} task description"
        exit 0
fi

date_start=$(date +%Y-%m-%d)
month=$(date +%m)
task=$1
description=$2
task_name=$task-$(echo $description | sed 's/ /-/g')
shelf="$project_directory/$month"
task_shelf="$project_directory/$month/$date_start--$task"
branche="features/$task_name"
project_directory="$(pwd)/.."
note="$project_directory/$month/$date_start--$task_name.md"
task_url=https://touspourun.atlassian.net/browse/$task


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
export s=$task_shelf
export n=$note
export task_url=$task_url
export tu=$task_url
" >> ../var.sh

if [ ! -d $shelf ]; then
  echo "create directory $shelf"
  mkdir $shelf 
fi

if [ ! -f $shelf ]; then
echo "create project template "
echo "# $task $description $date_start

[ url jira ]($task_url)
shelf : $task_shelf

## 1 analyse

### 1.0 estimation

  tache              | optimiste | pessimiste | rééel | différence
  ------------------:|----------:|-----------:|------:|----------
  analyse            |           |            |       |
  développement      |           |            |       |
  déploiement        |           |            |       |
  total              |           |            |       |

### 1.1 Description jira

### 1.2 Email / IM / autres communication

### 1.3 Captures d'écran / vidéo / étape de reproduction

### 1.4 html / fichier

### 1.5 information git


## X
__question__ X
__todo__ X


## X finalisation

git rebase
resume doc
deploy


#### push lines ####

  " > $note
fi

echo "create tash shelf $task_shelf"
if [ ! -d $task_shelf ]; then 
  mkdir $task_shelf 
fi

echo "git checkout on $branche"

git checkout $main_branch && git checkout -b $branche

source ../var.sh
source ~/alias/mysql.sh
source ~/alias/note.sh
