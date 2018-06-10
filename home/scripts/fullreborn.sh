#!/usr/bin/env zsh

cd $HOME/src/github.com/Shopify/shopify
dev sv stop

dev down
railgun rm-data
dev reset-railgun

cd $HOME/src/github.com/Shopify
mv shopify shopify-$(date '+%Y%m%d-%H%M-%s')
dev clone Shopify/shopify
git checkout origin/master
git branch -D master
ln -s /Users/denislaliberte/src/github.com/Shopify/.ignore /Users/denislaliberte/src/github.com/Shopify/shopify/.ignore

rm -rf **/node_modules && yarn cache clean
nvm use 8.9.4
brew remove --force $(brew list | grep imagemagick) --ignore-dependecies
rm -rf ~/.gem

dev up

sudo shutdown -r now
