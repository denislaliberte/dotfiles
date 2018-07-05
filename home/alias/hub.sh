alias hpr=hub_pull_request
function hub_pull_request(){ hub pull-request -a denislaliberte -r ${1:-'itarato,veenitmalik'} -l ${2:-'pricing/features,Component: Pricing'} -F $note -e -o $*; }
alias hi=hub_issue
function hub_issue() {  hub issue -a denislaliberte -f '%i  |  %U  |  %l  |  %t%n' --include-pulls -l 'in progress' }
alias ghc="hub create" #git hub create
alias hc="hub clone"
alias hcr="hub create"
alias hl=hub_label
function hub_label() { hub issue labels --color | grep ${1:-pricing} }
alias hic=hub_issue_create # ex. `hic pricing/features,pricing/bogo denislaliberte` -> will create a issue with the labels and the assigne, edit with vim and open in the browser
function hub_issue_create() {  hub issue create -o --edit -a ${2:-denislaliberte} -l ${1:-pricing/features} }
