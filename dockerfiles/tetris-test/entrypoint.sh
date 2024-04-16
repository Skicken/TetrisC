#!/bin/bash
git clone https://github.com/Skicken/TetrisC
timestamp=`date +'%H:%M:%S-%d-%m-%Y'`
mkdir TetrisC/debug
cd TetrisC/debug
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake --build . > /log/debug_build_log_$timestamp
cd ..
/TetrisC/bin/check_block > /log/test_log_$timestamp