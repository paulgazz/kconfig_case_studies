#!/bin/bash

set -x

sudo apt-get update

# dependencies for building axtls, toybox, fiasco
yes | sudo apt-get install python make gcc libreadline-dev libselinux1-dev libssl-dev libncurses5-dev patch liblua50-dev libpam0g-dev libdmalloc-dev electric-fence libdlib-dev libaudit-dev linux-source-4.4.0 g++-mips-linux-gnu

# cross-compilation tools for fiasco
yes | sudo apt-get install g++-5-arm-linux-gnueabihf g++-aarch64-linux-gnu 

# dependencies for building linux
yes | sudo apt-get install libelf-dev 

# dependencies for java program to extract gcc args
sudo apt-get install openjdk-8-jre-headless

# setup arm binutils for fiasco cross-compiling
sudo ln -s $(which arm-linux-gnueabihf-g++-5) /usr/local/bin/arm-linux-g++
sudo ln -s $(which arm-linux-gnueabihf-g++-5) /usr/local/bin/arm-linux-g++
sudo ln -s $(which arm-linux-gnueabihf-gcc-5) /usr/local/bin/arm-linux-gcc
sudo ln -s $(which arm-linux-gnueabihf-ld-5) /usr/local/bin/arm-linux-ld
sudo ln -s $(which arm-linux-gnueabihf-ld) /usr/local/bin/arm-linux-ld
sudo ln -s $(which arm-linux-gnueabihf-cpp-5) /usr/local/bin/arm-linux-cpp
sudo ln -s $(which arm-linux-gnueabihf-nm) /usr/local/bin/arm-linux-nm
sudo ln -s $(which arm-linux-gnueabihf-objcopy) /usr/local/bin/arm-linux-objcopy
sudo ln -s $(which arm-linux-gnueabihf-objdump) /usr/local/bin/arm-linux-objdump
sudo ln -s $(which arm-linux-gnueabihf-ar) /usr/local/bin/arm-linux-ar
sudo ln -s $(which arm-linux-gnueabihf-strip) /usr/local/bin/arm-linux-strip

# setup mips binutils for fiasco cross-compiling
sudo ln -s $(which mips-linux-gnu-g++) /usr/local/bin/mips-linux-g++
sudo ln -s $(which mips-linux-gnu-g++) /usr/local/bin/mips-linux-g++
sudo ln -s $(which mips-linux-gnu-gcc) /usr/local/bin/mips-linux-gcc
sudo ln -s $(which mips-linux-gnu-ld) /usr/local/bin/mips-linux-ld
sudo ln -s $(which mips-linux-gnu-ld) /usr/local/bin/mips-linux-ld
sudo ln -s $(which mips-linux-gnu-cpp) /usr/local/bin/mips-linux-cpp
sudo ln -s $(which mips-linux-gnu-nm) /usr/local/bin/mips-linux-nm
sudo ln -s $(which mips-linux-gnu-objcopy) /usr/local/bin/mips-linux-objcopy
sudo ln -s $(which mips-linux-gnu-ar) /usr/local/bin/mips-linux-ar
sudo ln -s $(which mips-linux-gnu-strip) /usr/local/bin/mips-linux-strip
