#! /bin/sh
# This file contains functions which wrap around the programs which normally
# control the function of your wireless devices, and also some things to help
# automatically handle a few others. It's a sort of ongoing project, which is
# not going to be made in any particularly sensible order, but it's going to
# be fireaxe specific.

# Poll for data which may correspond to networking devices which we might want
# to use.

HAS_USB0=$(ip link | grep -io 'usb\w')
HAS_ENP0=$(ip link | grep -io 'enp0s\w\wu\w')

# This sets up USB tethering with an Android device for which it is enabled.
# Requires root.
dhclient_wrapper(){
        xterm -e sudo -- bash -c "dhclient $1 &"
}

usbadroid(){
        [ -f /sbin/dhclient ] && [ -z "$HAS_USB0" ] && dhclient_wrapper $HAS_USB0
        [ -f /sbin/dhclient ] && [ -z "$HAS_ENP0" ] && dhclient_wrapper $HAS_ENP0
}

#wlan(){}

#eth(){}

#vpn(){}

#torwide(){}
