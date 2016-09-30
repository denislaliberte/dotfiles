alias ipg=init_postrgesql
function init_postrgesql() { sudo /etc/init.d/postgresql $1}
alias pgd=pg_dump
alias pgr=pg_restore
export ssn='SELECT schema_name from information_schema.schemata' # alternatively '\dn'
export sstn='SELECT table_schema,table_name FROM information_schema.tables ORDER BY table_schema,table_name;'
