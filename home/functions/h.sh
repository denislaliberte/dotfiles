# hpr -> gitHub open Pull Request
# hpr bob 'in progress' -> gitHub open Pull Request with bob as reviewer and  the label in progress
function hpr(){
  hub pull-request -a denislaliberte -r ${1:-'itarato,veenitmalik'} -l ${2:-'pricing/features,Component: Pricing'} -F $note -e -o $*
}

# hi -> gitHub list Issues
function hi() {
  hub issue -a denislaliberte -f '%i  |  %U  |  %l  |  %t%n' --include-pulls -l 'in progress'
}

# hic -> gitHub Issue Create
# hic pricing/features,pricing/bogo denislaliberte -> will create a issue with the labels and the assigne, edit with vim and open in the browser
function hic() {
  hub issue create -o --edit -a ${2:-denislaliberte} -l ${1:-pricing/features}
}

# hl -> gitHub list Label
function hl() {
  hub issue labels --color | \
    grep ${1:-pricing}
}
