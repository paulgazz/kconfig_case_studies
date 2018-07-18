#!/bin/bash

set -x

sudo apt-get update

# dependencies for building axtls, toybox, fiasco
yes | sudo apt-get install python make gcc libreadline-dev libselinux1-dev libssl-dev libncurses5-dev patch liblua50-dev libpam0g-dev libdmalloc-dev electric-fence libdlib-dev libaudit-dev linux-source-4.4.0 g++-mips-linux-gnu

# cross-compilation tools for fiasco
yes | sudo apt-get install g++-5-arm-linux-gnueabihf g++-aarch64-linux-gnu 

# dependencies for building linux
yes | sudo apt-get install libelf-dev 

# allow user to add to /usr/local
sudo chgrp -R vagrant /usr/local; sudo chmod -R g+w /usr/local

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

# environment
echo 'export KCONFIG_CASE_STUDIES=/vagrant' > /home/vagrant/.bash_profile
echo 'export PATH=$KCONFIG_CASE_STUDIES/scripts:$PATH' >> /home/vagrant/.bash_profile
# prevent locale errors
echo "export LC_ALL=en_US.UTF-8" >> /home/vagrant/.bash_profile

# get source code and setup repos
cd /home/vagrant

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

    cd toybox_0_7_5/
    scripts/genconfig.sh
    cd /home/vagrant
fi

if [ ! -d "busybox_1_28_0" ]; then
    # https://git.busybox.net/busybox
    # wget http://busybox.net/downloads/busybox-1.28.0.tar.bz2
    if [ ! -d "busybox-1.28.0" ]; then
        tar -xvf /vagrant/cases/busybox_1_28_0/busybox-1.28.0.tar.bz2
    fi
    mv busybox-1.28.0 busybox_1_28_0

    cd busybox_1_28_0/
    make allyesconfig
    cd /home/vagrant
fi

if [ ! -d "fiasco_17_10" ]; then
    if [ ! -d "fiasco-17.10" ]; then
        tar -xvf /vagrant/cases/fiasco_17_10/fiasco-17.10.tar.bz2
    fi
    mv fiasco-17.10 fiasco_17_10

    cd fiasco_17_10/src/kernel/fiasco    
    tool/gen_kconfig src/Kconfig my_kconfig $(find src/ | grep Kconfig | grep -v src/Kconfig)
    cd /home/vagrant
fi

if [ ! -d "uClibc-ng_1_0_29" ]; then
    if [ ! -d "uClibc-ng-1.0.29" ]; then
        tar -xvf /vagrant/cases/uClibc-ng_1_0_29/uClibc-ng-1.0.29.tar.xz
    fi
    mv uClibc-ng-1.0.29 uClibc-ng_1_0_29
    
    tar -C /home/vagrant -xvf /usr/src/linux-source-4.4.0.tar.bz2
    make -C /home/vagrant/linux-source-4.4.0 INSTALL_HDR_PATH=/home/vagrant/linux-headers headers_install
fi

if [ ! -d "buildroot_2018_02" ]; then
    if [ ! -d "buildroot-2018.02" ]; then
        tar -xvf /vagrant/cases/buildroot_2018_02/buildroot-2018.02.tar.gz
    fi
    mv buildroot-2018.02 buildroot_2018_02
fi

