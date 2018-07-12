alias fu="deprecated cf"
alias glm='git_log_master_save'
function git_log_master_save(){ git_log_master; git_log_master | pyp 'pp[:-1]|p' > .ignore/commits.txt; cat .ignore/commits.txt | pyp 'pp';echo '$ gsc i' }
alias gsc=git_show_commits
function git_show_commits(){ git show $(cat .ignore/commits.txt | pyp "pp[${1:-0}]|w[0]")}

