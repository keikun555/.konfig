#!/bin/bash
local orig_gif="${1?'Missing GIF filename parameter'}"
local orig_delay=$(gifsicle -I "$orig_gif" | sed -ne 's/.*delay \([0-9.]*\)s/\1/p' | sort | uniq -d | head -n 1)
[ $(echo "$orig_delay" | wc -l) -ne 1 ] \
    && echo "Input GIF doesn't have a fixed framerate" >&2 \
    && return 1
local new_delay=$(echo "(2*100*$orig_delay)" | bc | printf "%.0f")
gifsicle -U $orig_gif `seq -f "#%g" 0 2 99` -O2 -o $orig_gif
gifsicle -d $new_delay -O2 $orig_gif -o $orig_gif
