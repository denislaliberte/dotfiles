## other command
alias dcf=httpd_cconfig_file
function httpd_cconfig_file="httpd -V |grep SERVER_CONFIG_FILE"
function qwer() { echo "export asdf=" >> ~/.asdf && vim ~/.asdf && source ~/.asdf && rm ~/.asdf }
alias wmi=whats_my_ip
function whats_my_ip() { ifconfig en0 | grep inet | grep -v inet6 }
alias cuj="curl -i -H \"Accept: application/json\" -X"
alias mu="mutt"
alias lpa=lpass
alias lpp="lpass show -c --password"
alias lpn="lpass show -c --username"
alias lplg="lpass ls |grep -i"
alias quix="cat ~/scripts/quix.txt |grep"
alias qx="quix"
alias vqx="vim ~/scripts/quix.txt"
