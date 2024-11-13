#!/bin/sh
# run.sh

touch ./accountable.log

# Loop indefinitely
while true
do
    # Run the script
    node ./accountable.js >> ./accountable.log

    # Wait for the CRON_INTERVAL
    sleep ${CRON_INTERVAL}
done
