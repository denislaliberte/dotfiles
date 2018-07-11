# command note

# cn 105 -> execute Command at line 105 in the Note log
function cn(){ command=$(sed "$1!d" $note | sed -n -e 's/^.*\$//p') ;  echo $command; eval $command}

# cnl -> List all Command in Note log
# cnl test -> List all Command that match /test/ in Note log
alias cnl=command_note_list
function command_note_list() { grep -n '\$' $note | grep ${1:-.} | grep '\$' }

# cl -> execute the Command in the Last line of the note log
function cl() {  command_note_list | tail -1 | sed -n -e 's/^.*\$//p';  $( command_note_list | tail -1 | sed -n -e 's/^.*\$//p' ) }
