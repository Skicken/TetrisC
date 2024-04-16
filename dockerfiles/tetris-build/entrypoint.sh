#!/bin/bash
git clone https://github.com/Skicken/TetrisC
timestamp=`date +'%H:%M:%S-%d-%m-%Y'`
mkdir TetrisC/release
cd TetrisC/release
cmake -DCMAKE_BUILD_TYPE=release ..
cmake --build . > /log/release_build_log_$timestamp
cd ..
build_version="1.0.0"
if [[ -v VERSION ]]; then
    echo "Found version to set "$VERSION
    build_version=$VERSION
fi
rm /app/* -r
cp bin/* /app/ -r
tar -cf /build/build_$build_version bin