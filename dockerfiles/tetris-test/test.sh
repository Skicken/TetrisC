#!/bin/bash
git clone https://github.com/lucadellalib/TetrisC
timestamp=`date +'%H:%M:%S-%d-%m-%Y'`
mkdir TetrisC/build
cd TetrisC/build
cmake ..
make > /log/build_log_$timestamp
cd ..
/TetrisC/bin/check_block > /log/test_log_$timestamp