#add validation to check if 1 is a directory
#support empty expression search
function code_survey(){
  for i in $1/*; do
    echo -n "$i: "
    awk '{ print tolower($0) }' $i  \
      | grep -vE "(\*|#|\/\/)" \
      | sed "s/$2/X/g" \
      | sed 's/[^{};]//g' \
      | sed "s/;/./g" \
      | sed "s/X/_$2_/g" \
      | tr -d '\n'
    echo 
  done
}

function code_survey_symbol(){
      #| sed "s/[[:<:]]$1[[:>:]]/X/g" \
      #| sed "s/X/ _$1_ /g" \
  for i in $1/*; do
    echo -n "$i: "

    awk '{ print tolower($0) }' $i  \
      | grep -vE "(\*|#|\/\/)" \
      | sed "s/[[:<:]]$2[[:>:]]/X/g" \
      | sed "s/[[:<:]]class[[:>:]]/C/g" \
      | sed "s/[[:<:]]function[[:>:]]/F/g" \
      | sed "s/[[:<:]]interface[[:>:]]/I/g" \
      | sed "s/[[:<:]]trait[[:>:]]/T/g" \
      | sed 's/[^{};CFXIT]//g' \
      | sed "s/C/ class/g" \
      | sed "s/F/ F/g" \
      | sed "s/T/ trait/g" \
      | sed "s/I/ interface/g" \
      | sed "s/X/_$2_/g" \
      | sed "s/;/./g" \
      | tr -d '\n'
    echo 
  done
}

function code_survey_symbol_controle(){
  for i in $1/*; do
    echo -n "$i: "

    awk '{ print tolower($0) }' $i  \
      | grep -vE "(\*|#|\/\/)" \
      | sed 's/\".*\"//' \
      | sed "s/\'.*\'//" \
      | sed "s/[[:<:]]$2[[:>:]]/X/g" \
      | sed "s/[[:<:]]class[[:>:]]/C/g" \
      | sed "s/[[:<:]]function[[:>:]]/F/g" \
      | sed "s/[[:<:]]interface[[:>:]]/I/g" \
      | sed "s/[[:<:]]trait[[:>:]]/T/g" \
      | sed "s/[[:<:]]use[[:>:]]/U/g" \
      | sed "s/[[:<:]]if[[:>:]]/I~/g" \
      | sed "s/[[:<:]]else[[:>:]]/E/g" \
      | sed "s/[[:<:]]elseif[[:>:]]/E~/g" \
      | sed "s/[[:<:]]switch[[:>:]]/S/g" \
      | sed "s/[[:<:]]while[[:>:]]/W/g" \
      | sed "s/[[:<:]]foreach[[:>:]]/F~~/g" \
      | sed "s/[[:<:]]for[[:>:]]/F~/g" \
      | sed "s/[[:<:]]return[[:>:]]/R/g" \
        \
      | sed 's/[^{};CFITESWRUX~]//g' \
        \
      | sed "s/I~/if/g" \
      | sed "s/C/ class/g" \
      | sed "s/F/ F/g" \
      | sed "s/T/ trait/g" \
      | sed "s/I/ interface/g" \
      | sed "s/E/else/g" \
      | sed "s/E~/elseif/g" \
      | sed "s/S/switch/g" \
      | sed "s/W/while/g" \
      | sed "s/U;/u/g" \
      | sed "s/U/u/g" \
      | sed "s/F~~/foreach/g" \
      | sed "s/F~/for/g" \
      | sed "s/R;/r/g" \
      | sed "s/R/r/g" \
      | sed "s/X/_$2_/g" \
      | sed "s/;/./g" \
      | tr -d '\n'
    echo 
  done
}

function code_survey_function(){
  grep -l $2 $1/* \
    | xargs grep --colour=always "class\|function\|$1"
}

function code_survey_function_comments(){
  grep -l $2 $1/* \
    | xargs grep -nr --colour=always "class\|function\|\*\|#\|\/\/\|$1"
}
