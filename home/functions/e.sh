# e file.txt -> Edit file.txt
function e(){
  ${2:-vim} -O $1 ${@:3}
}
