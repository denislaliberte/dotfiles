# todo

alias todo='deprecated t'
# t -> return todo and question from $note
# t ~/memo/* -> return todo and question from ~/memo
function t(){
  todo=${1:-$note}
  grep -n LATER $todo
  grep -n '\- Q.*A.$\|\[ \]' $todo \
    | grep -v LATER \
    | grep '\- Q.*A.$\|\[ \]'
}

alias tdn='tan'
# tan a thing to do -> Todo : Add '- [ ] a thing to do' to Note
function tan(){
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
# te 1 -> edit todo at line 1 in note file
function te(){
  vim +$1 $note
  t | tail -8
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
