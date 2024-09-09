#!/opt/homebrew/bin/bash

cd ~/src/blog/
./hugow
rsync -av ./public blogserver:~/ --delete --exclude=.DS_Store

# add " to the commit message
msg="$1"

# Add all changes
git add .

# Commit changes
git commit -m "$msg"

# Push changes
git push origin master
