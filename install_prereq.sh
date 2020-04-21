#!/bin/bash
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

sudo yum -y install gcc nasm tk
sudo yum -y install gcc-c++ glibc-devel glibc-static libstdc++* glibc.i686
wget http://www.gnu.org/software/xorriso/xorriso-1.5.2.tar.gz
tar -zxvf xorriso-1.5.2.tar.gz
cd xorriso-1.5.2/
./configure
make
sudo make install
echo Finished enviornment setup for personal os successfully



