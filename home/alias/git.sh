## git ##
alias g="git"

alias gcl="git clone "
alias gp="git pull"
alias gpu="git push"

alias gs="git status -sb"
alias ga="git add"
function gag(){ git add $( git_ls_grep $1 ) }
alias gfc="git add -A :/ && git commit -m 'no comment '" #git fast commit

alias gc="git checkout "
function gcg(){ git checkout $( git branch | grep $1 | pyp 'pp[0]' ) } # git checkout grep branch
alias gcb="git checkout -b"
alias gm="git merge"

alias gb="git branch"
alias gbanm="git branch --all --no-merged"
alias gbd="git branch -D"

alias gl="git log"
alias gbl="git blame"
alias gbnm="git branch --no-merged"

alias gd="git diff"
alias gdb="git_diff_branch"
function git_diff_branch(){ echo  $(head -1 branch.ignore);git diff $(head -1 branch.ignore) ; git diff --name-only $(head -1 branch.ignore) | tee path.ignore }
function gdg() { git diff $( git_ls_grep $1) }
alias gsh="git show"

alias gf="git fetch"
alias gfa="git fetch --all"

alias grv="git remote -v"

alias gsp="git stash pop"
alias gst="git stash"

alias gls="git ls-files"
alias glg="git_ls_grep"
function git_ls_grep() { git ls-files | grep -i $1 | tee path.ignore }
function vglg() { vim -O $( git_ls_grep $1) }
function gcglg() {git checkout $(git_ls_grep $1) }
alias glm="git ls-files -m"
function vglm() {vim -O $(git ls-files -m) $@ }

function gbg(){ git branch |grep $1 | tee branch.ignore }
function gmg(){ git merge $( git branch | grep $1 | pyp 'pp[0]' ) } # git merge grep branch

alias gpo="git push origin"
function gpob() {git push origin $( git rev-parse --abbrev-ref HEAD) } # git push origin current branch
alias gau="git add -u :/"
alias gbs="git branch --set-upstream-to="
alias gbv="git branch -v"
alias gce="git config -e"
alias gcue="git config user.email"
alias gceg="git config -e --global"
alias gdt="git difftool"
alias gdn="git-diff-name"
alias ghc="hub create" #git hub create
alias gig="echo 'cp ~/gitignore/'| pbcopy && ls ~/gitignore |grep -i"
alias grr="git remote remove"
alias gra="git remote add"
alias gre="git reset"
alias hc="hub clone"
alias hcr="hub create"
alias gbn="git rev-parse --abbrev-ref HEAD" # git branch name
alias glf="git ls-files"
alias glfg="git ls-files | grep"
git-diff-name() { git diff $1 --name-only | cat }
alias glsh="git log --format='%h %an -- %s'" # git log short
function git_status_grep() { git status | grep $1  | pyp 'w[-1]'; }
alias gsgr=git_status_grep
function vim_git_status_grep() { vim -O $(git status | grep $1  | pyp 'w[-1]'); }
alias vgsgr=vim_git_status_grep
alias gtl='git tag --list'
