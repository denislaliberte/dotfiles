alias py="python"
alias fl="fab list"
alias pys=" open http://0.0.0.0:8000 && python -m SimpleHTTPServer 8000"
alias pyw="pywatch"
function log_time() { pyw "clear && grep -n '^0 ' $1 | sort -t '|' -k6 -k2  &&  awk 'BEGIN { FS = \"|\" } ; { if(\$1==0){unlog+=\$5;total+=\$5}; if(\$4==1){bill+=\$5}; if(\$1==1){total+=\$5};  } END{print bill, \"/\",unlog,\"/\",total}' $1 &&  echo \" $((( $(date +%u) * 8 / 100.0 ) * 80)) - $((( $(date +%u) * 8 / 100.0 ) * 85)) / $(( $(date +%u) * 8 ))\";" $1 }

