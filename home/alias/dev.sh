alias dddu="dev sv stop; dev down; dev up; dev s"
function reborn() { dev cd shopify; dev sv stop; dev down;  railgun rm-data;  dev reset-railgun; cd $HOME/src/github.com/Shopify;  mv shopify shopify-$(date '+%Y%m%d-%H%M-%s');  dev clone shopify/shopify;  dev up;};
