alias gR="grep"
alias gr="grep"
alias gnr="grep -nr"
function gnri() { grep -nri $1 ; grep -lri $1 | tee path.ignore }
function gri(){ grep -lri $1 | tee path.ignore }
alias vp='vim_path'
function vim_path() { vim -O $(head -${1:-1} path.ignore) ${@:2}}
alias pp='pop_path'
function pop_path() { head -1 path.ignore;sed -i "1d" path.ignore }
alias hp='head_path'
function head_path() {head -3 path.ignore}
alias vglri='vim_grep_recur_case_insensitive'
alias vgnri='vim_grep_recur_case_insensitive'
alias vgri='vim_grep_recur_case_insensitive'
function vim_grep_recur_case_insensitive(){ vim -O $(grep -lri $1)}
alias gv="grep -v"
alias gvc="grep -v '\/\/\|\#'"
