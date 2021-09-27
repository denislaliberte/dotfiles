function headtail() { head -n "$((${2:-1} * 10))" $1 | tail -n 13; };
alias ht=headtail
