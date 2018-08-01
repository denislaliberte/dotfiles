# memo

# em -> Edit Memo
# em memo -> Edit Memo ~/memo/memeo.md
function em(){
  mkdir -p "$HOME/memo/$(date +%Y/%m)/"
  ${2:-vim} "$HOME/memo/$(date +%Y/%m)/${1:-readme}.md"
}

# lm -> List Memo
function lm(){
  ls "$HOME/memo/$(date +%Y/%m)/"
}

# mlc -> Memo: List Comand in memo test
function mlc() {
  grep -n '\$' "$HOME/memo/$(date +%Y/%m)/${1:-readme}.md"  | grep ${2:-.} | grep '\$'
}

# mec test 12 -> Memo: Execute Command at Line 12 of memo test
function mec () {
  command=$(sed "$2!d" "$HOME/memo/$(date +%Y/%m)/${1:-readme}.md" | sed -n -e 's/^.*\$//p')
  echo $command
  eval $command
}


