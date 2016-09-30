alias xlf=xml_lint_format
function xml_lint_format(){ echo $1 | xmllint --format - }

