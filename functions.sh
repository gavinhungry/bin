#!/bin/bash
#
# Name: functions.sh
# Auth: Gavin Lloyd <gavinhungry@gmail.com>
# Date: 01 Dec 2010 (last modified: 07 Mar 2013)
# Desc: Small functions for shell scripts
#

if [ $BASH_SOURCE = $0 ]; then
  echo "$(basename $BASH_SOURCE) must be sourced" >&2
  exit 1
fi

usage() {
  echo -e "\033[1musage\033[0m: $(basename $0) $@"
  exit 1
}

pref() {
  [ ${!1:-0} -eq 1 ] && return
}

msg() {
  COLOR=37
  [ "$1" = "-w" ] && shift && COLOR=33
  [ "$1" = "-e" ] && shift && COLOR=31
  echo -e "\e[1;${COLOR}m$(basename $0)\e[0m: $@"
}

err() {
  msg -e "$@" >&2
}

warn() {
  msg -w "$@" >&2
  continue &> /dev/null
}

die() {
  err "$@"
  exit 1
}

