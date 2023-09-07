#!/bin/sh

VPN=$(ps aux | rg openconnect | rg -v rg | cut -w -f11)

if [[ $VPN != "" ]]; then
  sketchybar -m --set vpn icon= \
                          label="$VPN" \
                          drawing=on
else
  sketchybar -m --set vpn drawing=off
fi

