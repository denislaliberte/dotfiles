## alias bash ##
### alias bash meta ###
alias ag="bashaliasgrep" #alias grep
alias vbr="vim ~/.bashrc"
alias vas="vim ~/.alias.sh"
alias sas="source ~/.alias.sh"
alias hg="historygrep"
alias sb="source ~/.bashrc"
alias sas="source ~/.alias.sh"

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
alias hstat="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"
alias cr7="sudo chmod -R 777"

## apache##
###  Apache HTTP Server ###
alias acs="sudo apachectl start"
alias acr="sudo apachectl restart"
alias act="apachectl -t"

## behat ##
### BDD for PHP ###
alias bb="bin/behat"
alias bbe="bin/behat --expand"
alias bdl="bb -dl"
alias bsf="bin/behat --story-syntax --lang=fr"

## homebrew ##
### The missing package manager for OS X ###
alias b="brew"
alias bt="brew tap"
alias bi="brew install"
alias bl="brew list"
alias bs="brew search"
alias bu="t5;brew update"
alias bU="brew upgrade"
alias bud="brew update;brew doctor"
alias bd="brew doctor"

## composer ##
### Dependency Manager for PHP ###
alias cmp="composer"

## drush ## 
### A command line shell and scripting interface for Drupal. ###
alias d="drush"
alias dca="t2;drush cc all"
alias dt="t2;drush cc all"
alias dcd="drushcd"
#à débugger
alias ddl="drush dl"
alias ddr="drush devel-reinstall -y"
alias ddm="drush dis -y devel_themer devel_image_provider masquerade coder cron_debug search_krumo"
alias ddy="drush dis -y"
alias dey="drush en -y"
alias dem="drush en -y devel_themer devel_image_provider masquerade coder cron_debug search_krumo"
alias dfl="drush features-list"
alias dfr="drush features-revert"
alias dfra="drush features-revert-all"
alias dg="drushgrep"
alias dgc="drush generate-content"
alias dlm="drush dl devel_themer devel_image_provider masquerade coder cron_debug search_krumo"
alias dpl="drush pml"
alias dpg="drushpmlgrep"
alias dsc="drush sql-connect -l"
alias dui="drush user-information"
alias dup="drush user-password"
alias dvg="drush vget"
alias dvs="drush vset"


## easy_install ##
### Easily download, build, install, upgrade, and uninstall Python packages ###
alias ei="sudo easy_install"

## fabric ##
### library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks. ###
alias fl="fab list"

### fbcmd  ##
#### A facebook command line interface ###
#alias fb="fbcmd"
#alias fa2="fbcmd STREAM fl_10151548377785299 new"
#alias fa="fbcmd STREAM fl_213506995298"
#alias fan="fbcmd STREAM fl_213506995298 new"
#alias fc="fbcmd COMMENT"
#alias fe="fbcmd EVENTS"
#alias ff="fbcmd SFILTERS"
#alias fI="fbcmd INBOX"
#alias fn="fbcmd NOTIFY"
#alias fm="fbcmd MSG"
#alias fS="fbcmd STATUS"
#alias fs="fbcmd STREAM"
#alias fsn="fbcmd STREAM new"
#alias ft="fbcmd STREAM #TP1"

## git ##
### fast version control ###
alias g="git"
alias ga="git add"
alias gA="git add -A :/"
alias gAc="git add -A :/;git commit -m"
alias gAcn="git add -A :/;git commit -m 'no comments'"
alias gau="git add -u ."
alias gaU="git add -u :/"
alias gb="git branch -v"
alias gbd="git branch -D"
alias gbm="git branch -m"
alias gbs="git branch --set-upstream-to="
alias gc="git checkout "
alias gcl="git clone "
alias gcm="git commit -m "
alias gd="git diff"
alias gi="git init"
alias gl="git log"
alias gp="git pull"
alias gP="t2;git push"
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
t5;
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
t5;
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

## goobook ##
### google book - gmail ###
alias gbq="goobook query"
alias gba="goobook add"

## http ##
alias ic="ifconfig"
alias hcs="cd ~/Sites"

## homesick ##
###  Your home directory is your castle. Don't leave your dotfiles behind ###
alias hs="homesick"
alias hch="homesick cd hc"
alias hcd="homesick cd"
alias hd="homesick diff hc"
alias hl="homesick list"
alias hp="homesick pull hc"
alias hP="homesick push hc"


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


## npm ##
alias ni="npm install"

## open 
alias pause="td ls @pause;t5; open http://facebook.com http://twitter.com  https://delicious.com/denislaliberte/tag_bundle/todo http://getpocket.com/"


## phpspec ##
alias bp="bin/phpspec"
alias bpr="bin/phpspec run"
alias bpd="bin/phpspec desc"


## pip ##
### The PyPA recommended tool for installing and managing Python packages. ###
alias pi="sudo pip install"
alias pis="pip search"

##python
alias p="python"

## proc ##
alias pro="t2;python proc"
alias pt="t5;python proc"
alias ppu="python proc update"

alias pwrd="ping -c 1 yahoo.com |md5 | head -c8; echo"

##ruby
alias r="rails"
alias rs="rails server"

## rvm ##
### Ruby Version Manage ###
alias rgl="rvm gemset list"
alias rgc="rvm gemset create"
alias rgu="rvm gemset use"
alias ru="rvm use"
alias rl="rvm list"


## rake ##
alias rr="rake routes"
alias rdm="rake db:migrate;rake db:migrate RAILS_ENV=test"

## ruby ##
alias rgm="rails generate migration"

##sublime
alias s="subl"


## todotxt
alias td=~/todo/todo.sh

##twitter-cli
alias t2="t timeline -l |grep http | head -2"
alias t5="t timeline -l |grep http | head -5"
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

alias prot="cd ~/Sites/protectron/protectron.local.tp1.ca/sites/all/modules/tp1_project"
alias iavm="cd ~/Sites/iavm/iavm.local.tp1.ca/sites/all/modules/tp1_project"
alias sting="cd ~/Sites/sting/stingray.local.tp1.ca/sites/all/modules/custom"
