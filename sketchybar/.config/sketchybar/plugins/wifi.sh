#!/bin/sh

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

# https://github.com/FelixKratz/SketchyBar/issues/407
# INFO="$(networksetup -listallhardwareports | awk '/Wi-Fi/{getline; print $2}' | xargs networksetup -getairportnetwork | sed "s/Current Wi-Fi Network: //")"
# https://stackoverflow.com/questions/78994709/how-to-get-the-current-wi-fi-ssid-in-swift-on-macos
# INFO="$(ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}')"
# INFO="$(system_profiler SPAirPortDataType | awk '/Current Network/ {getline;$1=$1; gsub(":",""); print;exit}')"
INFO="$(ipconfig getsummary en0 | grep ' SSID' | awk '{print $3}')"


if [ "$SENDER" = "wifi_change" ]; then
  WIFI=${INFO:-"Not Connected"}
  sketchybar --set $NAME label="${WIFI}"
fi
