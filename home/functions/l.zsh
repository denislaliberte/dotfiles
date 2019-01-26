# logbook
export lb=$HOME/gdrive_denis_laliberte_gmail_com/logbook
export y=$lb/$(date +%Y)
export quarter=$(ruby -e 'puts ((Time.now.month - 1) / 3) + 1')
export q="$y/quarters/$quarter"
export aq="$q/automatic"
export w=$q/weeks/$(date +%W)
export aw=$q/automatic/weeks/$(date +%W)
export d=$w/$(date +%d)
export n=$w/readme.md
export r=$w/review
export note=$w/readme.md

# el -> Edit logbook
# el logbook -> Edit logbook 
function el(){
  mkdir -p "$w/$1"
  rmdir "$w/$1"
  ${2:-vim} "$w/${1:-readme}.md"
}

# eld -> Edit Logbook Daily notes
function eld() {
  mkdir -p $w
  vim -O $w/readme.md
}

# daily "This is today priority" -> call the Daily script with the priority add it to the week readme
function daily() {
  dev cd shopify
  day=$(date +%A)
  day_path=.ignore/$day.md
  echo "- [ ] $(date +%H%M) Schedule shutdown to: $(date -v+8H +%H%M)" | tee -a $day_path
  git fetch origin master
  git branch --no-merged origin/master | pyp 'p.replace("*", " ")|"- [ ] --- branch:" +p' | tee -a $day_path
  $HOME/scripts/daily.rb $@ | tee -a $day_path
  sed -i bk "/$day/r $day_path" $w/readme.md
  rm $day_path
  vim $w/readme.md -O $q/readme.md
}

# weekly "this is the week priority" -> call the Weekly script
function weekly() {
  mkdir -p $w
  $HOME/scripts/weekly.rb $@ | tee -a $w/readme.md
}

# lw -> List LogBook
# lw 30 -> List LogBook week 30
function lw(){
  tree "$q/w${1:-$(date +%W)}"
}

# llc -> Logbook: List Comand in logbook test
function llc() {
  grep -n '\$' "$w/${1:-readme}.md"  | grep ${2:-.} | grep '\$'
}

# lec test 12 -> Logbook: Execute Command at Line 12 of logbook test
function lec () {
  command=$(sed "$2!d" "$w/${1:-readme}.md" | sed -n -e 's/^.*\$//p')
  echo $command
  eval $command
}


