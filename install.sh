#!/bin/bash

wget -P /tmp http://download.virtualbox.org/virtualbox/4.3.8/virtualbox-4.3_4.3.8-92456~Ubuntu~raring_amd64.deb
wget -P /tmp http://download.virtualbox.org/virtualbox/4.3.8/VBoxGuestAdditions_4.3.8.iso
sudo dpkg -i /tmp/virtualbox-4.3_4.3.8-92456~Ubuntu~raring_amd64.deb
sudo mkdir /media/iso
sudo mount -o loop /tmp/VBoxGuestAdditions_4.3.8.iso /media/iso

sudo apt-get install vagrant ruby gem

vagrant plugin install vagrant-hostmanager
vagrant plugin install vagrant-omnibus


