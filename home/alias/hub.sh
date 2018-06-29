alias hpr=hub_pull_request
function hub_pull_request(){ hub pull-request -a denislaliberte -r ${1:-'itarato,veenitmalik'} -l ${2:-'pricing/features,Component: Pricing'} -F $note -e -o $*; }
alias hi=hub_issue
function hub_issue() {  hub issue -a denislaliberte -f '%i  |  %U  |  %l  |  %t%n' --include-pulls -l 'in progress' }
