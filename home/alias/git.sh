## git ##
alias g="git"

alias gcl="git clone "
alias gp="git pull"
alias gpu="git push"

alias gs="git status -sb"
alias ga="git add"
alias gfc="git add -A :/ && git commit -m 'no comment '" #git fast commit

alias gc="git checkout "
function gcg(){ git checkout $( git branch | grep $1 | pyp 'pp[0]' ) } # git checkout grep branch
alias gcb="git checkout -b"
alias gm="git merge"
function gmg(){ git merge $( git branch | grep $1 | pyp 'pp[0]' ) } # git merge grep branch

alias gb="git branch"
alias gbanm="git branch --all --no-merged"
alias gbd="git branch -D"

alias gl="git log"
alias gbl="git blame"
alias gbnm="git branch --no-merged"

alias gd="git diff"
alias gsh="git show"

alias gf="git fetch"
alias gfa="git fetch --all"

alias grv="git remote -v"

alias gsp="git stash pop"
alias gst="git stash"

alias gls="git ls-files"
alias glg="git ls-files | grep"
alias glm="git ls-files -m"

export o="origin"
export m='master'
export st="stage"
alias gbg="git branch |grep"
alias gpo="git push origin"
function gpob() {git push origin $( git rev-parse --abbrev-ref HEAD) } # git push origin current branch
alias gau="git add -u :/"
alias gbs="git branch --set-upstream-to="
alias gbv="git branch -v"
alias gce="git config -e"
alias gceg="git config -e --global"
alias gdt="git difftool"
alias gdn="git-diff-name"
alias ghc="hub create" #git hub create
alias gi="git init"
alias gig="echo 'cp ~/gitignore/'| pbcopy && ls ~/gitignore |grep -i"
alias grr="git remote remove"
alias gra="git remote add"
alias gre="git reset"
alias gsta="git_stats generate"
alias gsw="git-sweep preview && git-sweep"
alias gu="git-up"
alias hc="hub clone"
alias hcr="hub create"
alias gri="git rebase -i"
alias gbn="git rev-parse --abbrev-ref HEAD" # git branch name
alias glf="git ls-files"
alias glfg="git ls-files | grep"
git-diff-name() { git diff $1 --name-only | cat }
alias glps="git log --format='%h %an -- %s' prod..stage"
alias glsh="git log --format='%h %an -- %s'" # git log short
function git_status_grep() { git status | grep $1  | pyp 'w[-1]'; }
alias gsgr=git_status_grep
function vim_git_status_grep() { vim -O $(git status | grep $1  | pyp 'w[-1]'); }
alias vgsgr=vim_git_status_grep
