#!/bin/bash

set -e

# preapre exit call
function cleanup {
  # disconnect vpnc
  echo "close vpnc connection"
  /vpn_stop.sh
}

#Trap SIGTERM
trap 'cleanup' SIGTERM


# Create the necessary file structure for /dev/net/tun
if ( [ ! -c /dev/net/tun ] ); then
  if ( [ ! -d /dev/net ] ); then
        mkdir -m 755 /dev/net
  fi
  mknod /dev/net/tun c 10 200
fi


echo "execute vpnc client"
/vpn_start.sh


if [ $? -ne 0 ]; then
  echo "error: vpnc fails"
  exit -1;
else
  # execute an command
  echo "execute ${@}"
  "${@}" &
  wait $!
fi

# if the underlying command fails by itself, also call cleanup
cleanup
