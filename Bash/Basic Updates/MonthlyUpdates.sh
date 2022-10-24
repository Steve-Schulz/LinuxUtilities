#!/bin/bash
if [ "$EUID" -ne 0 ]
    then 
    echo "Must be root."
    exit
fi
#TODO: improve commenting and formatting
if [ "$1" = "--do-upgrade" ]
    then 
        echo "Auto-Updating"
    else
        echo "--do-upgrade was not passed. Updating apt database only, and taking no further action."
fi
dateTime=$(date) 
echo "Monthly Updates for $dateTime" > updates.log
echo >> updates.log
echo "Updating apt database" >> updates.log
apt-get update >> updates.log
echo >> updates.log
echo "Auto-removing old dependencies" >> updates.log
if [ "$1" = "--do-upgrade" ]
    then 
        apt-get autoremove -y >> updates.log
    else
        echo "--do-upgrade not passed" >> updates.log
fi
echo >> updates.log
echo "Applying upgrades" >> updates.log
if [ "$1" = "--do-upgrade" ]
    then
        apt-get upgrade -y >> updates.log
        reboot
    else
        echo "--do-upgrade not passed" >> updates.log
fi