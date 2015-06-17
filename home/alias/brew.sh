## homebrew ##
### The missing package manager for OS X ###
alias b="brew"
alias bc="brew cask"
bcs () {  echo "## brew search ##" && brew search $1 && echo "##brew cask search ##" && brew cask search $* ; echo "## brew cask info ##" && brew cask info $1 }
alias bci="brew cask install"
alias bt="brew tap"
alias bi="brew install"
alias bif="brew info"
alias bl="brew list"
alias bs="brew search"
alias bu="brew update"
alias bU="brew upgrade"
alias bud="brew update;brew doctor"
alias bd="brew doctor"
