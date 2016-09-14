function h5() { history_grep $1 | tail -5 }
function h15() { history_grep $1 | tail -15 }
function h33() { history_grep $1 | tail -33 }
alias fuc="frequent_used_command | pyp 'int(w[0]) > 50 | len(w[1]) > 3'"
alias fucg="frequent_used_command_grep"
