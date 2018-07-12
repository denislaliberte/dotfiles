

function score(){
  git log --author="Denis Laliberte" --pretty=tformat: --numstat --no-merges $1 | \
  awk '{inserted+=$1; deleted+=$2; delta+=$1-$2; ratio=deleted/inserted} END {printf "Commit stats:\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", inserted, deleted, delta, ratio }'
}

# score_all -> deleted and added lines
function score_all() {
  number_of_commit
  echo application
  score $a
  echo test
  score $t
  echo all
  score
}

# code_churn -> churn of the last 15000 commits
function code_churn(){
  echo "churn of last ${2:-15000} commits"
  git show --format='%cr' HEAD~${2:-15000} | tee
  git log --all -n ${2:-15000} -M -C --name-only | \
    grep -E $1 | \
    sort | \
    uniq -c | \
    sort |  \
    tail -10
}
