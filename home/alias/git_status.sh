alias gs=show_path_git_status
function show_path_git_status() { git status -sb; echo '###'; git_status_files > .ignore/git_status.txt ; select_path | grep -Ef .ignore/git_status.txt }
alias spdm=show_path_git_diff_master
function show_path_git_diff_master() { git diff origin/master --name-only |pyp 'pp[1:] | w[-1]' > .ignore/git_status.txt ; select_path | grep -Ef .ignore/git_status.txt }
