#/bin/bash

# Argument 1: File name
# Behavior: Open specified script file in vim
#           If file does not exist, create it

if [ -z "$1" ]; then
    echo "Usage: scriptedit.sh <filename>"
    exit 1
fi

cd ~/code/scripts/

if [ ! -f "$1.sh" ]; then
    echo "Creating new script file: $1.sh"
    echo "#!/bin/bash" > "$1.sh"
    chmod +x "$1.sh"
fi

vim "$1.sh"
