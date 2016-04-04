# package manager
function package_log() { echo "$1 $2" >> ~/package_manager/$1.sh && eval "$1 $2" }
function awm_install() { package_log awm "install $1"}
alias b="brew"
function bcs () {  echo "## brew search ##" && brew search $1 && echo "##brew cask search ##" && brew cask search $* ; echo "## brew cask info ##" && brew cask info $1 }
alias bci="brew_cask_install"
alias bt="brew tap"
alias bi="brew_install"
function brew_install() { package_log brew "install $1" }
function brew_cask_install() { package_log brew "cask install $1" }
alias bif="brew info"
alias bl="brew list"
alias bs="brew search"
alias bu="brew update"
alias bU="brew upgrade"
alias bud="brew update;brew doctor"
alias bd="brew doctor"
alias ai="awm_install" # alfred workflow manager - awm
alias aws="awm search"
alias ainf="awm info"
alias ni="npm_install"
function npm_install() { package_log npm "-g install $1"}
alias cmp="composer"
alias ei="sudo easy_install"
function pip_install() { echo "sudp pip install $1" >> ~/package_manager/pip.sh && eval "sudo pip install $1" }
alias pi="pip_install"
alias pis="pip search"
function my_gem_install { package_log gem "install $1"}
alias mgi="my_gem_install"
# add alias to go get
# add alias tu hub clone
# add set -v to package manager files#echo "## gem install 'git_stats'        ## " && gem install 'git_stats'
## todo add alias to apm package manager
