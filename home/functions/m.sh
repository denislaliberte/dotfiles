# memo
export mq="$HOME/memo/Q$(ruby -e 'puts ((Time.now.month - 1) / 3) + 1')"

# em -> Edit Memo
# em memo -> Edit Memo ~/memo/memeo.md
function em(){
  ${2:-vim} "$mq/${1:-s/readme}.md"
  wc -l $mq/*.md | sort -r | pyp 's[0] + s[5]' | less
}

# lm -> List Memo
function lm(){
  wc -l $mq/*.md | sort -r | pyp 's[0] + s[5]' | less
  grep '##' $mq/*.md | pyp 's[5]' | less
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

function morning() {
  mkdir -p $d
  cp -n ~/template/morning.md $d/braindump.md
  vim $d/braindump.md
}
