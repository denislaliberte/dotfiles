echo "db: $db tb: $tb"
function mysql_db() { mysql $db $1; }
alias m="mysql $db"
alias my="m"
alias me="mysql $db -e "
alias mdg="mysql -e 'show databases;' |grep"
alias mysd="mysql -e 'show databases;'"
alias mt="mysql -e 'show tables;' $db | grep"
alias mcd="mysql  -e \"CREATE DATABASE $1\""
alias mds="mysql -e \"desc $tb;\" $db;"
alias ms="mysql -e \"select * from $tb limit 10;\" $db; "
function mysql_update() { mysql -e "update $tb $1" $db ; }
alias mup="mysql_update"
export _s="select"
