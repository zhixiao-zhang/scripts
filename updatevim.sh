#!/bin/bash

ARCH=$(uname -s)

if [ $ARCH == "Darwin" ]; then
  LUA_PREFIX="/opt/homebrew/include/lua5.4/"
  SOURCE_DIR="/Users/$(whoami)/src/vim/src/"
  with_x=""
  export CC="clang"
else
  LUA_PREFIX="/usr/include/lua5.4/"
  SOURCE_DIR="/home/$(whoami)/src/vim/src/"
  with_x="--with-x"
fi

cd $SOURCE_DIR
# Update the source code
git pull
# Configure
./configure \
  --enable-luainterp=yes \
  --enable-python3interp=yes \
  --with-lua-prefix=$LUA_PREFIX \
  --enable-multibyte \
  --enable-terminal \
  --enable-largefile \
  --disable-netbeans \
  $with_x

make -j $(nproc)
sudo make install
