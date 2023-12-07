#!/bin/sh

NON_MAIN_DISPLAY_SPACES="$(yabai -m query --displays | jq -r '.[] | select(.id == 1 | not) | .spaces | @sh')"

for space in ${NON_MAIN_DISPLAY_SPACES}
do
  echo "yabai -m space $space --padding abs:35:5:5:5"
  yabai -m space $space --padding abs:35:5:5:5
done
