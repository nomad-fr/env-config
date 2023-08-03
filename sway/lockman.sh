#!/bin/bash
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
# Locks the screen immediately
swaylock -F -c 550000 -i /home/nomad/Pictures/bg-lock.jpg
# Kills last background task so idle timer doesn't keep running
kill $!
