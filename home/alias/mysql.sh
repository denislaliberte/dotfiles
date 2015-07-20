echo "db: $db tb: $tb"
function mysql_set_table() { echo "export tb=$1" >> $var && source $var && source ~/alias/mysql.sh; }
alias mst="mysql_set_table"
function mysql_set_database() { echo "export db=$1" >> $var && source $var && source ~/alias/mysql.sh; }
alias msd="mysql_set_database"
function mysql_db() { mysql $db $1; }
alias m="mysql $db"
alias my="m"
alias me="mysql $db -e "
alias mdg="mysql -e 'show databases;' |grep"
alias mysd="mysql -e 'show databases;'"
alias mt="mysql -e 'show tables;' $db | grep"
alias mcd="mysql  -e \"CREATE DATABASE $1\""
function mydes() { mysql -e "desc $1;" $db; }
function mysql_select() { mysql -e "select * from $tb limit 10;" $db; }
alias ms="mysql_select"
function mysql_update() { mysql -e "update $tb $1" $db ; }
alias mup="mysql_update"
