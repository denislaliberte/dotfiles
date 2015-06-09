echo "~/hc/alias/alias.sh $ asdf"
### alias meta ###
alias asdf="cat ~/hc/alias/alias.sh |head -10"
alias ag="shellaliasgrep" #alias grep
alias vz="vim ~/.zshrc"
alias vas="vim ~/hc/alias/alias.sh"
alias vr="vim ~/.vimrc"
alias sas="src"
alias zs="src"
alias hg="echo 'hs' && hs"
alias pw="openssl rand -base64 32| cut -c1-12" #generate password
alias h5="history | tail -5"
alias h15="history | tail -15"
alias h33="history | tail -33"
alias fuc="frequent_used_command"
alias fucg="frequent_used_command_grep"
alias wh="which"
alias o="open"

### list ###
alias l="ls"
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
alias mkdir="echo '###### use mkd #####' && mkdir"
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

## consular ##
alias ce="consular edit"
alias cs="consular start"
alias cls="ls ~/hc/consular"

## dropbox 
alias mydrop="HOME=$HOME/Dropbox-personal /Applications/Dropbox.app/Contents/MacOS/Dropbox &"

## httpd Apache ##
alias hcf="echo 'Httpd Config File ...  httpd -V |grep SERVER_CONFIG_FILE' ;httpd -V |grep SERVER_CONFIG_FILE"

## drush alias $ drushaliasgrep dag  ## 
 if [ -f ~/hc/alias/drush.sh ]; then
    source ~/hc/alias/drush.sh
 fi


## fabric ##
### library and command-line tool for streamlining the use of SSH for application deployment or systems administration tasks. ###
alias fl="fab list"

## git ##
### fast version control ###

 if [ -f ~/hc/alias/git.sh ]; then
    source ~/hc/alias/git.sh
 fi

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

## npm ##
alias ni="npm install"

## open 
alias pause="td ls @pause; open http://facebook.com https://delicious.com/denislaliberte  http://readruler.com/ http://getpocket.com/a/queue/grid/5%20minutes/"


alias pgs="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"

## proc ##
alias pro="python proc"
alias pt="python proc"
alias ppu="python proc update"

alias pwrd="ping -c 1 yahoo.com |md5 | head -c8; echo"

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
#alias vim="echo '####### use v | vo | vO #######' && vim"
alias v="vim"
alias vo="vim -o"
alias vO="vim -O"
alias bim="vim" #typo fréquente
alias cim="vim" #typo fréquente
alias vvr="vim ~/.vimrc"
alias vrm="vim ~/README.txt"
alias vbi="vim +BundleInstall +qall"
alias veh="sudo vim /etc/hosts"
# zsh
alias zg="ls ~/.oh-my-zsh/plugins/ |grep"
alias zc="cd ~/.oh-my-zsh/plugins/"


 if [ -f ~/hc/alias/shortcut.sh ]; then
    source ~/hc/alias/shortcut.sh
 fi

 if [ -f ~/hc/alias/mysql.sh ]; then
    source ~/hc/alias/mysql.sh
 fi
 if [ -f ~/hc/alias/python.sh ]; then
    source ~/hc/alias/python.sh
 fi
 if [ -f ~/hc/alias/ruby.sh ]; then
    source ~/hc/alias/ruby.sh
 fi
 if [ -f ~/hc/alias/php.sh ]; then
    source ~/hc/alias/php.sh
 fi
 if [ -f ~/hc/alias/brew.sh ]; then
    source ~/hc/alias/brew.sh
 fi
alias mu="mutt"
alias ch="chmod"
alias chmod=" echo '#### use ch | cr7 ####' && chmod"
alias cuj="curl -i -H \"Accept: application/json\" -X"
