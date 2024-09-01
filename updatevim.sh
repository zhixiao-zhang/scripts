#!/bin/bash
cd ~/src/vim/src/

arch=$(uname -s)

if [ $arch == "Darwin" ]; then
  lua_prefix="/opt/homebrew/include/lua5.4/"
else
  lua_prefix="/usr/include/lua5.4/"
fi

# Update the source code
git pull
# Configure
./configure \
  --enable-luainterp=yes \
  --enable-python3interp=yes \
  --with-lua-prefix=$lua_prefix \
  --with-x \
  --enable-multibyte \
  --enable-terminal \
  --enable-largefile \
  --disable-netbeans

make -j $(nproc)
sudo make install
