alias spdm=show_path_git_diff_master
function show_path_git_diff_master() { git diff origin/master --name-only |pyp 'pp[1:] | w[-1]' > .ignore/git_status.txt ; select_path | grep -Ef .ignore/git_status.txt }
