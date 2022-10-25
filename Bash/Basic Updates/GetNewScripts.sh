#!/bin/bash

# This is a script to get scripts. Grabs fresh scripts from the public repo. As well as itself. Then they can be reviewed, renamed, chmodded, and used.

dateTime=$(date +'%Y-%m-%d')

wget -O "$dateTime.MonthlyUpdates.sh" https://raw.githubusercontent.com/Steve-Schulz/LinuxUtilities/main/Bash/Basic%20Updates/MonthlyUpdates.sh
wget -O "$dateTime.GetNewScripts.sh" https://raw.githubusercontent.com/Steve-Schulz/LinuxUtilities/main/Bash/Basic%20Updates/GetNewScripts.sh