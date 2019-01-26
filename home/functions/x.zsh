# Exercism

# xcd -> eXercism Change Directory to root and open the browser to the default ruby track
# xcd rust -> eXercism Change Directory to root and open the brow to the rust track
function xcd (){
  open "https://exercism.io/my/tracks/${1:-ruby}"
  cd $(exercism workspace)
  ls ${1:-ruby}
}

# dx Strain -> Download Exercism strain
# dx Strain rust -> Download Exercism Strain for the rust track
function dx() {
   exercism download -e $1 -t ${2:-ruby}
}
