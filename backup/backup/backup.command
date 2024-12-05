#!/bin/bash

while ! ping -c 4 google.com > /dev/null; 
do
    sleep 1 
done

/opt/homebrew/bin/rclone serve restic -v cbox:keios_backup
