## git ##

## git remote
alias gcl="git clone "
alias gf="git fetch"
alias gfa="git fetch --all"
alias grv="git remote -v"
alias grpo="git remote prune origin"
alias gpul="git pull"
alias gpu="git push"
alias grr="git remote remove"
alias gra="git remote add"

## git information
alias gs="git status -sb"
alias gl="git log --oneline "
alias gbl="git blame"
alias gd="git diff"
alias gsh="git show"
alias gls="git ls-files"
alias glf="git ls-files"
alias glfg="git ls-files | grep"

## git commit
alias ga="git add"
alias gau="git add -u :/"

## git branch
alias gc="git checkout "
alias gcb="git checkout -b"
alias gcd='git checkout develop'
alias gm="git merge"
alias gbanm="git branch --all --no-merged"
alias gbnm="git branch --no-merged"
alias gbd="git branch -d"
alias gbs="git branch --set-upstream-to="
alias gbv="git branch -v"

## git hub
alias ghc="hub create" #git hub create
alias hc="hub clone"
alias hcr="hub create"

## git config
alias gce="git config -e"
alias gcue="git config user.email"
alias gceg="git config -e --global"

## git misc
alias gsp="git stash pop"
alias gst="git stash"
alias gdt="git difftool"
alias gre="git reset"
alias gtl='git tag --list'

## git function
alias gfc=git_fast_commit
function git_fast_commit(){ git add -A :/ && git commit -m 'no comment ' }

alias gcg=git_checkout_grep_branch
function git_checkout_grep_branch(){ git checkout $( git branch | grep $1 | pyp fe ) }

function gdg() { git diff $( git_ls_grep $1) }

alias glg="git_ls_grep"
function git_ls_grep() { git ls-files | grep -i $1  }

function gcglg() {git checkout $(git_ls_grep $1) }
alias glm="git ls-files -m"
function vglm() {vim -O $(git ls-files -m) $@ }
function gmg(){ git merge $( git branch | grep $1 | pyp fe ) } # git merge grep branch
alias gpcb="git_pull_current_branch"
alias pull="git_pull_current_branch"
function git_push_current_branch() {git push origin $( git rev-parse --abbrev-ref HEAD) }
function git_log_current_branch() {git log --oneline origin/$( git_branch_name )..$( git_branch_name ) }
function git_diff_current_branch() {git diff origin/$( git_branch_name )..$( git_branch_name ) }
alias gpsb="git_push_current_branch"
alias push="git_push_current_branch"
function git_pull_current_branch() {git pull origin $( git rev-parse --abbrev-ref HEAD) }
alias gbn=git_branch_name
function git_branch_name() { git rev-parse --abbrev-ref HEAD }
alias gdn=git_diff_name
function git_diff_name() { git diff $1 --name-only | cat }
alias glsh=git_log_short
function git_log_short() { git log --format='%h %an -- %s' }

