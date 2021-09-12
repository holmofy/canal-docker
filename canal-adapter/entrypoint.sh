#!/bin/sh

cmd=$1

case $cmd in
"startup" | "restart")
  sh /canal-adapter/bin/"${cmd}.sh" &&
    tail -F /canal-adapter/logs/adapter/adapter.log
  ;;
"stop")
  sh /canal-adapter/bin/"${cmd}.sh"
  ;;
*)
  exec "$@"
  ;;
esac
