#!/bin/bash

# Verify running as root or sudoed
if [ "$EUID" -ne 0 ]
    then 
    echo "Must be root."
    exit
fi

# There are a few spots where the --do-upgrade argument is checked. This is to prevent accidental updating (and therefore, rebooting) of a server
#  this first block is to notify the user whether auto-updating is happening or if the db is just updating
if [ "$1" = "--do-upgrade" ]
    then 
        echo "Auto-Updating"
    else
        echo "--do-upgrade was not passed. Updating apt database only, and taking no further action."
fi

# Grab the current date for logging purposes
dateTime=$(date) 

# Start a fresh log. Rather than a running log I chose to create a fresh one every time this is ran so you're only ever reviewing the last patch cycle
echo "Monthly Updates for $dateTime" > updates.log
echo >> updates.log
echo "Updating apt database" >> updates.log
apt-get update >> updates.log
echo >> updates.log
echo "Auto-removing old dependencies" >> updates.log

# Auto-remove only if --do-upgrade was passed
if [ "$1" = "--do-upgrade" ]
    then 
        apt-get autoremove -y >> updates.log
    else
        echo "--do-upgrade not passed" >> updates.log
fi
echo >> updates.log
echo "Applying upgrades" >> updates.log

# Upgrade if --do-upgrade was passed. You might question why the log gets updated either way. That's basically to show a future admin "hey this would have patched at this point"
if [ "$1" = "--do-upgrade" ]
    then
        apt-get upgrade -y >> updates.log
        reboot
    else
        echo "--do-upgrade not passed" >> updates.log
fi