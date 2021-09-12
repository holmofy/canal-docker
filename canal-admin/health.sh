#!/bin/sh

serverPort=$(env | grep -e "^server.port" | cut -d'=' -f 2)
if [ -z "$serverPort" ]; then
    serverPort=8089
fi

CHECK_URL="http://127.0.0.1:$serverPort/index.html"
CHECK_POINT="Canal"

CHECK_COUNT=$(wget -qO - $CHECK_URL | grep -c $CHECK_POINT)
if [ "$CHECK_COUNT" -eq 0 ]; then
    echo "[FAILED]"
    status=0
    error=1
else
    echo "[  OK  ]"
    status=1
    error=0
fi
