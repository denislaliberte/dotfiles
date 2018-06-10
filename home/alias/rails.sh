function graphql_schema_dump_break(){ env BREAK_SCHEMA=merchant bin/rails graphql:schema:dump }
alias gsdb=graphql_schema_dump_break
function graphql_schema_dump(){ bin/rails graphql:schema:dump }
alias gsd=graphql_schema_dump
