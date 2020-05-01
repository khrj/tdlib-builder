# Copyright 2020 Khushraj Rathod
#
# This file is part of TDLibBuilder.
#
# TDLibBuilder is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# TDLibBuilder is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with TDLibBuilder.  If not, see <https://www.gnu.org/licenses/>.

cd ..
git clone https://github.com/openssl/openssl.git --depth=1 --branch=OpenSSL_1_1_1-stable
cd openssl
./config --prefix=/opt/openssl --openssldir=/usr/local/ssl -no-shared
make
sudo make install
cd ..
git clone https://github.com/tdlib/td.git
cd td
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/opt/openssl/ -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..
cmake --build . --target install
cd ..
cd ..
