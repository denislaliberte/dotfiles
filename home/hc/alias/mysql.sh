#mysql use "export DATAB=database_name && src"
alias my="mysql"
alias myr="mysql"
alias mye="mysql $DATAB -e "
alias mysql="echo '#### use my | myr | mye ####' && mysql";
alias mysdg="mysql -e 'show databases;' |grep"
alias mysd="mysql -e 'show databases;'"
alias myst="mysql -e 'show tables;' $DATAB"
function mydes(){ mysql -e "desc $1;" $DATAB}
function mysel(){ mysql -e "select * from $1 limit 10;" $DATAB}
