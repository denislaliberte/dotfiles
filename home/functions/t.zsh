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

# tp path/to/file.rb 13 -> Todo add Path '- [ ] { path: path/to/file.rb, line: 13 }'
alias tp=todo.add.path
function todo.add.path() {
  if [ "$2x" = "x" ]; then
    line=1
  else
    line=$2
  fi
  echo "  * [ ] --- { path: $1, line: $line }" | tee -a $note
  todo.last
}

# tc dev test -> Todo add cmd '- [ ] --- { cmd: "dev test" }'
alias tc=todo.add.cmd
function todo.add.cmd() {
  echo "todo.add.cmd $@"
  echo "  * [ ] --- { cmd: \"$@\" }" | tee -a $note
  todo.last
}

# ta ~/note.md this is a note -> Todo: Add '- [ ] this is a note' to ~/note.md 
alias ta=todo.add
function todo.add() {
  echo "todo.add ${@:1} | $note"
  echo "- [ ]  ${@:1}" | tee -a  $note
  todo.last
}

# lc -> take the Last Command from history and put it to the note file
function lc(){
  echo $note
  history | tail -1 | pyp '"- $" p' | tee -a  $note
}

# tan -> Test All Note
function tan() {
  dev test --include-branch-commits | tee .ignore/test.txt
  cat .ignore/test.txt | pyp 'len(c) >= 3 | c[1].isdigit()| "* [ ] --- { path: %s, line: %s }" %(c[0], c[1]) | p.replace("\#", "#") | pp.sort() | p' | tee -a .ignore/test.txt
  cat .ignore/test.txt | pyp "'Rerun' in p | p.split('dev test')[1].split('--seed')[0]| '* [ ] --- { cmd: \"dev test %s\" }' % p" | tee -a .ignore/test.txt
  vim $note -O .ignore/test.txt
}

