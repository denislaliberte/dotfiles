# homesick

# hsm test -> get all line from HomeSick dotfiles that Match /test/
function hsm() { grep -r $1 ~/.homesick/repos/dotfiles/home }
