#!/bin/bash --login
rvm install ruby-2.1.5
rvm use ruby-2.1.5
rvm gemset create dev
rvm use ruby-2.1.5@dev
echo "$ ru ruby-2.1.5@dev"
