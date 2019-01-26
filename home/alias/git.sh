alias ane="deprecated can"
alias push="deprecated p"
alias gac="deprecated  cam"
alias gfc="deprecated cf"
alias fur="deprecated cfr"
alias fun="deprecated cfn"

alias glg="git_ls_grep"
function git_ls_grep() { git ls-files | grep -i $1  }

alias gpcb="git_pull_current_branch"
alias pull="git_pull_current_branch"

function git_diff_current_branch() { git diff origin/$( git_branch_name )..$( git_branch_name ) }

function git_pull_current_branch() { git pull origin $( git rev-parse --abbrev-ref HEAD) }

alias gdn=git_diff_name
function git_diff_name() { git diff $1 --name-only | cat }
alias glsh=git_log_short
function git_log_short(){ git log --format='%h  "%ar"  %f' ${1:-HEAD} | tee >(wc -l) |cat  | head -30 }
function git_log_master(){ git_log_short origin/master..${1:-HEAD} }
alias grih=git_rebase_i_head
function git_rebase_i_head(){ git log --format='rebased commits: %h  "%ar"  %f' HEAD...HEAD~${1:-2} | tee -a $n; git rebase -i HEAD~${1:-2} }
alias gro='deprecated ro'
function number_of_commit(){ git shortlog -s -n  --no-merges | grep -i denis.laliberte }
function git_log_author(){ git log --author=Denis.Laliberte --all --format='%h %f'  | grep $@}
alias gla=git_log_author
function git_root() { basename $(git rev-parse --show-toplevel) }
function git_log_all(){ git log --all  --format='%h %f' | grep $@ }
alias glal=git_log_all
export om="origin/master"
alias gfm="git fetch origin master"
alias gd="git diff"
alias gdm="git diff origin/master"
alias gsh="git show"
alias cmt="git commit"
alias amd="git commit --amend"
alias ga="git add"
alias gau="git add -u :/"
alias gc="git checkout "
alias gcb="git checkout -b"
alias gm="git merge"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gce="git config -e"
alias gceg="git config -e --global"
alias gdt="git difftool"
alias gre="git reset"
alias gtl='git tag --list'
alias gr="git rebase"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gcpc="git cherry-pick --continue"
