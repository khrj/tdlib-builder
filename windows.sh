choco install git.portable
export PATH="/c/tools/git/bin/:$PATH"
chocolatey install gperf php openssl
git clone https://github.com/tdlib/td.git
cd td
git checkout v1.6.0
git clone https://github.com/Microsoft/vcpkg.git
cd vcpkg
./bootstrap-vcpkg.bat
./vcpkg.exe install zlib:x64-windows
cd ..
rm -rf build
mkdir build
cd build
cmake -A x64 -DCMAKE_INSTALL_PREFIX:PATH=../tdlib -DCMAKE_TOOLCHAIN_FILE:FILEPATH=../vcpkg/scripts/buildsystems/vcpkg.cmake ..
cmake --build . --target install --config Release
cd ..
cd ..
mv $TRAVIS_BUILD_DIR/td/tdlib/bin/tdjson.dll $TRAVIS_BUILD_DIR/td/tdlib/bin/libtdjson.dll
