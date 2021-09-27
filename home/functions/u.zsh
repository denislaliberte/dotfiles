
# urs -> dev up rebase and server
function urs(){
  dev cd $1;
  ro;
  dev up;
  dev open app;
  dev s;
}
