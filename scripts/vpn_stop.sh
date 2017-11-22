#!/bin/bash

if [[ $VPN_CLIENT_VPNC_ENABLE -eq 1 ]] ; then
  vpnc-disconnect
fi

if [[ $VPN_CLIENT_OpenVPN_ENABLE -eq 1 ]] ; then
  #/etc/init.d/openvpn stop
  killall openvpn
fi
