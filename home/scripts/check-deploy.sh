#!/bin/bash
echo '## git fetch all'
git  fetch --all
echo '## git checkout remotes/prod/prod && git branch --no-merged'
git  checkout prod
git  branch -a --no-merged
echo '## liste des commits à merger (git log remotes/prod/prod..remotes/origin/stage)'
git  log --format='%h %an -- %s' remotes/origin/prod..remotes/origin/stage |cat
echo '## liste des fichier affecté par le merge (git diff remotes/prod/prod..remotes/origin/stage) '
git  diff --name-only remotes/origin/prod..remotes/origin/stage | cat
