#!/usr/bin/env bash

STATS_FILE="docker-stats-$(date +%Y%m%d-%H%M%S).csv"
SLEEP_IN_SECONDS=5

function cleanup {
    rm -rf dockerstats | true
    echo ""
    echo "All set, bye!"
}

echo "Recording docker stats every $SLEEP_IN_SECONDS second(s) to: $STATS_FILE
Use CTRL+C to abort..."

# On script exit, perform clean-up
trap cleanup EXIT

while true; do
    docker stats \
        --no-stream \
        --format "table {{.Name}};{{.CPUPerc}};{{.MemPerc}};{{.MemUsage}};{{.NetIO}};{{.BlockIO}};{{.PIDs}}" \
        > dockerstats
    tail -n +2 dockerstats | \
        tr -d '%' | \
        awk -v date="$(date +%Y-%m-%dT%H:%M:%S)" '{print date";"$0}' >> $STATS_FILE
    sleep $SLEEP_IN_SECONDS
done
