#mysql use "export DATAB=database_name && src"
alias my="mysql"
alias myr="mysql -uroot -h127.0.0.1"
alias mye="mysql -uroot -h127.0.0.1 $DATAB -e "
alias mysql="echo '#### use my | myr | mye ####' && mysql";
alias mysdg="mysql -uroot -h127.0.0.1 -e 'show databases;' |grep"
alias mysd="mysql -uroot -h127.0.0.1 -e 'show databases;'"
alias myst="mysql -uroot -h127.0.0.1 -e 'show tables;' $DATAB"
function mydes(){ mysql -uroot -h127.0.0.1 -e "desc $1;" $DATAB}
function mysel(){ mysql -uroot -h127.0.0.1 -e "select * from $1 limit 10;" $DATAB}
