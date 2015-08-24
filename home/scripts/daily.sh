#!/bin/bash

date=$(date +%Y-%m-%d)
month=$(date +%m)
shelf=/Users/TP1/Sites/$month
file=$shelf/$date--daily.md

if [ ! -d $shelf ]; then
  echo "create directory $shelf"
  mkdir $shelf 
fi

echo "# daily $date

## événement

## email

## yesterday

### pomotodo
### time rescue

## story

## Autres taches

## log

  time              | tache         |  temps
  -----------------|--------------|------
    |  |

" >> $file

open 'https://www.rescuetime.com'
open 'https://pomotodo.com/'
