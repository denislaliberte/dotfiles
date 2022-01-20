alias gscl=git_show_commits_less
function git_show_commits_less() { git_show_commits $@ | less }
alias gsc=git_show_commits
function git_show_commits(){ git show $(cat .ignore/commits.txt | pyp "pp[${1:-0}]|w[0]") | pyp '"   >>>     "+ p|p.replace("     +++ b/", " - [ ] ").replace("      def", "* [ ] def").replace("    test", " * [ ] test")' }
# sc -> show commits
function sc() { cat .ignore/commits.txt | pyp 'pp' }

