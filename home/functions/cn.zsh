# cn* -> Command Note

# xcn 105 -> eXecute Command at line 105 in the Note log
function xcn(){
  command=$(get.data.line $1 cmd)
  echo $command
  eval $command | tee .ignore/cmd.txt
  cat .ignore/cmd.txt | pyp 'len(c) >= 3 | c[1].isdigit()  | "  * [ ] --- { path: %s, line: %s }" %(c[0], c[1]) | pp.sort() | p' | tee -a .ignore/cmd.txt
  cat .ignore/cmd.txt | pyp "'Rerun' in p | p.split('dev test')[1].split('--seed')[0]| '  * [ ] --- { cmd: \"dev test %s\" }' % p" | tee -a .ignore/cmd.txt
  vim .ignore/cmd.txt +"vsp +$1 $note"
}

# scn -> Show  all Command in Note log
# scn test -> Show all Command that match /test/ in Note log
alias scn=show.command.note
function show.command.note() {
  grep -n '\[ \].* cmd: ' $note | grep ${1:-.} | grep -v LATER| grep 'cmd:'
}

# tcn 105 -> execute Test Command at line 105 in the Note log
alias tcn=test.command.note
function test.command.note(){
  command="$(get.data.line $1 cmd) --no-color" 
  echo $command
  eval $command | tee .ignore/test.txt
  cat .ignore/test.txt | pyp '"  * [ ] %s --- { path: %s, line: %s }" %(c[2],c[0], c[1])' | tee -a  .ignore/test.txt
  vim .ignore/test.txt +"sp +$1 $note"
}
