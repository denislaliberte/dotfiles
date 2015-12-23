## git ##
alias Gac="git add -u;git commit -m"
alias Gcm="git checkout master"
alias Gconf='git config --global color.ui true;git config --global user.name "Denis Laliberté",git config core.fileMode false'
alias gbm="git branch -m"
alias Gds="git diff;git status;git branch -v"
alias gpM="git push origin master"
alias Gpm="gpM"
alias gA="git add -A :/"
alias gPd="git push devel"
alias gPo="git push origin"
alias gPp="git push prod"
alias gPs="git checkout stage && git push origin stage && git push stage stage"
alias gaU="git add -u :/"
alias gacp="git add -A :/; git commit -m 'no comment ';git push" #git add commit push (no comment)
alias gau="git add -u ."
alias gbg="git branch |grep"
alias gbs="git branch --set-upstream-to="
alias gbv="git branch -v"
alias gco="git config"
alias gdt="git difftool"
alias gdn="git-diff-name"
alias gf="git flow"
alias gff="git flow feature"
alias gfff="git flow feature finish"
alias gfs="git flow feature start"
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
alias gls="got list"
alias glt="got list -t"
alias gcd="got cd"
alias goa="got add"
alias gos="got status"
alias gosq="got status -q"
alias gps="git checkout stage && git pull origin master && git pull origin stage" # git pull stage
alias gpm="git checkout master && git pull origin master && git pull devel master" # git pull master
alias gpp="git checkout prod && git pull origin prod" # git pull prod
alias gmsm="git checkout master && git merge stage" # git merge stage in master
alias gmps="git checkout stage && git merge prod" # git merge prod in stage
alias gmsm="git checkout master && git merge stage" # git merge stage in master
alias gdss="gpp && gps && gmps" # git downstream prod to stage
alias gdsm="gps && gpm && gmsm" # git downstream stage to master
alias gri="git rebase -i"
alias gbn="git rev-parse --abbrev-ref HEAD" # git branch name
alias glf="git log --follow -p"
git-diff-name() { git diff $1 --name-only | cat }
alias glps="git log --format='%h %an -- %s' prod..stage"
alias glsh="git log --format='%h %an -- %s'" # git log short
