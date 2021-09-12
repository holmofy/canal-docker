#!/bin/sh

cmd=$1

case $cmd in
"startup" | "restart")
  sh "/canal-admin/bin/${cmd}.sh" &&
    tail -F /canal-admin/logs/admin.log
  ;;
"stop")
  sh "/canal-admin/bin/${cmd}.sh"
  ;;
*)
  exec "$@"
  ;;
esac
