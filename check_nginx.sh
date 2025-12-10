#!/bin/bash
# 监控Nginx容器是否存活，挂了自动重启

while true; do
  # 测试Nginx是否能访问（静默模式，不输出）
  if ! curl -s http://localhost:8080 > /dev/null; then
    # 如果访问失败，记录日志并重启容器
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Nginx DOWN, restarting..." >> /var/log/nginx_monitor.log
    docker restart my-nginx
  else
    # 如果正常，记录日志
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Nginx OK" >> /var/log/nginx_monitor.log
  fi
  
  # 每30秒检查一次
  sleep 30
done
EOF
