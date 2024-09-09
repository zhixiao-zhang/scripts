#!/bin/bash

cd ~/src/blog/

# Get current time
time=$(date +%H)

# If time is less than 6, then I want to write yesterday's diary
if [ $time -lt 6 ]; then
    date=$(date -v-1d +%y-%m-%d)
else
    date=$(date +%y-%m-%d)
fi

# Create a new diary file if it doesn't exist
if [ ! -f content/post/junk/$date.md ]; then
    hugo new content content/post/junk/$date.md
fi

# Open the post in vim
/Applications/Typora.app/Contents/MacOS/Typora content/post/junk/$date.md
