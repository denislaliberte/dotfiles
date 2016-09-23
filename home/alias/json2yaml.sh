function vjay(){ file_name=$(echo $1 | pyp se) ;json2yaml -s $file_name.json ; vim $file_name.yaml ; js-yaml $file_name.yaml ;yaml2json -s $file_name.yaml ; cat $file_name.yaml ; cat $file_name.json}
