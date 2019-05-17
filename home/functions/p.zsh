# git push

# p -> git Push current branch
function p(){
  current_branch=$( git rev-parse --abbrev-ref HEAD)
  echo "git push origin $current_branch --force # be careful with the --force"
  git_log_short origin/master..HEAD
  dev_style
  git push origin $current_branch
}
