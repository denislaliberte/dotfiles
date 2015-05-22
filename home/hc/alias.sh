echo "~/hc/alias.sh $ asdf"
### alias meta ###
alias asdf="cat ~/hc/alias.sh |head -10"
alias ag="shellaliasgrep" #alias grep
alias vz="vim ~/.zshrc"
alias vas="vim ~/hc/alias.sh"
alias vr="vim ~/.vimrc"
alias sas="src"
alias zs="src"
alias hg="echo 'hs' && hs"
alias pw="openssl rand -base64 32| cut -c1-12"
alias h5="history | tail -5"
alias h15="history | tail -15"
alias h33="history | tail -33"

### list ###
alias la="ls -a"
alias ll="ls -l"
alias lS="clear;pwd;ls *"
alias lg="lsgrep" #ls grep $*

### short link ###
alias des="cd ~/Desktop"
alias doc="cd ~/Documents"
alias dow="cd ~/Downloads"
alias hom="cd ~"
alias home="cd ~"

### autre ###
alias mkd="mkdir"
alias p="pwd"
alias vbp="vim ~/.bash_profile"
alias c="clear;pwd"
alias rmr="sudo rm -r"
alias cr7="sudo chmod -R 777"
alias ppc="pwd| pbcopy"

## apache##
###  Apache HTTP Server ###
alias acs="sudo apachectl start"
alias acr="sudo apachectl restart"
alias act="apachectl -t"

## artisan ##
alias ada="artisan dump-autoload"
alias am="artisan migrate"
alias amm="artisan migrate:make"
alias amr="artisan migrate:rollback"

## behat ##
### BDD for PHP ###
alias bb="bin/behat"
alias bbe="bin/behat --expand"
alias bdl="bb -dl"
alias bsf="bin/behat --story-syntax --lang=fr"

## bundler ##
alias be="bundle exec"

## consular ##
alias ce="consular edit"
alias cs="consular start"
alias cls="ls ~/hc/consular"

## dropbox 
alias mydrop="HOME=$HOME/Dropbox-personal /Applications/Dropbox.app/Contents/MacOS/Dropbox &"

## cucumber ##
alias bec="bundle exec cucumber"

## homebrew ##
### The missing package manager for OS X ###
alias b="brew"
alias bc="brew cask"
bcs () {  echo "## brew search ##" && brew search $1 && echo "##brew cask search ##" && brew cask search $* ; echo "## brew cask info ##" && brew cask info $1 }
alias bci="brew cask install"
alias bt="brew tap"
alias bi="brew install"
alias bl="brew list"
alias bs="brew search"
alias bu="brew update"
alias bU="brew upgrade"
alias bud="brew update;brew doctor"
alias bd="brew doctor"

## httpd Apache ##
alias hcf="echo 'Httpd Config File ...  httpd -V |grep SERVER_CONFIG_FILE' ;httpd -V |grep SERVER_CONFIG_FILE"

## composer ##
### Dependency Manager for PHP ###
alias cmp="composer"

## drush alias $ drushaliasgrep dag  ## 
 if [ -f ~/hc/alias.sh ]; then
    source ~/hc/drush.sh
 fi


## easy_install ##
### Easily download, build, install, upgrade, and uninstall Python packages ###
alias ei="sudo easy_install"

## fabric ##
### library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks. ###
alias fl="fab list"

## git ##
### fast version control ###
git-diff-name() { git diff $1 --name-only | cat }
alias gdn="git-diff-name"
alias gdnm="git-diff-name master"
alias gol="cat ~/Sites/gitolite-admin/conf/gitolite.conf | grep"
alias g="git"
alias ga="git add"
alias gA="git add -A :/"
alias gAc="git add -A :/;git commit -m"
alias gAcn="git add -A :/;git commit -m 'no comments'"
alias gau="git add -u ."
alias gaU="git add -u :/"
alias gu="git-up"
alias gb="git branch -v"
alias gbd="git branch -D"
alias gbm="git branch -m"
alias gbnm="git branch --no-merged"
alias gbanm="git branch --all --no-merged"
alias gbs="git branch --set-upstream-to="
alias gbl="git blame"
alias gc="git checkout "
alias gcb="git checkout -b"
alias gcl="git clone "
alias gcm="git commit -m "
alias gd="git diff"
alias gfa="git fetch --all"
alias gi="git init"
alias gig="echo 'cp ~/gitignore/'| pbcopy && ls ~/gitignore |grep -i"
alias gl="git log"
alias gsw="git-sweep preview && git-sweep"
alias gp="git pull"
alias gP="git push"
alias gre="git reset"
#refactor gdec and gpub to a function
alias gdev="
echo  -- UPDATE MASTER WITH TP1 GIT ORIGIN -- ;
git checkout master;
git pull origin master;
echo  -- UPDATE DEVEL WITH TP1 ORIGIN/DEVEL AND DEVEL/MASTER -- ;
git checkout devel;
git pull origin devel;
git pull devel master;
echo  -- MERGE MASTER WITH DEVEL AND PUSH TO ORIGIN -- ;
git checkout master;
git merge devel;
git push origin master;
echo  -- MERGE DEVEL WITH MASTER AND PUSH TO ORIGIN/DEVEL AND DEVEL/DEVEL-- ;
git checkout devel; 
git merge master;
git push origin devel;
git push devel master;
echo  -- PROC UPDATE DEVEL -- ;
git checkout master;

