
function phpinfo() { echo '<?php echo "phpinfo:"; phpinfo();' > _phpinfo.php && open http://$1/_phpinfo.php }

## artisan ##
alias ada="artisan dump-autoload"
alias am="artisan migrate"
alias amm="artisan migrate:make"
alias amr="artisan migrate:rollback"

## behat ##
### BDD for PHP ###
alias bb="bin/behat"
alias bbe="bin/behat --expand"
alias bdl="bb -dl"
alias bsf="bin/behat --story-syntax --lang=fr"

## php ##
alias phl="php -l"
alias phi="php -i"
alias phig="php -i |grep"
alias pa="php -a"

alias pu="phpunit"

alias pf="php-cs-fixer fix --verbose"
## phpstorm ##
alias sto="pstorm . "
## phpspec ##
alias bp="bin/phpspec"
alias bpr="bin/phpspec run"
alias bpd="bin/phpspec desc"

#wp : wordpress cli 
alias wpa="wp plugin activate"
alias wpd="wp plugin deactivate"
alias wpp="wp plugin"
alias wps="wp plugin search"
alias wpl="wp plugin list"
alias wpa="wp plugin activate"

alias wef="wp eval-file"

alias wpc="cd wp-content"
alias wpt="cd wp-content/themes"
alias wpp="cd wp-content/plugins"
alias wpm="cd wp-content/mu-plugins"

alias csd="cd sites/default"
alias csam="cd sites/all/modules"
alias csat="cd sites/all/themes"

# Drush
### A command line shell and scripting interface for Drupal. ###
# http://drushcommands.com/
# http://www.drush.org/

alias d="drush"
alias drupal="drush"
alias dca="drush cache-clear all" # clear the cache again and again
alias dg="drushgrep" # custom function to find a drush command ex :$drush | grep command
alias dag="drushaliasgrep" # search this file
alias duu="drush user-login --uri=" # get the reset password link for the user 1 usage: duu http://host.local uli
alias duy="drush updatedb -y" # run the hook_update fucntions
alias dwl="drush watchdog-list --fields=date,message"

## drush features - Export and import configuration ##
alias dfl="drush features-list" # get the list of all features and their state
alias dfr="drush features-revert" # import the configuration of a feature file to the drupal database
alias dfra="drush features-revert-all"
alias dfd="drush features-diff" # make a diff between the database configuration and the feature file

## drush project manager - manage plugin and theme ##
alias dpl="drush pm-list" #list modules
alias dpg="drushpmlgrep" # custom function to find module ex: $ drush pml | grep my_module
alias ddl="drush pm-download" #download a module
alias ddr="drush devel-reinstall -y" #reinstall un module, need the devel module
alias ddy="drush pm-disable -y" #disable un module
alias dey="drush pm-enable -y" #enable a module

## drush sql ##
alias dsc="drush sql-connect -l" # return the mysql connection string
alias dsq="drush sql-query" # run a query on the database 
alias dsd="drush sql-dump" # dump the database

## drush variables
alias dvg="drush variable-get" # find a variable key and value ex : $ dvg temp
alias dvs="drush variable-set" # set the value of a variable ex dvs file_temporary_path '/tmp'

## functions

function drushaliasgrep()
{
  cat ~/alias/drush.sh | grep "$*"
}

function drushpmlgrep()
{
  drush pm-list | grep "$*"
}

function drushgrep()
{
  drush | grep "$*"
}
