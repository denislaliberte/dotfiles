# memo

# em -> Edit Memo
# em memo -> Edit Memo ~/memo/memeo.md
function em(){
  mkdir -p "$HOME/memo/$(date +%Y/%m)/"
  vim "$HOME/memo/$(date +%Y/%m)/${1:-readme}.md"
}
