#bash
 if [ -f ~/.bash_command ]; then
    source ~/.bash_command
 fi

 #bash
alias bag="bashaliasgrep"
alias vbr="vim ~/.bashrc"
alias vbp="vim ~/.bash_profile"
alias lr="ls ~/Documents/reminder"
alias vr="vimreminder"
alias c="clear;pwd"
alias crm="clear;cat ~/README.txt "
alias la="ls -a"
alias ll="ls -l"
alias lS="clear;pwd;ls *"
alias des="cd ~/Desktop"
alias doc="cd ~/Documents"
alias hom="cd ~"
alias home="cd ~"
alias hg="historygrep"
alias rmr="rm -r"
alias hstat="history | awk '{a[\$2]++}END{for(i in a){print a[i] \" \" i}}' | sort -rn | head"

## behat
alias bb="bin/behat"

##brew
alias b="brew"

#composer
alias cmp="composer"

##drush
alias d="drush"
alias dca="drush cc all"
alias dcd="drushcd"
alias ddl="drush dl"
alias ddm="drush dis -y devel_themer devel_image_provider masquerade coder cron_debug search_krumo"
alias ddy="drush dis -y"
alias dey="drush en -y"
alias dem="drush en -y devel_themer devel_image_provider masquerade coder cron_debug search_krumo"
alias dg="drushgrep"
alias dpl="drush pml"
alias dpg="drushpmlgrep"
alias dsc="drush sql-connect -l"
alias dlm="drush dl devel_themer devel_image_provider masquerade coder cron_debug search_krumo"
alias dvg="drush vget"
alias dvs="drush vset"

##f
alias f="fbcmd"
alias fa2="f STREAM fl_10151548377785299 new"
alias fa="f STREAM fl_213506995298"
alias fan="f STREAM fl_213506995298 new"
alias fc="f COMMENT"
alias ff="f SFILTERS"
alias fI="f INBOX"
alias fn="f NOTIFY"
alias fm="f MSG"
alias fS="f STATUS"
alias fs="f STREAM"
alias fsn="f STREAM new"
alias ft="f STREAM #TP1"

##git
alias g="git"
alias ga="git add"
alias gA="git add -A :/"
alias gau="git add -u ."
alias gaU="git add -u :/"
alias gb="git branch -v"
alias gc="git checkout "
alias gcm="git commit -m "
alias gd="git diff"
alias gl="git log"
alias gp="git pull"
alias gP="git push"
alias gm="git merge"
alias gr="git remote -v"
alias gs="git status"
##git commande combinee
alias Gac="git add -u;git commit -m"
alias Gcm="git checkout master"
alias Gds="git diff;git status;git branch -v"
alias Gpm="git push origin master"
alias ghc="hub create" #git hub create

alias Gconf='git config --global color.ui true;git config --global user.name "Denis Laliberté",git config core.fileMode false'

alias p="pwd"

##http
alias hic="ifconfig"
alias hr="sudo apachectl restart"
alias hcs="cd ~/Sites"

#homesick
alias hs="homesick"
alias hch="homesick cd hc"
alias hcd="homesick cd"
alias hd="homesick diff hc"
alias hl="homesick list"
alias hp="homesick pull hc"
alias hP="homesick push hc"



##python
alias p="python"

##ruby
rvm use 1.9
alias r="rails"
alias rr="rake routes"
alias rdm="rake db:migrate;rake db:migrate RAILS_ENV=test"
alias rgm="rails generate migration"

##sublime
alias s="subl"

##twitter-cli
alias t2="t timeline -l |grep http | head -2"
alias t5="t timeline -l |grep http | head -5"
alias tf="t favorite"
alias tm="t mentions"
alias tr="t retweet"
alias tu="t unfollow"
alias tw="t stream timeline"

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


##bash option
cat README.txt
export PS1='\W \!$ '
export GREP_OPTIONS="--color=auto"
force_color_prompt=yes
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

  #bash history
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
    # Combine multiline commands into one in history
shopt -s cmdhist
    # Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
