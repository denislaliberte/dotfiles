# memo

# em -> Edit Memo
# em memo -> Edit Memo ~/memo/memeo.md
function em(){
  mkdir -p "$HOME/memo/$(date +%V)/$1"
  rmdir "$HOME/memo/$(date +%V)/$1"
  ${2:-vim} "$HOME/memo/$(date +%V)/${1:-s/week}.md"
}

# emd -> Edit memo daily notes
function emd() {
  em "s/$(date +%d)" ${1:-vim}
}

# es -> Edit Shop memo
# es test -> Edit Shop Memo and test file
function es(){
  mkdir -p "$HOME/memo/$(date +%V)/"
  ${2:-vim} -O "$HOME/memo/$(date +%V)/shop.md" "$HOME/memo/$(date +%V)/${1:-readme}.md"
}

# lm -> List Memo
# lm 30 -> List Memo week 30
function lm(){
  tree "$HOME/memo/${1:-$(date +%V)}"
}

# mlc -> Memo: List Comand in memo test
function mlc() {
  grep -n '\$' "$HOME/memo/$(date +%V)/${1:-readme}.md"  | grep ${2:-.} | grep '\$'
}

# mec test 12 -> Memo: Execute Command at Line 12 of memo test
function mec () {
  command=$(sed "$2!d" "$HOME/memo/$(date +%V)/${1:-readme}.md" | sed -n -e 's/^.*\$//p')
  echo $command
  eval $command
}


