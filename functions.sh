#!/bin/bash
#
# Name: functions.sh
# Auth: Gavin Lloyd
# Date: 01 Dec 2010 (last modified: 18 Aug 2011)
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

msg() {
  echo -e "\033[1m$(basename $0)\033[0m: $@"
}

err() {
  msg "$@" >&2
}

warn() {
  msg "$@" >&2
  continue &> /dev/null
}

die() {
  err "$@"
  exit 1
}
