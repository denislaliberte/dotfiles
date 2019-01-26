# cn* -> Command Note

# xcn 105 -> eXecute Command at line 105 in the Note log
function xcn(){
  command=$(get.data.line $1 cmd)
  echo $command
  eval $command
}

# scn -> Show  all Command in Note log
# scn test -> Show all Command that match /test/ in Note log
alias scn=show.command.note
function show.command.note() {
  grep -n '\[ \].* cmd: ' $note | grep ${1:-.} | grep -v LATER| grep 'cmd:'
}

# cl -> execute the Command in the Last line of the note log
function cl() {  command_note_list | tail -1 | sed -n -e 's/^.*\$//p';  $( command_note_list | tail -1 | sed -n -e 's/^.*\$//p' ) }
