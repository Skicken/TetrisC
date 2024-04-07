#!/bin/bash
git clone https://github.com/lucadellalib/TetrisC
mkdir TetrisC/build
cd TetrisC/build
cmake ..
timestamp=`date +'%H:%M:%S-%d-%m-%Y'`
make 
cd ..
cp bin /out/$timestamp -r
bash