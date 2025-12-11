#!/bin/bash
# 功能:监控磁盘使用率，超90%报警

USE=$(df -h / | awk 'NR==2{print $5}' | cut -d'%' -f1)
if [ $USE -gt 90 ]; then
    echo "[$(date)] 磁盘告警: ${USE}%" >> /var/log/disk_monitor.log
else
    echo "[$(date)] 磁盘正常: ${USE}%" >> /var/log/disk_monitor.log
fi
