# t* -> todo

alias todo='deprecated tl'
# tl -> return Todo and question from $note Last in first out 
# tl 10 -> return 10 Todo and question from $note Last in first out
# tl 10 ~/memo/* -> return Todo and question from ~/memo Last in first out
alias tl=todo.last
function todo.last(){
  todo=${2:-$note}
  echo 'next task count:'
  grep -n 'LATER' $todo | grep 'LATER\|NEXT\|>>' | wc -l
  grep -n '\[ \]' $todo \
    | grep -v 'LATER\|NEXT' \
    | grep '\[ \]' \
    | tail "-${1:-3}"
}

# tf -> return Todo and question First in first out from $note
# tf 10 -> return 10 Todo and question  First in first out from $note
# tf 10 ~/memo/* -> return Todo and question First in first out from ~/memo
function tf(){
  todo=${2:-$note}
  grep -n '\[ \]' $todo \
    | grep -v 'LATER\|NEXT' \
    | grep '\[ \]' \
    | head "-${1:-16}"
  echo 'next task count:'
  grep -n 'LATER' $todo | grep 'LATER\|NEXT\|>>' | wc -l
}

# t a thing to do -> Todo : Add '- [ ] a thing to do' to Note
alias t=todo.add
function todo.add(){
  ta $note $*
}

# tp path/to/file.rb 13 -> Todo add Path '- [ ] { path: path/to/file.rb, line: 13 }'
alias tp=todo.add.path
function todo.add.path() {
  if [ "$2x" = "x" ]; then
    line=1
  else
    line=$2
  fi
  ta $note "--- { path: $1, line: $line }"
}

# ta ~/note.md this is a note -> Todo: Add '- [ ] this is a note' to ~/note.md 
function ta() {
  echo $1
  echo "- [ ]  ${@:2}" | tee -a  $1
  todo.last
}

# lc -> take the Last Command from history and put it to the note file
function lc(){
  echo $note
  history | tail -1 | pyp '"- $" p' | tee -a  $note
}

# tan -> Test All Note
function tan() {
  dev test --include-branch-commits |  pyp "p.replace('Rerun: ', '- [ ] $ ').replace(': ', ' ')" | tee .ignore/test.txt
  en .ignore/test.txt
}
