#!/bin/bash

ETHERNET_INTERFACE=en8
WIFI_INTERFACE=en0

if ifconfig $ETHERNET_INTERFACE | grep inactive; then
    osascript -e 'display notification "Enabling wifi" with title "Network change detected" subtitle "Ethernet disconnected"'
    networksetup -setairportpower $WIFI_INTERFACE on
else
    osascript -e 'display notification "Disabling wifi" with title "Network change detected" subtitle "Ethernet connected"'
    networksetup -setairportpower $WIFI_INTERFACE off
fi

# Prevent the script from starting itself
sleep 5

