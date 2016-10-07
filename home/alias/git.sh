## git ##

alias gcl="git clone "
alias gpul="git pull"
alias gpu="git push"

alias gs="git status -sb"
alias ga="git add"
function gag(){ git add $( git_ls_grep $1 ) }
alias gfc=git_fast_commit
function git_fast_commit(){ git add -A :/ && git commit -m 'no comment ' }

alias gc="git checkout "
function gcg(){ git checkout $( git branch | grep $1 | pyp fe ) } # git checkout grep branch
alias gcb="git checkout -b"
alias gcd='git checkout develop'
alias gm="git merge"

alias gbanm="git branch --all --no-merged"
alias gbd="git branch -D"

alias gl="git log --oneline "
alias gbl="git blame"
alias gbnm="git branch --no-merged"

alias gd="git diff"
function gdg() { git diff $( git_ls_grep $1) }
alias gsh="git show"

alias gf="git fetch"
alias gfa="git fetch --all"

alias grv="git remote -v"
alias grpo="git remote prune origin"

alias gsp="git stash pop"
alias gst="git stash"

alias gls="git ls-files"
alias glg="git_ls_grep"
function git_ls_grep() { git ls-files | grep -i $1  }
function vglg() { vim -O $( git_ls_grep $1) }
function gcglg() {git checkout $(git_ls_grep $1) }
alias glm="git ls-files -m"
function vglm() {vim -O $(git ls-files -m) $@ }

function gmg(){ git merge $( git branch | grep $1 | pyp fe ) } # git merge grep branch

alias gpo="git push origin"
alias gpcb="git_pull_current_branch"
alias pull="git_pull_current_branch"
function git_push_current_branch() {git push origin $( git rev-parse --abbrev-ref HEAD) }
alias gpsb="git_push_current_branch"
alias push="git_push_current_branch"
function git_pull_current_branch() {git pull origin $( git rev-parse --abbrev-ref HEAD) }
alias gau="git add -u :/"
alias gbs="git branch --set-upstream-to="
alias gbv="git branch -v"
alias gce="git config -e"
alias gcue="git config user.email"
alias gceg="git config -e --global"
alias gdt="git difftool"
alias gdn="git-diff-name"
alias ghc="hub create" #git hub create
alias grr="git remote remove"
alias gra="git remote add"
alias gre="git reset"
alias hc="hub clone"
alias hcr="hub create"
alias gbn=git_branch_name
function git_branch_name() { git rev-parse --abbrev-ref HEAD }
alias glf="git ls-files"
alias glfg="git ls-files | grep"
git-diff-name() { git diff $1 --name-only | cat }
alias glsh=git_log_short
function git_log_short() { git log --format='%h %an -- %s' }
alias gtl='git tag --list'
