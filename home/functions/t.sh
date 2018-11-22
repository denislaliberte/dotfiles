# todo

alias todo='deprecated tl'
# tl -> return Todo and question from $note Last in first out 
# tl 10 -> return 10 Todo and question from $note Last in first out
# tl 10 ~/memo/* -> return Todo and question from ~/memo Last in first out
function tl(){
  todo=${2:-$note}
  grep -n 'LATER' $todo | tail "-${1:-2}" | grep 'LATER\|NEXT'
  grep -n '^# ' $todo | grep -v LATER | tail -n 1
  grep -n '^## ' $todo |  grep -v LATER | tail -n 1
  grep -n '^### ' $todo |  grep -v LATER | tail -n 1
  grep -n '^#### ' $todo |  grep -v LATER | tail -n 1
  grep -n '^##### ' $todo |  grep -v LATER | tail -n 1
  grep -n 'NEXT' $todo | tail "-${1:-2}" | grep 'LATER\|NEXT'
  grep -n '\- Q.*A.$\|\[ \]' $todo \
    | grep -v 'LATER\|NEXT' \
    | grep '\- Q.*A.$\|\[ \]' \
    | tail "-${1:-3}"
}

# tf -> return Todo and question First in first out from $note
# tf 10 -> return 10 Todo and question  First in first out from $note
# tf 10 ~/memo/* -> return Todo and question First in first out from ~/memo
function tf(){
  todo=${2:-$note}
  grep -n '^# ' $todo | grep -v LATER | head -n 1
  grep -n '^## ' $todo |  grep -v LATER | head -n 1
  grep -n '^### ' $todo |  grep -v LATER | head -n 1
  grep -n '^#### ' $todo |  grep -v LATER | head -n 1
  grep -n '^##### ' $todo |  grep -v LATER | head -n 1
  grep -n '\[ \]' $todo \
    | grep -v 'LATER\|NEXT' \
    | grep '\[ \]' \
    | head "-${1:-3}"
  echo 'next task count:'
  grep -n 'LATER' $todo | tail "-${1:-2}" | grep 'LATER\|NEXT\|>>' | wc -l
}

alias tdn='t'
# t a thing to do -> Todo : Add '- [ ] a thing to do' to Note
function t(){
  ta $note $*
}

# tac command -> Todo: add command to note
function tac(){ echo $note ; echo "- [ ] check \$ $*" | tee -a  $note }



# tam test a thing to do -> Todo : Add '- [ ] a thing to do' to ~/memo/test.md
function tam(){
  ta $HOME/memo/$1.md ${@:2}
}

# ta ~/note.md this is a note -> Todo: Add '- [ ] this is a note' to ~/note.md 
function ta() {
  echo $1
  echo "- [ ]  ${@:2}" | tee -a  $1
}

alias vtd="deprecated te"
alias vt="deprecated te"
alias te=et
# te 1 -> edit todo at line 1 in note file
function et(){
  vim +$1 $note
}


alias qn='deprecated qan'
# qan  is this a question -> Question: Add '- Q. is this is a question ? A.' to Note
function qan(){
  qa $note $*
}

# qa ~/note.md is this a question -> Question: Add '- Q. is this is a question ? A.' to ~/note.md 
function qa(){
  echo $1
  echo "- Q. ${@:2} ? | A." | tee -a  $1
}

# tm -> return todo and question from ~/memo
function tm() { t ~/memo/* }

# lc -> take the Last Command from history and put it to the note file
function lc(){
  echo $note
  history | tail -1 | pyp '"- $" p' | tee -a  $note
}

# tan -> Test All Note
function tan() {
  breathe
  dev test --include-branch-commits |  pyp "p.replace('Rerun: ', '- [ ] $ ').replace(': ', ' ')" | tee .ignore/test.txt
  en .ignore/test.txt
}

