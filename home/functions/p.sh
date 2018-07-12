# git push

# p -> git Push current branch
function p(){
  current_branch=$( git rev-parse --abbrev-ref HEAD)
  echo "git push origin $current_branch --force # be careful with the --force"
  dev_style
  git_log_short origin/master..HEAD
  git push origin $current_branch
  dev open pr
}
