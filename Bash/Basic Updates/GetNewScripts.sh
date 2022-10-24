#!/bin/bash

fetchDate=$(date +'%Y-%m-%d')
wget -O "${fetchDate}.MonthlyUpdates.sh" https://raw.githubusercontent.com/Steve-Schulz/LinuxUtilities/ef3c5ab47f5a11d238d166f5013c3c82d8bf3955/Bash/Basic%20Updates/MonthlyUpdates.sh
wget -O "${fetchDate}.GetNewScripts.sh" https://raw.githubusercontent.com/Steve-Schulz/LinuxUtilities/c044ba72a5766fa45551ab338d29c323b3def5f6/Bash/Basic%20Updates/GetNewScripts.sh