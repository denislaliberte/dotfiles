# package manager

function package_log() { echo "$1 $2" >> ~/package_manager/$1.sh && eval "$1 $2" }
