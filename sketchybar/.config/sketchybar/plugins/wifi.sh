#!/bin/sh

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.
#
# https://github.com/FelixKratz/SketchyBar/issues/407
INFO="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"


if [ "$SENDER" = "wifi_change" ]; then
  WIFI=${INFO:-"Not Connected"}
  sketchybar --set $NAME label="${WIFI}"
fi
