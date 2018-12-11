# tmx -> open a session and add a todo to schedule shutdown
function tmx() {
  date -v+8H +%H%m | pyp "'- [ ] Schedule shutdown to: ' +p" | tee -a $w/readme.md
  tmux;
}
