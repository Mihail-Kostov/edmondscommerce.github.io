#!/bin/bash
#set -e;
set -x;
cd /opt/Projects/edmondscommerce.github.io/
git checkout source;
if [ ! -d _deploy/.git ]; then
  bundle exec rake setup_github_pages;
fi
bundle exec rake integrate
git add -A
git commit -am 'commiting the source'
git pull origin source
git push origin source
cd _deploy
git pull origin master
git checkout origin/master .
git commit -am "Pulled remote master"
cd ../
bundle exec rake gen_deploy
bundle exec rake notify
