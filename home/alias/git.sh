alias ane=update_amend_no_edit
function update_amend_no_edit(){ git add -u :/; git commit --amend --no-edit}
function gac() { git add -A :/; git commit -m $@ }
alias gfc=git_fast_commit
function git_fast_commit(){ git add -A :/ && git commit -m 'no comment ' }
function git_commit_fixup_rebase(){ git commit -a --fixup HEAD;git_rebase_i_head }
alias fur=git_commit_fixup_rebase
function git_commit_fixup_note(){ git commit -a --fixup :/note; git_log_short origin/master..HEAD }
alias fun=git_commit_fixup_note
function gdg() { git diff $( git_ls_grep $1) }
alias glg="git_ls_grep"
function git_ls_grep() { git ls-files | grep -i $1  }
alias gpcb="git_pull_current_branch"
alias pull="git_pull_current_branch"
function git_log_current_branch() { git log --oneline origin/$( git_branch_name )..$( git_branch_name ) }
function git_diff_current_branch() { git diff origin/$( git_branch_name )..$( git_branch_name ) }
alias p=git_push_current_branch
alias gpsb="git_push_current_branch"
function git_push_current_branch(){ echo "git push origin $( git rev-parse --abbrev-ref HEAD) --force # be careful with the --force"; dev_style; git_log_short origin/master..HEAD; git push origin $( git rev-parse --abbrev-ref HEAD); dev open pr; }
alias push="deprecated p"
function git_pull_current_branch() { git pull origin $( git rev-parse --abbrev-ref HEAD) }
alias gbn=git_branch_name
function git_branch_name() { git rev-parse --abbrev-ref HEAD }
alias gdn=git_diff_name
function git_diff_name() { git diff $1 --name-only | cat }
alias glsh=git_log_short
function git_log_short(){ git log --format='%h %ar %f' ${1:-HEAD} | tee >(wc -l) |cat  | head -30 }
function git_log_master(){ git_log_short origin/master..${1:-HEAD} }
alias grih=git_rebase_i_head
function git_rebase_i_head(){ git rebase -i HEAD~${1:-2} }
alias gro=git_rebase_origin
function git_rebase_origin(){ git fetch origin ${1:-master}; git rebase origin/${1:-master}}
function number_of_commit(){ git shortlog -s -n  --no-merges | grep -i denis.laliberte }
function score(){  git log --author="Denis Laliberte" --pretty=tformat: --numstat --no-merges $1 | awk '{inserted+=$1; deleted+=$2; delta+=$1-$2; ratio=deleted/inserted} END {printf "Commit stats:\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", inserted, deleted, delta, ratio }' -}
function score_all() { number_of_commit; echo application; score $a; echo test; score $t; echo all; score }
function code_churn(){ echo "churn of last ${2:-15000} commits"; git show --format='%cr' HEAD~${2:-15000} | tee;  git log --all -n ${2:-15000} -M -C --name-only | grep -E $1 | sort | uniq -c | sort |  tail -10}
function git_log_author(){ git log --author=Denis.Laliberte --all --format='%h %f'  | grep $@}
alias gla=git_log_author
function git_root() { basename $(git rev-parse --show-toplevel); }
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
alias gce="git config -e"
alias gceg="git config -e --global"
alias gdt="git difftool"
alias gre="git reset"
alias gtl='git tag --list'
alias gr="git rebase"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
