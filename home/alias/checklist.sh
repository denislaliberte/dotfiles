alias cklt=checklist
alias ncl=nextchecklist
function nextchecklist() { $(list) }
function checklist() { cp ~/checklist/template/$1 ~/checklist/current; list; return 1 }
function listchecklist() { ls ~/checklist/template }
alias ck=check
function check() { tail -n +2 ~/checklist/current > ~/checklist/temp && mv ~/checklist/temp ~/checklist/current && list }
alias nx=next
function next() { $( list | head -1 ) && check }
alias l=list
function list(){ if [ -s ~/checklist/current ]; then cat ~/checklist/current | pyp '"- " + p' ; else listchecklist; fi }
function red() { echo "Write the minimum code to make the tests fail"; return 1 }
function green() { echo "Write the minimum code to make the tests pass"; return 1 }
function refactor() { echo "Cleanup the code"; return 1 }
