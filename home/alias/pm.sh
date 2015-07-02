# package manager
function package_log() { echo "$1 $2" >> ~/package_manager/$1.sh && eval "$1 $2" }
function awm_install() { package_log awm "install $1"}
alias b="brew"
alias bc="brew cask"
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
alias pi="sudo pip install"
alias pis="pip search"
alias gei="gem install"
