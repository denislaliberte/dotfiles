# cl* - > git CLean

# cl* -> CLean
# cld -> git CLean Dry run
function cld(){
  git clean -nd
  echo clf
}

# clf -> git Clean Force
function clf(){
  git clean -fd
}
