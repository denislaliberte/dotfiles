alias hs=homesick
alias hd="homesick diff hc"
alias hlh="homesick link hc"
alias hph="homesick pull hc"
alias hst="homesick track"
alias hP="homesick push hc"
alias hcd="homesick cd"
alias hch="homesick cd hc"
alias hsg=homesick_grep
function homesick_grep() { grep -nr $1 ~/.homesick }
