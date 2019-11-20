#!/bin/bash
while true
do

#Get the process ID of the SymDaemon process
pid=$(ps -ax | grep SymDaemon | awk 'NR==1{print $1}')

#Get the percent cpu usage of that process.
pctCPU=$(ps -p $pid -o %cpu | awk 'NR==2{print $1}' | awk -F"." '{print $1}')


if [ "$pctCPU" -gt "30" ]
then
    sudo kill $pid
    echo "SymDaemon has been killed" >> ~/Applications/SymDaemonKillLog.txt
elif [ "$pctCPU" -lt "1" ]
then
    echo "SymDaemon is inactive" >> ~/Applications/SymDaemonKillLog.txt
else
    echo "SymDaemon persisted" >> ~/Applications/SymDaemonKillLog.txt
fi
