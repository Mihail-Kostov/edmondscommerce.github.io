#!/bin/bash
cd /opt/Projects/edmondscommerce.github.io/
git add -A
git commit -am 'commiting the source'
git pull origin source
git push origin source
cd _deploy
git pull origin master
cd ../
rake gen_deploy
