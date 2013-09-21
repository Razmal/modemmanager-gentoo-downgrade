#!/bin/bash

# Script to create an extra overlay in order to downgrade Modem Manager to v 0.5.2 on Gentoo
mkdir -p /usr/local/portage/profiles
echo "area51" >> /usr/local/portage/profiles/repo_name
PORT_OVERLAY="/usr/local/portage" 
mkdir -p /usr/local/portage/net-misc/modemmanager/
cp -pr /usr/portage/net-misc/modemmanager/files /usr/local/portage/net-misc/modemmanager
cd /usr/local/portage/net-misc/modemmanager/ 
ebuild modemmanager-0.5.2.0-r3.ebuild manifest
eix-update
echo  "=net-misc/modemmanager-0.6.0.0" >> /etc/portage/package.mask
emerge -av =net-misc/modemmanager-0.5.2.0-r3
