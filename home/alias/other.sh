## other command
alias hcf="echo 'Httpd Config File ...  httpd -V |grep SERVER_CONFIG_FILE' ;httpd -V |grep SERVER_CONFIG_FILE"
alias asdf="vim ~/.asdf && cat ~/.asdf | shasum | cut -c1-$asdf | pbcopy && rm ~/.asdf" 
function qwer() { echo "export asdf=" >> ~/.asdf && vim ~/.asdf && source ~/.asdf && rm ~/.asdf }
alias wmi="ifconfig en0 | grep inet | grep -v inet6" # what my ip address
alias phone="pbpaste | sed 's/^\(.\{3\}\)\(.\{3\}\)\(.\{4\}\)$/\1-\2-\3/ '"
alias mydrop="HOME=$HOME/Dropbox-personal /Applications/Dropbox.app/Contents/MacOS/Dropbox &"
alias cuj="curl -i -H \"Accept: application/json\" -X"
alias mu="mutt"
alias lpa=lpass
alias lpp="lpass show -c --password"
alias lpn="lpass show -c --username"
alias lplg="lpass ls |grep -i"
alias quix="cat ~/scripts/quix.txt |grep"
alias qx="quix"
