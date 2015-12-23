#!/bin/bash

date=$(date +%Y-week-%V)
month=$(date +%m)
year=$(date +%Y)
shelf=/Users/TP1/Sites/notes.dl.tp1.ca/$year/$month
file=$shelf/$date--daily.md

if [ ! -d $shelf ]; then
  echo "create directory $shelf"
  mkdir -p $shelf 
fi

echo "


## daily $(date  +%Y-%m-%d--%A)

### todo

time     | tache
--------|----------------
événement |
email |
jira |
Autres taches |

### log

time  | temps | timetask | tache
------|-------|----------|------------------------
9:00  |       |          |

### timetask

#### file log

hour | task | note  | files

" >> $file
gcalcli  --calendar denis@tp1.ca agenda today | tee -a $file

#open 'https://www.rescuetime.com'
#open 'https://pomotodo.com/'
