#!/bin/bash

show_header() {
    echo "================================="
    echo "     SYSTEM HEALTH REPORT"
    echo "================================="
}

show_date() {
    echo ""
    echo "DATE:"
    date
}

show_memory() {
    echo ""
    echo "MEMORY USAGE:"
    free -m
}

show_disk() {
    echo ""
    echo "DISK USAGE:"
    df -h
}

disk_alert() {
    echo ""
    echo "DISK ALERT CHECK"

    usage=$(df / | grep / | awk '{print $5}' | sed 's/%//')

    if [ $usage -gt 80 ]
    then
        echo "WARNING: Disk usage above 80%"
    else
        echo "Disk usage normal"
    fi
}

show_header
show_date
show_memory
show_disk
disk_alert
