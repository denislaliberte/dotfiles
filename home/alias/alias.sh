##commande de bases
alias gis="gisele"
alias cpr="cp -r"
alias t3="tree -L 3"
alias t2="tree -L 2"
alias s="source"
alias sz="source ~/.zshrc"
alias ag="shellaliasgrep" #alias grep
alias c="cd"
alias clr="clear && pwd"
alias ch="chmod"
alias ic="ifconfig"
alias mkd="mkdir"
alias o="open"
alias open="echo '##### use o #####' && open"
alias p="pwd"
alias rmr="sudo rm -r"
alias va="vim_alias"
alias vh="vim_hc"
alias wg="wget"
alias wh="which"
function whh(){ which $(which $1 |pyp 'w[-1]') | pyp 'pp[1:-1]|p'}
alias uz="unzip"
alias e="echo"
alias fd="find"
alias tw="tee >(wc -l)"
function hosts(){ sudo echo " 127.0.0.1 $1" >> /etc/hosts }
export www=~/Sites/
export w=~/Sites/
export etc=~/Sites/_etc
export gol=$w/tp1/tp1-gitolite-admin/conf/gitolite.conf
export gg=~/.gitgot

#echo "$ ag || va"
alias k="keep"
function keep() { tee  ~/.keep | tee >(wc -l) | head -40}
alias vk="vim -O ~/.keep"
alias kp="keep_print"
function keep_print() { cat ~/.keep }
alias kf='keep_files'
function keep_files() { cat ~/.keep | awk -F ':' '{print $1}' |sort |uniq }
alias c2s=command2script
function command2script() {echo "$(fc -ln -1)" | tee -a script.ignore }
alias t=tail
alias h=head
alias rmd=rmdir
alias md5=md5sum
