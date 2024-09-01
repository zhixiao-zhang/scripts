#!/bin/bash

ARCH=$(uname -s)

if [ $ARCH == "Darwin" ]; then
  LUA_PREFIX="/opt/homebrew/include/lua5.4/"
  SOURCE_DIR="/Users/$(whoami)/src/vim/src/"
else
  LUA_PREFIX="/usr/include/lua5.4/"
  SOURCE_DIR="/home/$(whoami)/src/vim/src/"
fi

cd $SOURCE_DIR
# Update the source code
git pull
# Configure
./configure \
  --enable-luainterp=yes \
  --enable-python3interp=yes \
  --with-lua-prefix=$LUA_PREFIX \
  --with-x \
  --enable-multibyte \
  --enable-terminal \
  --enable-largefile \
  --disable-netbeans

make -j $(nproc)
sudo make install
