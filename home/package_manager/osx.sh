#!/bin/bash
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder
defaults write com.apple.finder CreateDesktop false; killall Finder
