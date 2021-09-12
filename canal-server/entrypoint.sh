#!/bin/sh

destination=$(env | grep -e "^canal.destinations" | cut -d'=' -f 2)
if expr "$destination" : "," >/dev/null; then
  echo "multi destination:$destination is not support"
  exit 1
else
  if [ "$destination" != "" ] && [ "$destination" != "example" ]; then
    if [ -d /home/admin/canal-server/conf/example ]; then
      mv /home/admin/canal-server/conf/example "/home/admin/canal-server/conf/$destination"
    fi
  fi
fi

cmd=$1

case $cmd in
"startup" | "restart")
  sh "/canal-server/bin/${cmd}.sh" &&
    sleep 5s && cat /canal-server/logs/canal/canal.log &&
    tail -F "/canal-server/logs/$destination/$destination.log"
  ;;
"stop")
  sh "/canal-server/bin/${cmd}.sh"
  ;;
*)
  exec "$@"
  ;;
esac
