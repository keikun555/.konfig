#!/bin/sh

NON_MAIN_DISPLAY_SPACES="$(yabai -m query --displays | jq -r '.[] | select(.id == 1 | not) | .spaces | @sh')"

for space in "${NON_MAIN_DISPLAY_SPACES[@]}"
do
  echo "yabai -m space $space --padding rel:30:0:0:0"
  yabai -m space $space --padding rel:30:0:0:0
done
