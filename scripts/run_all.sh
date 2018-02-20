#!/bin/bash

(cd /home/vagrant/axtls_2_1_4 && /vagrant/scripts/driver.sh config axtls_2_1_4)
(cd /home/vagrant/axtls_2_1_4 && /vagrant/scripts/driver.sh build axtls_2_1_4)

(cd /home/vagrant/toybox_0_7_5 && /vagrant/scripts/driver.sh config toybox_0_7_5)
(cd /home/vagrant/toybox_0_7_5 && /vagrant/scripts/driver.sh build toybox_0_7_5)

(cd /home/vagrant/busybox_1_28_0 && yes '' | /vagrant/scripts/driver.sh config busybox_1_28_0)
(cd /home/vagrant/busybox_1_28_0 && yes '' | /vagrant/scripts/driver.sh build busybox_1_28_0)

(cd /home/vagrant/fiasco_17_10/src/kernel/fiasco && yes '' | /vagrant/scripts/driver.sh config fiasco_17_10)
(cd /home/vagrant/fiasco_17_10/src/kernel/fiasco && yes '' | /vagrant/scripts/driver.sh build fiasco_17_10)
