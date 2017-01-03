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
