#!bin/bash

if [[ $VPN_CLIENT_VPNC_ENABLE -eq 1 ]] ; then
  vpnc $VPN_CLIENT_VPNC_CONFIG_FILE
fi

if [[ $VPN_CLIENT_OpenVPN_ENABLE -eq 1 ]] ; then
  #/etc/init.d/openvpn start
  openvpn $VPN_CLIENT_OpenVPN_CONFIG_FILE
fi
