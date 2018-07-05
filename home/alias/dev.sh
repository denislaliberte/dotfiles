function dddu(){ dev sv stop; dev down; nvm use 8.9.4; dev up; dev s}

function trash_railgun() { railgun rm-data;  dev reset-railgun; }

function trash_image_magick(){ brew remove --force $(brew list | grep 'imagemagick\|v8\|librsvg') --ignore-dependecies; }

function trash_image_gem() { gem uninstall $(gem list | grep 'image\|magick\|sassc') }

function trash_image() { trash_image_magick; trash_image_gem}

function reborn() { dev sv stop; dev down;  trash_railgun; nvm use 8.9.4; trash_image }

function devclone() {dev clone Shopify/$1; git checkout origin/master; git branch -D master; linkignore $1 }

function linkignore(){  ln -s $HOME/src/github.com/Shopify/.ignore $HOME/src/github.com/Shopify/$1/.ignore}

function fullreborn() { dev cd ${1:-shopify}; reborn; rm -rf **/node_modules && yarn cache clean; rm -rf ~/.gem; cd $HOME/src/github.com/Shopify; mv ${1:-shopify} ${1:-shopify}-$(date '+%Y%m%d-%H%M-%s'); devclone ${1:-shopify}; sudo shutdown -r now; }

function devclone(){ dev clone Shopify/${1:-shopify}; git checkout origin/master; git branch -D master}
alias dcs="dev cd shopify"
alias dcp="dev cd partners"
alias dci="dev cd identity"
alias u="dev up" # old dup # Install and start everything necessary for an app to run.

alias dt=select_path_dev_test
alias spdt=select_path_dev_test
function select_path_dev_test(){ dev test $(select_path $1 ${3:-1}) -n ${2:-/test/} }

alias dta="dev test"
function dev_server(){ dev open internal; dev server}
alias ds=dev_server
alias opn="dev open"
function dev_style(){ dev style --include-branch-commits }
alias stl=dev_style
