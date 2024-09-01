#!/opt/homebrew/bin/bash

cd ~/src/blog/
hugo
cd ./public/

# add " to the commit message
msg="$1"

# Add all changes
git add .

# Commit changes
git commit -m "$msg"

# Push changes
git push origin master

cd ../

git add .
git commit -m "$msg"
git push origin master
