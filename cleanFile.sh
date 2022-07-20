#!/bin/bash
# author:kcy
# date:2022-04-07
# Read Me 
# This is a script to delete logs

# logDirectory 
logDirectory=("/data/server/cfb-domain-resource-permission/logs" "/data/server/cfb-domain-data-signs/logs" "/data/server/cfb-domain-trade/logs")
# Log retention days
logrReday=30

function delLog {
    logName=$1
    date
    echo "Deleting ${logrReday} days of【${logName}】logs"
    date
    echo `find $logsPath -mtime +$logrReday -name "${logName}"`
    find $logsPath -mtime +$logrReday -name "${logName}" -exec rm -rf {} \;
}
for logsPath in ${logDirectory[@]};do
    date
	echo "$logsPath Processing"
	logsPath=$logsPath
	delLog "prod-*.log"
    date
    echo "$logsPath processing completed"
done

