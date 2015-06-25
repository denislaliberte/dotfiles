
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
## composer ##
### Dependency Manager for PHP ###
alias cmp="composer"

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

alias wpc="cd wp-content"
alias wpt="cd wp-content/themes"
alias wpp="cd wp-content/plugins"
alias wpm="cd wp-content/mu-plugins"

alias csd="cd sites/default"
alias csam="cd sites/all/modules"
alias csat="cd sites/all/themes"
