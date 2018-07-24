# memo

# em -> Edit Memo
# em memo -> Edit Memo ~/memo/memeo.md
function em(){ vim $HOME/memo/$(date +%Y/%m)/${1:-memo}.md }
