#!/bin/bash

set -x

# dependencies
yes | sudo apt-get install python make gcc

# environment
echo 'export KCONFIG_CASE_STUDIES=/vagrant' > /home/vagrant/.bash_profile
echo 'export PATH=$KCONFIG_CASE_STUDIES/scripts:$PATH' >> /home/vagrant/.bash_profile

# source code
# wget -O axTLS-2.1.4.tar.gz 'https://downloads.sourceforge.net/project/axtls/2.1.4/axTLS-2.1.4.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Faxtls%2Ffiles%2Flatest%2Fdownload%3Fsource%3Dfiles&ts=1516744347'
tar -xvf /vagrant/cases/axtls_2_1_4/axTLS-2.1.4.tar.gz

# git clone https://github.com/landley/toybox/
# wget http://www.landley.net/toybox/downloads/toybox-0.7.5.tar.gz
tar -xvf /vagrant/cases/toybox_0_7_5/toybox-0.7.5.tar.gz

# https://git.busybox.net/busybox
# wget http://busybox.net/downloads/busybox-1.28.0.tar.bz2
tar -xvf /vagrant/cases/busybox_1_28_0/busybox-1.28.0.tar.bz2

tar -xvf /vagrant/cases/fiasco_17_10/fiasco-17.10.tar.bz2
