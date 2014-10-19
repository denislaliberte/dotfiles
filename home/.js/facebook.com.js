var hide = function(id) {
  var element;
  element = document.getElementById(id);
  if( element ) element.style.display="none";
}

hide('leftCol');
hide('rightCol');
hide('pagelet_composer'); //todo:  fix this one 

var contentCol;
contentCol = document.getElementById('contentCol');
contentCol.style.marginLeft =0;
