# dev
# data

# gdl 1 branch -> Get the Data in the note at the Line 1 with the key branch
alias gdl=get.data.line
function get.data.line() {
  value=$(sed "$1!d" $note | pyp 'p.split("---")[1]' | yq r - $2)
  if [ $value != null ]
  then
    echo $value
  else
    echo $3
  fi
}



# dddu -> dev down dev up
function dddu(){
  dev sv stop
  dev down
  nvm use 8.9.4
  dev up
  dev s
}

function trash_railgun() {
  railgun rm-data
  dev reset-railgun
}

function trash_image_magick(){
  brew remove --force $(brew list | grep 'imagemagick\|v8\|librsvg') --ignore-dependecies
}

function trash_image_gem() {
  gem uninstall $(gem list | grep 'image\|magick\|sassc')
}

function trash_image() {
  trash_image_magick
  trash_image_gem
}

function reborn() {
  open https://www.calm.com/breathe
  dev sv stop
  dev down
  trash_railgun
  nvm use 8.9.4
  trash_image
}

function devclone() {
  dev clone Shopify/$1
  git checkout origin/master
  git branch -D master
  linkignore $1
}

function linkignore(){
  ln -s $HOME/src/github.com/Shopify/.ignore $HOME/src/github.com/Shopify/$1/.ignore
}

function fullreborn() {
  dev cd ${1:-shopify}
  reborn
  rm -rf **/node_modules
  yarn cache clean
  rm -rf ~/.gem
  cd $HOME/src/github.com/Shopify
  mv ${1:-shopify} ${1:-shopify}-$(date '+%Y%m%d-%H%M-%s')
  devclone ${1:-shopify}
  sudo shutdown -r now
}

function devclone(){
  dev clone Shopify/${1:-shopify}
  git checkout origin/master
  git branch -D master
}

function dev_server(){
  dev open internal
  dev server
}

alias ds=dev_server
function dev_style(){ dev style --include-branch-commits }
alias stl=dev_style