python proc update -r devel"
alias gpub="
echo  -- UPDATE MASTER WITH TP1 GIT ORIGIN -- ;
git checkout master;
git pull origin master;
echo  -- UPDATE STAGE WITH TP1 ORIGIN/STAGE AND STAGE/STAGE -- ;
git checkout stage;
git pull origin stage;
git pull devel master;
echo  -- MERGE MASTER WITH STAGE AND PUSH TO ORIGIN -- ;
git checkout master;
git merge stage;
git push origin stage;
echo  -- MERGE STAGE WITH MASTER AND PUSH TO ORIGIN/STAGE AND STAGE/STAGE -- ;
git checkout stage; 
git merge master;
git push origin stage;
git push stage stage;
echo  -- PROC UPDATE STAGE -- ;
git checkout master;

python proc update -r stage"
alias gacp="git add -A :/; git commit -m 'no comment ';git push" #git add commit push (no comment)
alias gm="git merge"
alias gr="git remote -v"
alias gra="git remote add"
alias gs="git status"
alias gst="git stash"
alias gsp="git stash pop"
##git commande combinee
alias Gac="git add -u;git commit -m"
alias Gcm="git checkout master"
alias Gds="git diff;git status;git branch -v"
alias Gpm="git push origin master"
alias ghc="hub create" #git hub create

alias Gconf='git config --global color.ui true;git config --global user.name "Denis Laliberté",git config core.fileMode false'

##google ##
alias gde="google docs edit --editor vim --title"
alias gdl="google docs list"


## google calendar ##
alias gcal="gcalcli  --calendar denis@tp1.ca"
alias cala="gcal --details url add"
alias calw="gcal calw"
alias calm="gcal calm"


## goobook ##
### google book - gmail ###
alias gooq="goobook dquery"
alias gooa="goobook add"
alias goor="goobook reload"
alias gooh="goobook -h"
alias gooc="goobook config-template > .goobookrc"

## http ##
alias ic="ifconfig"
alias hcs="cd ~/Sites"

## homesick ##
###  Your home directory is your castle. Don't leave your dotfiles behind ###
alias hlh="homesick link hc"
alias hch="homesick cd hc"
alias hcd="homesick cd"
alias hd="homesick diff hc"
alias hl="homesick list"
alias hp="homesick pull hc"
alias hP="homesick push hc"
alias hst="homesick track" # track a new file. usage : hst .file hc


## jenkins ## 
### An extendable open source continuous integration server ###
alias jgj="curl http://localhost:8080/jnlpJars/jenkins-cli.jar -o ~/jenkins-cli.jar"
alias jip="java -jar ~/jenkins-cli.jar -s http://localhost:8080 install-plugin"
alias jj="java -jar ~/jenkins-cli.jar -s http://localhost:8080"
alias jsr="java -jar ~/jenkins-cli.jar -s http://localhost:8080 safe-restart"


## jekyll ##
### Transform your plain text into static websites and blogs. ###
alias j="jekyll"
alias js="jekyll server"
alias jsd="jekyll server --drafts"


## mysql ##
alias mup="mysql -u root -p -h 127.0.0.1"

## npm ##
alias ni="npm install"

## open 
alias pause="td ls @pause; open http://facebook.com https://delicious.com/denislaliberte  http://readruler.com/ http://getpocket.com/a/queue/grid/5%20minutes/"

## php ##
alias phl="php -l"
alias pa="php -a"

alias pu="phpunit"

## phpstorm ##
alias st="pstorm"
alias st.="pstorm . "
## phpspec ##
alias bp="bin/phpspec"
alias bpr="bin/phpspec run"
alias bpd="bin/phpspec desc"


## pip ##
### The PyPA recommended tool for installing and managing Python packages. ###
alias pi="sudo pip install"
alias pis="pip search"

alias pgs="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

##python
alias p="python"

## proc ##
alias pro="python proc"
alias pt="python proc"
alias ppu="python proc update"

alias pwrd="ping -c 1 yahoo.com |md5 | head -c8; echo"

##rspec
alias ber="bundle exec rspec"
alias berf="bundle exec rspec --fail-fast"



##ruby
alias r="rails"
alias rs="rails server"
alias rsp="rails server -p"
alias rgm="rails generate migration"

## rvm ##
### Ruby Version Manage ###
alias rgl="rvm gemset list" #gemsets
alias rgc="rvm gemset create"
alias rgu="rvm gemset use"
alias ru="rvm use"
alias rl="rvm list" # rubies
alias rudev="rvm use ruby-2.2.0@dev"


## rake ##
alias rr="rake routes"
alias rdd="rake db:drop"
alias rdc="rake db:create"
alias rdm="rake db:migrate"

## ruby ##
alias rgm="rails generate migration"

##sublime
alias s="subl"


## todotxt
alias td=~/todo/todo.sh

##twitter-cli
alias t2="t timeline -l |grep http | head -2"
alias t5="t timeline -l |grep http | head -5"
alias t15="t timeline -l |grep http | head -15 | tail -10"
alias tht="t timeline -l |grep http"
alias tf="t favorite"
alias tm="t mentions"
alias tr="t retweet"
alias tu="t unfollow"
alias tw="t whois"

 #vim 
alias v="vim"
alias bim="vim" #typo fréquente
alias cim="vim" #typo fréquente
alias vvr="vim ~/.vimrc"
alias vrm="vim ~/README.txt"
alias vbi="vim +BundleInstall +qall"
alias veh="sudo vim /etc/hosts"

#wp : wordpress cli 
alias wpa="wp plugin activate"
alias wpd="wp plugin deactivate"
alias wpp="wp plugin"
alias wps="wp plugin search"
alias wpl="wp plugin list"
alias wpa="wp plugin activate"

# zsh
alias zg="ls ~/.oh-my-zsh/plugins/ |grep"
alias zc="cd ~/.oh-my-zsh/plugins/"

