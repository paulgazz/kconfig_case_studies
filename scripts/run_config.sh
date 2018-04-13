#!/bin/bash

(cd /home/vagrant/axtls-code && /vagrant/scripts/driver.sh config axtls_2_1_4)
(cd /home/vagrant/toybox-0.7.5 && /vagrant/scripts/driver.sh config toybox_0_7_5)
(cd /home/vagrant/busybox-1.28.0 && yes '' | /vagrant/scripts/driver.sh config busybox_1_28_0)
(cd /home/vagrant/fiasco-17.10/src/kernel/fiasco && yes '' | /vagrant/scripts/driver.sh config fiasco_17_10)
