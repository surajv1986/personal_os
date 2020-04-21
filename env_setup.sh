#!/bin/bash
#exit when any command fails
set -e
# keep track of the last executed command
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
# echo an error message before exiting
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
#start interaction i.e sudo block
sudo rm /etc/sytemd/system/default.target
sudo ln -sf /lib/systemd/system/graphical.target /etc/systemd/system/default.target
sudo yum -y update
sudo yum -y install gcc kernel-devel
echo export KERN_DIR=/usr/src/kernels/'unamec-r' >> ~/.bashrc
reboot

