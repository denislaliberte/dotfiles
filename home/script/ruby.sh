#!/bin/bash
rvm install ruby-2.1.5
rvm use ruby-2.1.5
rvm gemset create dev
rvm gemset use dev
gem install bundle
bundle install
