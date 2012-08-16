#!/bin/bash

case $1 in
  (restart | stop | start)
    /usr/bin/sudo /usr/sbin/rc.d "$@" ;;
  (*)
    /usr/sbin/rc.d "$@" ;;
esac