alias c2s=command2script
function command2script() {echo "$(fc -ln -1)" | tee -a .ignore/script.sh }
