#!/bin/bash

set -x

# dependencies
yes | sudo apt-get install python make gcc libreadline-dev libselinux1-dev libssl-dev libncurses5-dev patch liblua50-dev libpam0g-dev libdmalloc-dev electric-fence g++-5-arm-linux-gnueabihf

# setup arm binutils for fiasco cross-compiling
sudo ln -s $(which arm-linux-gnueabihf-g++-5) /usr/local/binarm-linux-g++
sudo ln -s $(which arm-linux-gnueabihf-g++-5) /usr/local/bin/arm-linux-g++
sudo ln -s $(which arm-linux-gnueabihf-gcc-5) /usr/local/bin/arm-linux-gcc
sudo ln -s $(which arm-linux-gnueabihf-ld-5) /usr/local/bin/arm-linux-ld
sudo ln -s $(which arm-linux-gnueabihf-ld) /usr/local/bin/arm-linux-ld
sudo ln -s $(which arm-linux-gnueabihf-cpp-5) /usr/local/bin/arm-linux-cpp
sudo ln -s $(which arm-linux-gnueabihf-nm) /usr/local/bin/arm-linux-nm
sudo ln -s $(which arm-linux-gnueabihf-objcopy) /usr/local/bin/arm-linux-objcopy
sudo ln -s $(which arm-linux-gnueabihf-ar) /usr/local/bin/arm-linux-ar
sudo ln -s $(which arm-linux-gnueabihf-strip) /usr/local/bin/arm-linux-strip
  
# environment
echo 'export KCONFIG_CASE_STUDIES=/vagrant' > /home/vagrant/.bash_profile
echo 'export PATH=$KCONFIG_CASE_STUDIES/scripts:$PATH' >> /home/vagrant/.bash_profile

if [ ! -d "axtls_2_1_4" ]; then
    # source code
    # wget -O axTLS-2.1.4.tar.gz 'https://downloads.sourceforge.net/project/axtls/2.1.4/axTLS-2.1.4.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Faxtls%2Ffiles%2Flatest%2Fdownload%3Fsource%3Dfiles&ts=1516744347'
    if [ ! -d "axtls-code" ]; then
        tar -xvf /vagrant/cases/axtls_2_1_4/axTLS-2.1.4.tar.gz
    fi
    mv axtls-code axtls_2_1_4
fi

if [ ! -d "toybox_0_7_5" ]; then
    # git clone https://github.com/landley/toybox/
    # wget http://www.landley.net/toybox/downloads/toybox-0.7.5.tar.gz
    if [ ! -d "toybox-0.7.5" ]; then
        tar -xvf /vagrant/cases/toybox_0_7_5/toybox-0.7.5.tar.gz
    fi
    mv toybox-0.7.5 toybox_0_7_5
fi

if [ ! -d "busybox_1_28_0" ]; then
    # https://git.busybox.net/busybox
    # wget http://busybox.net/downloads/busybox-1.28.0.tar.bz2
    if [ ! -d "busybox-1.28.0" ]; then
        tar -xvf /vagrant/cases/busybox_1_28_0/busybox-1.28.0.tar.bz2
    fi
    mv busybox-1.28.0 busybox_1_28_0
fi

if [ ! -d "fiasco_17_10" ]; then
    if [ ! -d "fiasco-17.10" ]; then
        tar -xvf /vagrant/cases/fiasco_17_10/fiasco-17.10.tar.bz2
    fi
    mv fiasco-17.10 fiasco_17_10
fi
