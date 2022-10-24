#!/bin/bash
if [ "$EUID" -ne 0 ]
    then echo "Must be root."
    exit
fi
echo "Auto-Updating"
dateTime=$(date) 
echo "Monthly Updates for $dateTime" > Updates.log
echo >> Updates.log
echo "Updating apt database" >> Updates.log
apt-get update >> Updates.log
echo >> Updates.log
echo "Auto-removing old dependencies" >> Updates.log
apt-get autoremove -y >> Updates.log
echo >> Updates.log
echo "Applying upgrades" >> Updates.log
apt-get upgrade -y >> Updates.log
reboot